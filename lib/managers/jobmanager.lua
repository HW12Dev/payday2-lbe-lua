JobManager = JobManager or class()
JobManager.JOB_HEAT_MAX_VALUE = 100

function JobManager:init()
	self:_setup()
end

function JobManager:_setup()
	if not Global.job_manager then
		Global.job_manager = {}

		self:_setup_job_heat()
		self:_setup_heat_job_containers()
		self:_setup_job_ghosts()
	end

	self._global = Global.job_manager
end

function JobManager:_setup_job_ghosts()
	Global.job_manager.saved_ghost_bonus = Application:digest_value(0, true)
	Global.job_manager.active_ghost_bonus = nil
	Global.job_manager.accumulated_ghost_bonus = nil
end

function JobManager:reset_ghost_bonus()
	self:_setup_job_ghosts()
end

function JobManager:clear_saved_ghost_bonus()
	if self:current_job_id() == "safehouse" or self:current_job_id() == "chill" or self:is_job_finished() or self:stage_success() and self:on_last_stage() then
		return
	end

	self._global.saved_ghost_bonus = Application:digest_value(0, true)
end

function JobManager:start_accumulate_ghost_bonus(job_id)
	if job_id ~= "safehouse" then
		self._global.active_ghost_bonus = self._global.saved_ghost_bonus
		self._global.accumulated_ghost_bonus = {
			job_id = job_id,
			bonus = Application:digest_value(0, true)
		}
	else
		self._global.active_ghost_bonus = nil
		self._global.accumulated_ghost_bonus = nil
	end
end

function JobManager:accumulate_ghost_bonus()
	if self:has_active_job() and self:current_job_id() ~= "safehouse" and self:current_job_id() ~= "chill" then
		local stage_data = self:current_stage_data()
		local level_data = self:current_level_data()
		local stage = self:current_stage()
		local stage_success = self:stage_success()
		local ghost_success = managers.groupai and managers.groupai:state():whisper_mode()
		local ghost_bonus = stage_data and stage_data.ghost_bonus or level_data and level_data.ghost_bonus or tweak_data.narrative.DEFAULT_GHOST_BONUS or 0
		local agb = self._global.accumulated_ghost_bonus
		local job_id = self:current_job_id()
		local level_id = self:current_level_id()

		if not agb or not job_id or agb.job_id ~= job_id then
			return 0
		end

		local stage_ghost_data = self._global.accumulated_ghost_bonus[stage]

		if stage_ghost_data and (stage_ghost_data.stage_success or stage_ghost_data.level_id ~= level_id) then
			return 0
		end

		local ghost_data = {
			level_id = level_id,
			stage_success = stage_success,
			ghost_success = ghost_success
		}

		if stage_success and ghost_success then
			ghost_data.bonus = Application:digest_value(ghost_bonus, true)
			local bonus = Application:digest_value(agb.bonus, false) + ghost_bonus
			self._global.accumulated_ghost_bonus.bonus = Application:digest_value(bonus, true)
		else
			ghost_data.bonus = Application:digest_value(0, true)
		end

		self._global.accumulated_ghost_bonus[stage] = ghost_data

		return stage_success and ghost_success and ghost_bonus or 0
	end

	return 0
end

function JobManager:activate_accumulated_ghost_bonus()
	if self:current_job_id() ~= "safehouse" and self:current_job_id() ~= "chill" then
		local agb = self._global.accumulated_ghost_bonus
		local job_id = self:current_job_id()

		if not agb or not job_id or agb.job_id ~= job_id then
			self:_set_ghost_bonus(0, true)

			return
		end

		self:_set_ghost_bonus(agb.bonus, false)
	end
end

function JobManager:_set_ghost_bonus(ghost_bonus, digest)
	Application:debug("[JobManager:_set_ghost_bonus]", "ghost_bonus", ghost_bonus, "digest", digest)

	self._global.saved_ghost_bonus = digest and Application:digest_value(ghost_bonus, true) or ghost_bonus
	self._global.accumulated_ghost_bonus = nil
end

function JobManager:get_accumulated_ghost_bonus()
	if not self._global.accumulated_ghost_bonus then
		return nil
	end

	local agb = self._global.accumulated_ghost_bonus
	local accumulated = {
		job_id = agb.job_id,
		bonus = Application:digest_value(agb.bonus, false)
	}

	for i, level_data in ipairs(agb) do
		table.insert(accumulated, {
			level_id = level_data.level_id,
			bonus = Application:digest_value(level_data.bonus, false),
			stage_success = level_data.stage_success or false,
			ghost_success = level_data.ghost_success or false
		})
	end

	return accumulated
end

function JobManager:get_saved_ghost_bonus()
	if self:current_job_id() ~= "safehouse" and self:current_job_id() ~= "chill" then
		return self._global.saved_ghost_bonus and Application:digest_value(self._global.saved_ghost_bonus, false) or 0
	end

	return 0
end

function JobManager:get_ghost_bonus()
	return self._global.active_ghost_bonus and Application:digest_value(self._global.active_ghost_bonus, false) or self._global.saved_ghost_bonus and Application:digest_value(self._global.saved_ghost_bonus, false) or 0
end

function JobManager:has_ghost_bonus()
	return self:get_ghost_bonus() > 0
end

function JobManager:is_job_stage_ghostable(job_id, stage)
	local job_data = tweak_data.narrative.jobs[job_id]

	if not job_data then
		return false
	end

	if tweak_data.narrative:has_job_wrapper(job_id) then
		for i, wrapped_job_id in ipairs(tweak_data.narrative.jobs[job_id].job_wrapper) do
			if self:is_job_stage_ghostable(wrapped_job_id, stage) then
				return true
			end
		end

		return false
	end

	local chain = job_data.chain

	if not chain then
		return false
	end

	local level_data = chain[stage] or {}

	if #level_data > 0 then
		for _, alt_level_data in ipairs(level_data) do
			if self:_is_level_ghostable(tweak_data.levels[alt_level_data.level_id]) then
				return true
			end
		end
	elseif self:_is_level_ghostable(tweak_data.levels[level_data.level_id]) then
		return true
	end

	return false
end

function JobManager:is_job_ghostable(job_id)
	local job_data = tweak_data.narrative.jobs[job_id]

	if not job_data then
		return false
	end

	if tweak_data.narrative:has_job_wrapper(job_id) then
		for i, wrapped_job_id in ipairs(tweak_data.narrative.jobs[job_id].job_wrapper) do
			if self:is_job_ghostable(wrapped_job_id) then
				return true
			end
		end

		return false
	end

	local chain = job_data.chain

	if not chain then
		return false
	end

	for _, level_data in ipairs(chain) do
		if #level_data > 0 then
			for _, alt_level_data in ipairs(level_data) do
				if self:_is_level_ghostable(tweak_data.levels[alt_level_data.level_id]) then
					return true
				end
			end
		elseif self:_is_level_ghostable(tweak_data.levels[level_data.level_id]) then
			return true
		end
	end

	return false
end

function JobManager:get_job_ghost_bonus(job_id)
	local job_data = tweak_data.narrative.jobs[job_id]

	if not job_data then
		return false
	end

	if tweak_data.narrative:has_job_wrapper(job_id) then
		local min_ghost_bonus, max_ghost_bonus, min_bonus, max_bonus = nil

		for i, wrapped_job_id in ipairs(tweak_data.narrative.jobs[job_id].job_wrapper) do
			min_bonus, max_bonus = self:get_job_ghost_bonus(wrapped_job_id)

			if min_bonus then
				min_ghost_bonus = min_ghost_bonus and math.min(min_ghost_bonus, min_bonus) or min_bonus
				max_ghost_bonus = max_ghost_bonus and math.max(max_ghost_bonus, max_bonus) or max_bonus
			end
		end

		return min_ghost_bonus, max_ghost_bonus
	end

	local chain = job_data.chain

	if not chain then
		return false
	end

	local function math_min(a, b)
		if not a then
			return b or 0
		end

		if not b then
			return a or 0
		end

		return math.min(a, b)
	end

	local function math_max(a, b, c)
		if not a then
			return b or 0
		end

		if not b then
			return a or 0
		end

		return c and math.max(a, b) or a + b
	end

	local min_ghost_bonus, max_ghost_bonus = nil

	for _, level_data in ipairs(chain) do
		if #level_data > 0 then
			local min_bonus, max_bonus = nil

			for _, alt_level_data in ipairs(level_data) do
				local bonus = self:_is_level_ghostable(tweak_data.levels[alt_level_data.level_id])

				if bonus then
					min_bonus = math_min(min_bonus, bonus, true)
					max_bonus = math_max(max_bonus, bonus, true)
				end
			end

			min_ghost_bonus = math_min(min_ghost_bonus, min_bonus)
			max_ghost_bonus = math_max(max_ghost_bonus, max_bonus)
		else
			local bonus = self:_is_level_ghostable(tweak_data.levels[level_data.level_id])

			if bonus then
				min_ghost_bonus = math_min(min_ghost_bonus, bonus)
				max_ghost_bonus = math_max(max_ghost_bonus, bonus)
			end
		end
	end

	return min_ghost_bonus, max_ghost_bonus
end

function JobManager:_is_level_ghostable(level_data)
	return level_data and level_data.ghost_bonus
end

function JobManager:is_level_ghostable(level_id)
	local ghost_bonus = self:_is_level_ghostable(tweak_data.levels[level_id])

	return ghost_bonus and ghost_bonus > 0
end

function JobManager:is_level_ghostable_required(level_id)
	local level_data = tweak_data.levels[level_id]

	return level_data and level_data.ghost_required
end

function JobManager:_setup_job_heat()
	local heat = {}
	Global.job_manager.heat = heat

	for _, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
		if not tweak_data.narrative:is_wrapped_to_job(job_id) then
			heat[job_id] = self:_get_default_heat()
		end
	end
end

function JobManager:_get_default_heat()
	return 0
end

function JobManager:_get_wrapped_default_heat(job_id)
	local heat = self:_get_default_heat()
	local job_wrapper = tweak_data.narrative.jobs[job_id].job_wrapper

	for i, job in ipairs(job_wrapper) do
		heat = heat + (self:_get_job_heat(job) or 0)
	end

	return math.clamp(heat, -self.JOB_HEAT_MAX_VALUE, self.JOB_HEAT_MAX_VALUE)
end

function JobManager:heat_to_value(heat)
	return self:heat_to_experience_value(heat)
end

function JobManager:_setup_heat_job_containers()
	local containers = {}
	Global.job_manager.heat_containers = containers
	local num_containers = #tweak_data.narrative.MAX_JOBS_IN_CONTAINERS
	local step = self.JOB_HEAT_MAX_VALUE * 2 / num_containers

	for i, max_jobs in ipairs(tweak_data.narrative.MAX_JOBS_IN_CONTAINERS) do
		local heat = math.ceil(i * step - self.JOB_HEAT_MAX_VALUE)

		table.insert(containers, {
			heat = heat,
			max_jobs = tonumber(max_jobs) or false
		})
	end
end

function JobManager:_chk_fill_heat_containers()
	local all_jobs = {}

	for job_id, heat in pairs(self._global.heat) do
		table.insert(all_jobs, {
			job_id = job_id,
			heat = heat
		})
	end

	local xh, yh = nil

	table.sort(all_jobs, function (x, y)
		xh = x.heat
		yh = y.heat

		return xh < yh
	end)

	local jobs_in_containers = deep_clone(self._global.heat_containers)

	for i, container in ipairs(jobs_in_containers) do
		while container[1] do
			table.remove(container, 1)
		end
	end

	for _, job_data in ipairs(all_jobs) do
		local add_last = true

		for i, container in ipairs(jobs_in_containers) do
			if job_data.heat <= container.heat then
				table.insert(jobs_in_containers[i], job_data)

				add_last = false

				break
			end
		end

		if add_last then
			table.insert(jobs_in_containers[#jobs_in_containers], job_data)
		end
	end

	local reached_end = false
	local loop_breaker = 100

	while not reached_end and loop_breaker > 0 do
		reached_end = true

		for index, container in ipairs(jobs_in_containers) do
			local max_jobs = container.max_jobs
			local heat = container.heat

			if max_jobs and max_jobs < #container then
				reached_end = false
				local num_to_move = #container - max_jobs
				local new_container = nil

				if heat < 0 then
					new_container = jobs_in_containers[index + 1]

					for i = 1, num_to_move do
						local t = table.remove(container, #container)

						table.insert(new_container, 1, t)
					end
				elseif heat > 0 then
					new_container = jobs_in_containers[index - 1]

					for i = 1, num_to_move do
						local t = table.remove(container, 1)

						table.insert(new_container, t)
					end

					break
				end
			end
		end

		loop_breaker = loop_breaker - 1
	end

	self._global.heat_containers = {}
	local prev_heat = -100

	for index, container in ipairs(jobs_in_containers) do
		self._global.heat_containers[index] = {
			heat = container.heat,
			max_jobs = container.max_jobs
		}

		for i = 1, #container do
			container[i].heat = math.clamp(container[i].heat, prev_heat, container.heat)
			self._global.heat[container[i].job_id] = container[i].heat

			table.insert(self._global.heat_containers[index], container[i].job_id)
		end

		prev_heat = container.heat + 1
	end
end

function JobManager:get_num_containers()
	return #self._global.heat_containers
end

function JobManager:get_job_container_index(job_id)
	for i, container in ipairs(self._global.heat_containers) do
		if table.contains(container, job_id) then
			return i
		end
	end
end

function JobManager:get_heat_container_index(heat)
	for i, container in ipairs(self._global.heat_containers) do
		if heat <= container.heat then
			return i
		end
	end
end

function JobManager:_get_container(container_index)
	return self._global.heat_containers[container_index]
end

function JobManager:debug_get_all_heat_info()
	Application:debug("[JobManager:debug_get_all_heat_multipliers]")

	local t = {}

	for job_id, heat in pairs(self._global.heat) do
		local t = {
			job_id = job_id,
			heat = heat,
			xp_mul = self:heat_to_experience_multiplier(heat),
			money_mul = self:heat_to_money_multiplier(heat)
		}

		print(inspect(t))
	end

	Application:debug("-------------------------------------------")
end

function JobManager:heat_to_experience_value(heat)
	local value = 100

	if heat < 0 then
		local equation = "-0.00032*math.pow(x,3) - 0.0481*math.pow(x,2) - 0.6*(x) + 100"
		local heated_equation = string.gsub(equation, "x", tostring(heat))
		value = math.clamp(loadstring("return " .. heated_equation)(), 0, 100)
		value = math.clamp(value * (1 - tweak_data.narrative.FREEZING_MAX_XP_MUL) + 100 * tweak_data.narrative.FREEZING_MAX_XP_MUL, 0, 100)
	elseif heat > 0 then
		local equation = "(-0.00032*math.pow(x,3) + 0.048*math.pow(x,2) - 0.6*(x))"
		local heated_equation = string.gsub(equation, "x", tostring(heat))
		value = math.clamp(loadstring("return " .. heated_equation)(), 0, 100)
		value = math.max(value * (tweak_data.narrative.HEATED_MAX_XP_MUL - 1), 0) + 100
	end

	value = math.round(value)

	return value
end

function JobManager:heat_to_experience_multiplier(heat)
	return self:heat_to_experience_value(heat) / 100
end

function JobManager:last_known_heat()
	return self._last_known_heat
end

function JobManager:current_job_heat_color()
	local job_id = self:current_real_job_id()

	return job_id and self:get_job_heat_color(job_id) or tweak_data.screen_colors.heat_standard_color
end

function JobManager:get_job_heat_color(job_id)
	local job_heat = self:_get_job_heat(job_id) or 0

	return self:get_heat_color(job_heat)
end

function JobManager:get_heat_color(heat)
	return heat < 0 and tweak_data.screen_colors.heat_cold_color or heat > 0 and tweak_data.screen_colors.heat_warm_color or tweak_data.screen_colors.heat_standard_color
end

function JobManager:heat_to_money_value(heat)
	local value = 100

	if heat < 0 then
		local equation = "100"
		local heated_equation = string.gsub(equation, "x", tostring(heat))
		value = math.clamp(loadstring("return " .. heated_equation)(), 0, 100)
	elseif heat > 0 then
		local equation = "100"
		local heated_equation = string.gsub(equation, "x", tostring(heat))
		value = math.clamp(loadstring("return " .. heated_equation)(), 100, 200)
	end

	return value
end

function JobManager:heat_to_money_multiplier(heat)
	return self:heat_to_money_value(heat) / 100
end

function JobManager:current_job_heat_multipliers()
	if not self:has_active_job() then
		return
	end

	local job_id = self:current_real_job_id()

	return self:get_job_heat_multipliers(job_id)
end

function JobManager:get_job_heat_multipliers(job_id)
	if not job_id then
		return 1
	end

	local heat = self:_get_job_heat(job_id) or 0
	local xp_mul = self:heat_to_experience_multiplier(heat)
	local money_mul = self:heat_to_money_multiplier(heat)

	return xp_mul
end

function JobManager:_debug_play_rats()
	self:_check_add_heat_to_jobs("alex", true)
	self:plot_heat_graph()
end

function JobManager:debug_heat_job(job_id)
	self:_check_add_heat_to_jobs(job_id, true)
	self:plot_heat_graph()
end

function JobManager:_debug_spew_heat()
	local job_id = nil
	local n = #tweak_data.narrative:get_jobs_index()
	local spewed = {}

	for i = 1, 10 do
		job_id = tweak_data.narrative:get_job_name_from_index(math.random(n))

		self:_check_add_heat_to_jobs(job_id, true)
		table.insert(spewed, job_id)
	end

	print(inspect(spewed))
	self:plot_heat_graph()
end

function JobManager:check_add_heat_to_jobs()
	print("[JobManager:check_add_heat_to_jobs]")

	if self:on_last_stage() then
		self:_check_add_heat_to_jobs()
	end
end

function JobManager:_check_add_heat_to_jobs(debug_job_id, ignore_debug_prints)
	if not self._global.heat then
		self:_setup_job_heat()
	end

	local current_job = debug_job_id or self:current_real_job_id()

	if not current_job then
		Application:error("[JobManager:_check_add_heat_to_jobs] No current job.")

		return
	end

	if current_job == "safehouse" or self:current_job_id() == "chill" then
		return
	end

	local current_job_heat = self._global.heat[current_job]

	if not current_job_heat then
		Application:error("[JobManager:_check_add_heat_to_jobs] Job have no heat. If this is safehouse, IGNORE ME!", current_job)

		return
	end

	local is_current_job_freezing = current_job_heat == -self.JOB_HEAT_MAX_VALUE

	if is_current_job_freezing and tweak_data.narrative.ABSOLUTE_ZERO_JOBS_HEATS_OTHERS == false then
		Application:debug("[JobManager:_check_add_heat_to_jobs] Current job is frozen, cant give heat to other jobs.", current_job)

		return
	end

	local job_tweak_data = tweak_data.narrative.jobs[current_job]

	if not job_tweak_data then
		Application:error("[JobManager:_check_add_heat_to_jobs] Current job do not exists in NarrativeTweakData.lua", current_job)

		return
	end

	local job_heat_data = job_tweak_data.heat

	if not job_heat_data and not ignore_debug_prints then
		-- Nothing
	end

	local plvl = managers.experience:current_level()
	local prank = managers.experience:current_rank()
	local all_jobs = {}

	for job_id, heat in pairs(self._global.heat) do
		local is_not_this_job = job_id ~= current_job
		local is_cooldown_ok = self:check_ok_with_cooldown(job_id)
		local is_not_wrapped = not job_tweak_data.wrapped_to_job
		local is_not_dlc_or_got = not job_tweak_data.dlc or managers.dlc:is_dlc_unlocked(job_tweak_data.dlc)
		local pass_all_tests = is_cooldown_ok and is_not_wrapped and is_not_dlc_or_got and is_not_this_job

		if pass_all_tests then
			table.insert(all_jobs, job_id)
		end
	end

	local other_jobs_ratio = math.clamp(math.round(tweak_data.narrative.HEAT_OTHER_JOBS_RATIO * #all_jobs), 0, #all_jobs)
	local heated_jobs = {}

	for i = 1, other_jobs_ratio do
		table.insert(heated_jobs, table.remove(all_jobs, math.random(#all_jobs)))
	end

	local cooling = job_heat_data and job_heat_data.this_job or tweak_data.narrative.DEFAULT_HEAT.this_job or 0
	local heating = job_heat_data and job_heat_data.other_jobs or tweak_data.narrative.DEFAULT_HEAT.other_jobs or 0
	local debug_current_job_heat = self._global.heat[current_job]
	local debug_other_jobs_heat = {}
	self._last_known_heat = self._global.heat[current_job]

	self:_change_job_heat(current_job, cooling, true)

	for _, job_id in ipairs(heated_jobs) do
		debug_other_jobs_heat[job_id] = self._global.heat[job_id]

		self:_change_job_heat(job_id, heating)
	end

	self:_chk_fill_heat_containers()

	if ignore_debug_prints then
		return
	end

	Application:debug("[JobManager:_check_add_heat_to_jobs] Heat:")
	print(tostring(current_job) .. ": " .. tostring(debug_current_job_heat) .. " -> " .. tostring(self._global.heat[current_job]))

	for job_id, old_heat in pairs(debug_other_jobs_heat) do
		print(tostring(job_id) .. ": " .. tostring(old_heat) .. " -> " .. tostring(self._global.heat[job_id]))
	end

	Application:debug("------------------------------------------")
end

function JobManager:_change_job_heat(job_id, heat, cap_heat)
	self._global.heat[job_id] = self._global.heat[job_id] + heat

	if cap_heat then
		self._global.heat[job_id] = math.min(self._global.heat[job_id], 0)
	end

	self:_chk_is_heat_correct(job_id)
end

function JobManager:set_job_heat(job_id, new_heat, cap_heat)
	self._global.heat[job_id] = new_heat

	if cap_heat then
		self._global.heat[job_id] = math.min(self._global.heat[job_id], 0)
	end

	self:_chk_is_heat_correct(job_id)
end

function JobManager:_get_job_heat(job_id)
	if tweak_data.narrative:is_wrapped_to_job(job_id) then
		return self:_get_job_heat(tweak_data.narrative.jobs[job_id].wrapped_to_job)
	end

	return self._global.heat[job_id]
end

function JobManager:get_job_heat(job_id)
	return self:_get_job_heat(job_id)
end

function JobManager:current_job_heat()
	local current_job = self:current_real_job_id()

	if not current_job then
		Application:error("[JobManager:current_job_heat] No current job.")

		return 0
	end

	return self._global.heat[current_job]
end

function JobManager:on_buy_job(job_id, difficulty_id)
	local heat = self._global.heat[job_id]

	if not heat then
		return
	end

	self._last_known_heat = heat
	heat = math.min(heat, 0)
	self._global.heat[job_id] = heat

	self:_chk_is_heat_correct(job_id)
	self:_chk_fill_heat_containers()
end

function JobManager:plot_heat_graph(remove_only)
	local ws = managers.menu_component._ws
	local old_plot = ws:panel():child("JobManager_TEST_PANEL")

	if alive(old_plot) then
		ws:panel():remove(old_plot)
	end

	if remove_only then
		return
	end

	local my_panel = ws:panel():panel({
		name = "JobManager_TEST_PANEL"
	})

	my_panel:set_size(500, 500)
	my_panel:set_center(ws:panel():w() / 2, ws:panel():h() / 2)
	my_panel:set_position(math.round(my_panel:x()), math.round(my_panel:y()))

	local border = my_panel:rect({
		rotation = 360,
		layer = 0,
		color = Color.blue
	})

	my_panel:rect({
		layer = 1,
		color = Color.black
	})
	my_panel:rect({
		w = 1,
		layer = 2,
		color = Color.green,
		h = my_panel:h()
	}):set_x(my_panel:w() / 2)
	my_panel:rect({
		h = 1,
		layer = 2,
		color = Color.green,
		w = my_panel:w()
	}):set_y(my_panel:h() / 2)

	for i = 1, #self._global.heat_containers do
		local container_line = my_panel:rect({
			w = 1,
			rotation = 360,
			layer = 2,
			color = Color.white,
			h = my_panel:h()
		})

		container_line:set_x(my_panel:w() * i / #self._global.heat_containers + 1)

		local container = self._global.heat_containers[i]
		local text = container.max_jobs and tostring(#container) .. "/" .. tostring(container.max_jobs) or tostring(#container)
		local obj = my_panel:text({
			y = 10,
			align = "center",
			layer = 3,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			text = text
		})

		obj:set_center_x(my_panel:w() * (i - 0.5) / #self._global.heat_containers)
		container_line:set_visible(i < #self._global.heat_containers)
	end

	local all_jobs = {}

	for job_id, heat in pairs(self._global.heat) do
		local x = (heat + self.JOB_HEAT_MAX_VALUE) * my_panel:w() / (self.JOB_HEAT_MAX_VALUE * 2)

		my_panel:rect({
			h = 2,
			w = 2,
			layer = 3,
			color = Color.red,
			x = x - 1,
			y = math.random(30) + 30
		})
	end

	border:grow(2, 2)
	border:move(-1, -1)

	local points = {}
	local prev_y = nil

	for i = -self.JOB_HEAT_MAX_VALUE, self.JOB_HEAT_MAX_VALUE do
		local x = (i + self.JOB_HEAT_MAX_VALUE) * my_panel:w() / (self.JOB_HEAT_MAX_VALUE * 2)
		local y = self:heat_to_experience_value(i) * my_panel:h() / 200

		if prev_y and y < prev_y then
			print("Previous value are higher!", "i=" .. tostring(i), "y=" .. tostring(y), "prev_y=" .. tostring(prev_y))
		end

		prev_y = y

		table.insert(points, Vector3(x, my_panel:h() - y, 0))
	end

	my_panel:polyline({
		line_width = 2,
		layer = 3,
		color = Color.red,
		points = points
	})

	points = {}
	prev_y = nil

	for i = -self.JOB_HEAT_MAX_VALUE, self.JOB_HEAT_MAX_VALUE do
		local x = (i + self.JOB_HEAT_MAX_VALUE) * my_panel:w() / (self.JOB_HEAT_MAX_VALUE * 2)
		local y = self:heat_to_money_value(i) * my_panel:h() / 200

		if prev_y and y < prev_y then
			print("Previous value are higher!", "i=" .. tostring(i), "y=" .. tostring(y), "prev_y=" .. tostring(prev_y))
		end

		prev_y = y

		table.insert(points, Vector3(x, my_panel:h() - y, 0))
	end
end

function JobManager:_chk_is_heat_correct(job_id)
	local heat = self._global.heat[job_id]

	if not heat then
		Application:error("[JobManager:_chk_is_heat_correct] Do not have heat for job", job_id)

		return
	end

	local heat_type = type(heat)

	if heat_type ~= "number" then
		heat = self:_get_default_heat()
		self._global.heat[job_id] = heat
	end

	heat = math.clamp(heat, -self.JOB_HEAT_MAX_VALUE, self.JOB_HEAT_MAX_VALUE)
	self._global.heat[job_id] = heat
end

function JobManager:reset_job_heat()
	self:_setup_job_heat()
	self:_setup_heat_job_containers()
	self:_chk_fill_heat_containers()
end

function JobManager:save(data)
	local save_data = {
		heat = deep_clone(Global.job_manager.heat),
		ghost_bonus = Application:digest_value(Global.job_manager.saved_ghost_bonus, false)
	}
	data.job_manager = save_data
end

function JobManager:load(data)
	if data.job_manager then
		self._global.heat = data.job_manager.heat or self._global.heat

		if not self._global.heat then
			self:_setup_job_heat()
			Application:error("[JobManager:load] Job heat should already be setup'd!")
		end

		for _, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
			if not self._global.heat[job_id] then
				Application:debug("[JobManager:load] Adding new job heat", job_id)

				if tweak_data.narrative:has_job_wrapper(job_id) then
					self._global.heat[job_id] = self:_get_wrapped_default_heat(job_id)
				else
					self._global.heat[job_id] = self:_get_default_heat()
				end
			end
		end

		self:_chk_fill_heat_containers()

		local invalid_jobs = {}

		for job_id, heat in pairs(self._global.heat) do
			if tweak_data.narrative:get_index_from_job_id(job_id) == 0 or tweak_data.narrative:is_wrapped_to_job(job_id) then
				table.insert(invalid_jobs, job_id)
			else
				self:_chk_is_heat_correct(job_id)
			end
		end

		for _, job_id in ipairs(invalid_jobs) do
			Application:debug("[JobManager:load] Removing invalid job heat", job_id)

			self._global.heat[job_id] = nil
		end

		self._global.saved_ghost_bonus = data.job_manager.ghost_bonus or self._global.saved_ghost_bonus

		if type(self._global.saved_ghost_bonus) == "number" then
			self._global.saved_ghost_bonus = Application:digest_value(self._global.saved_ghost_bonus, true)
		end
	end
end

function JobManager:on_retry_job_stage()
	self:_on_retry_job_stage()

	if managers.network:session() then
		managers.network:session():send_to_peers_synched("sync_on_retry_job_stage")
	end
end

function JobManager:synced_on_retry_job_stage()
	self:_on_retry_job_stage()
end

function JobManager:_on_retry_job_stage()
	managers.game_play_central:stop_the_game()
	managers.experience:mission_xp_process(false)

	self._global.shortterm_memory = {}
	self._global.next_alternative_stage = nil
	self._global.next_interupt_stage = nil
end

function JobManager:synced_alternative_stage(alternative)
	self._global.alternative_stage = alternative
end

function JobManager:set_next_alternative_stage(alternative)
	self._global.next_alternative_stage = alternative
end

function JobManager:alternative_stage()
	return self._global.alternative_stage
end

function JobManager:synced_interupt_stage(interupt, is_synced_from_server)
	self._is_synced_from_server = is_synced_from_server
	self._global.next_interupt_stage = nil
	self._global.interupt_stage = interupt
end

function JobManager:set_next_interupt_stage(interupt)
	self._global.next_interupt_stage = interupt
end

function JobManager:interupt_stage()
	return self._global.interupt_stage
end

function JobManager:set_memory(key, value, is_shortterm)
	if self._global.memory and not is_shortterm then
		self._global.memory[key] = value
	elseif self._global.shortterm_memory then
		self._global.shortterm_memory[key] = value
	end

	return false
end

function JobManager:get_memory(key, is_shortterm)
	if is_shortterm then
		return self._global.shortterm_memory and self._global.shortterm_memory[key]
	else
		return self._global.memory and self._global.memory[key]
	end
end

function JobManager:has_active_job()
	return self._global.current_job and true or false
end

function JobManager:activate_job(job_id, current_stage)
	local job = tweak_data.narrative.jobs[job_id]

	if not job then
		Application:error("No job named", job_id, "!")

		return
	end

	if job.job_wrapper then
		local wrapped_job_id = nil

		if job.wrapper_weights then
			local total_weight = 0

			for job_index, weight in ipairs(job.wrapper_weights) do
				total_weight = total_weight + weight
			end

			local roll = math.rand(total_weight)

			for job_index, job_id in ipairs(job.job_wrapper) do
				roll = roll - (job.wrapper_weights[job_index] or 1)

				if roll <= 0 then
					wrapped_job_id = job_id

					break
				end
			end
		else
			wrapped_job_id = job.job_wrapper[math.random(#job.job_wrapper)]
		end

		return self:activate_job(wrapped_job_id, current_stage)
	end

	local job_wrapper_id = nil
	local wrapped_job_id = job_id

	while tweak_data.narrative:is_wrapped_to_job(wrapped_job_id) do
		job_wrapper_id = tweak_data.narrative.jobs[wrapped_job_id].wrapped_to_job
		wrapped_job_id = job_wrapper_id
	end

	self._global.current_job = {
		last_completed_stage = 0,
		job_id = job_id,
		job_wrapper_id = job_wrapper_id,
		current_stage = current_stage or 1,
		stages = job.chain and #job.chain or math.huge - 1
	}
	self._global.start_time = TimerManager:wall_running():time()

	self:start_accumulate_ghost_bonus(job_id)
	managers.experience:mission_xp_clear()
	self:stop_sounds()

	self._global.memory = {}
	self._global.shortterm_memory = {}

	return true
end

function JobManager:deactivate_current_job()
	self._global.current_job = nil
	self._global.alternative_stage = nil
	self._global.next_alternative_stage = nil
	self._global.interupt_stage = nil
	self._global.next_interupt_stage = nil
	self._global.start_time = nil
	self._global.memory = nil
	self._global.shortterm_memory = nil

	managers.loot:on_job_deactivated()
	managers.mission:on_job_deactivated()
	managers.experience:mission_xp_clear()
	self:stop_sounds()

	self._global.active_ghost_bonus = nil
	self._global.accumulated_ghost_bonus = nil
end

function JobManager:stop_sounds()
	local cleanup = SoundDevice:create_source("cleanup")

	cleanup:post_event("bain_static_disable")
end

function JobManager:complete_stage()
	self._global.current_job.current_stage = current_stage + 1
end

function JobManager:on_first_stage()
	if not self._global.current_job then
		return false
	end

	if self._global.next_interupt_stage then
		return false
	end

	return self._global.current_job.current_stage == 1
end

function JobManager:on_last_stage()
	if not self._global.current_job then
		return false
	end

	if self._global.next_interupt_stage then
		return false
	end

	return self._global.current_job.current_stage == self._global.current_job.stages
end

function JobManager:_on_last_stage()
	if not self._global.current_job then
		return false
	end

	return self._global.current_job.current_stage == self._global.current_job.stages
end

function JobManager:is_job_finished()
	if not self._global.current_job then
		return false
	end

	if self._global.interupt_stage then
		return false
	end

	return self._global.current_job.last_completed_stage == self._global.current_job.stages
end

function JobManager:skip_money()
	return self._global.next_interupt_stage and true or false
end

function JobManager:next_stage()
	print("[JobManager:next_stage]")

	if not self:has_active_job() then
		return
	end

	if not self._is_synced_from_server then
		self._global.current_job.last_completed_stage = self._global.current_job.current_stage
		self._global.interupt_stage = nil
	end

	if self:is_job_finished() and not self._global.next_interupt_stage then
		self:_check_add_to_cooldown()
		managers.achievment:award("no_turning_back")

		return
	end

	if not self._is_synced_from_server then
		self._global.alternative_stage = self._global.next_alternative_stage
	end

	self._global.next_alternative_stage = nil

	if not self._is_synced_from_server then
		self._global.interupt_stage = self._global.next_interupt_stage
	end

	self._global.next_interupt_stage = nil

	if not self._global.interupt_stage and not self._is_synced_from_server then
		self:set_current_stage(self._global.current_job.current_stage + 1)
	end

	Global.game_settings.level_id = managers.job:current_level_id()
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.world_setting = managers.job:current_world_setting()

	if Network:is_server() then
		MenuCallbackHandler:update_matchmake_attributes()

		local level_id_index = tweak_data.levels:get_index_from_level_id(Global.game_settings.level_id)
		local interupt_level_id_index = self._global.interupt_stage and tweak_data.levels:get_index_from_level_id(self._global.interupt_stage) or 0

		managers.network:session():send_to_peers("sync_stage_settings", level_id_index, self._global.current_job.current_stage, self._global.alternative_stage or 0, interupt_level_id_index)
	end
end

function JobManager:set_current_stage(stage_num)
	self._global.current_job.last_completed_stage = self._global.current_job.current_stage
	self._global.current_job.current_stage = stage_num
	self._global.shortterm_memory = {}
end

function JobManager:current_job_data()
	if not self._global.current_job then
		return
	end

	return tweak_data.narrative:job_data(self._global.current_job.job_id)
end

function JobManager:current_job_chain_data()
	if not self._global.current_job then
		return
	end

	return tweak_data.narrative:job_chain(self._global.current_job.job_id)
end

function JobManager:current_real_job_id()
	return self:current_job_wrapper_id() or self:current_job_id()
end

function JobManager:current_job_wrapper_id()
	if not self._global.current_job then
		return
	end

	return self._global.current_job.job_wrapper_id
end

function JobManager:current_job_id()
	if not self._global.current_job then
		return
	end

	return self._global.current_job.job_id
end

function JobManager:is_current_job_professional()
	if not self._global.current_job then
		return
	end

	return tweak_data.narrative:job_data(self._global.current_job.job_id).professional
end

function JobManager:is_job_professional_by_job_id(job_id)
	if not job_id or not tweak_data.narrative.jobs[job_id] then
		Application:error("[JobManager:is_job_professional_by_job_id] no job id or no job", job_id)

		return
	end

	return tweak_data.narrative:job_data(job_id).professional and true or false
end

function JobManager:current_stage()
	if not self._global.current_job then
		return
	end

	return self._global.current_job.current_stage
end

function JobManager:current_stage_data()
	if not self._global.current_job then
		return
	end

	local job_chain = tweak_data.narrative:job_chain(self._global.current_job.job_id)
	local stage = job_chain[self._global.current_job.current_stage]

	if not stage then
		return {}
	end

	if #stage > 0 then
		return stage[self._global.alternative_stage or 1]
	end

	return stage
end

function JobManager:current_level_id()
	if not self._global.current_job then
		return
	end

	if self._global.interupt_stage then
		return self._global.interupt_stage
	end

	return self:current_stage_data().level_id
end

function JobManager:current_mission()
	if not self._global.current_job then
		return
	end

	if self._global.interupt_stage then
		return "none"
	end

	return self:current_stage_data().mission or "none"
end

function JobManager:current_world_setting()
	if not self._global.current_job then
		return
	end

	if self._global.interupt_stage then
		return nil
	end

	return self:current_stage_data().world_setting or nil
end

function JobManager:current_briefing_dialog()
	if not self._global.current_job then
		return
	end

	if self._global.interupt_stage then
		return managers.job:current_level_data().briefing_dialog
	end

	return managers.job:current_stage_data().briefing_dialog or managers.job:current_level_data().briefing_dialog
end

function JobManager:current_briefing_id()
	if not self._global.current_job then
		return
	end

	if self._global.interupt_stage then
		return managers.job:current_level_data().briefing_id
	end

	return managers.job:current_stage_data().briefing_id or managers.job:current_level_data().briefing_id
end

function JobManager:current_mission_filter()
	if not self._global.current_job then
		return
	end

	return self:current_stage_data().mission_filter
end

function JobManager:current_level_data()
	if not self._global.current_job then
		return
	end

	return tweak_data.levels[self:current_level_id()]
end

function JobManager:current_contact_id()
	if not self._global.current_job then
		return
	end

	return tweak_data.narrative:job_data(self._global.current_job.job_id).contact
end

function JobManager:current_contact_data()
	if self._global.interupt_stage then
		if tweak_data.levels[self._global.interupt_stage].bonus_escape then
			return tweak_data.narrative.contacts.bain
		end

		return tweak_data.narrative.contacts.interupt
	end

	return tweak_data.narrative.contacts[self:current_contact_id()]
end

function JobManager:current_job_stars()
	return math.ceil(tweak_data.narrative:job_data(self._global.current_job.job_id).jc / 10)
end

function JobManager:current_difficulty_stars()
	local difficulty = Global.game_settings.difficulty or "easy"
	local difficulty_id = math.max(0, (tweak_data:difficulty_to_index(difficulty) or 0) - 2)

	return difficulty_id
end

function JobManager:current_job_and_difficulty_stars()
	local difficulty = Global.game_settings.difficulty or "easy"
	local difficulty_id = math.max(0, (tweak_data:difficulty_to_index(difficulty) or 0) - 2)

	return math.clamp(self:current_job_stars() + difficulty_id, 1, 10)
end

function JobManager:calculate_job_class(job_id, difficulty_id)
	if job_id then
		local job_jc = tweak_data.narrative:job_data(job_id).jc or 10
		local difficulty_jc = math.max((difficulty_id or 1) - 2, 0) * 10

		Application:debug("[calculate_job_class]", job_jc + difficulty_jc)

		return math.min(job_jc + difficulty_jc, 100)
	end

	return 10
end

function JobManager:get_min_jc_for_player()
	local data = tweak_data.narrative.STARS[math.clamp(managers.experience:level_to_stars(), 1, 10)]

	if not data then
		return
	end

	local jcs = data.jcs

	if not jcs then
		return
	end

	local min_jc = 100

	for _, jc in ipairs(jcs) do
		min_jc = math.min(min_jc, jc)
	end

	return min_jc
end

function JobManager:get_max_jc_for_player()
	local data = tweak_data.narrative.STARS[math.clamp(managers.experience:level_to_stars(), 1, 10)]

	if not data then
		return
	end

	local jcs = data.jcs

	if not jcs then
		return
	end

	local max_jc = 0

	for _, jc in ipairs(jcs) do
		max_jc = math.max(max_jc, jc)
	end

	return max_jc
end

function JobManager:is_forced()
	local level_data = tweak_data.levels[managers.job:current_level_id()]

	return level_data and level_data.force_equipment
end

function JobManager:is_current_job_competitive()
	if not self._global.current_job then
		return
	end

	return tweak_data.narrative:job_data(self._global.current_job.job_id).competitive
end

function JobManager:is_job_competitive_by_job_id(job_id)
	if not job_id or not tweak_data.narrative.jobs[job_id] then
		Application:error("[JobManager:is_job_competitive_by_job_id] no job id or no job", job_id)

		return
	end

	return tweak_data.narrative:job_data(job_id).competitive and true or false
end

function JobManager:set_stage_success(success)
	print("[JobManager:set_stage_success]", success, "on_last_stage", self:on_last_stage())

	self._stage_success = success
end

function JobManager:stage_success()
	return self._stage_success
end

function JobManager:check_ok_with_cooldown(job_id)
	if not self._global.cooldown then
		return true
	end

	if not self._global.cooldown[job_id] then
		return true
	end

	return self._global.cooldown[job_id] < TimerManager:wall_running():time()
end

function JobManager:_check_add_to_cooldown()
	if Network:is_server() and self._global.start_time then
		local cooldown_time = self._global.start_time + tweak_data.narrative.CONTRACT_COOLDOWN_TIME - TimerManager:wall_running():time()

		if cooldown_time > 0 then
			self._global.cooldown = self._global.cooldown or {}
			self._global.cooldown[self:current_real_job_id()] = cooldown_time + TimerManager:wall_running():time()
		end
	end
end

function JobManager:sync_save(data)
	local state = {
		next_interupt_stage = self._global.next_interupt_stage
	}
	data.JobManager = state
end

function JobManager:sync_load(data)
	local state = data.JobManager
	self._global.next_interupt_stage = state.next_interupt_stage
end

JobManager.arcade_states = {
	"tutorial",
	"lobby",
	"ingame",
	"success",
	"endscreen"
}

function JobManager:set_arcade_state(state)
	if not table.contains(self.arcade_states, state) then
		Application:error("[JobManager:set_arcade_state] Tried to set an invalid arcade state:", state)

		return
	end

	if state == "ingame" then
		self._van_screen = World:spawn_unit(Idstring("units/pd2_dlc_vr/units/lbe_van_screen/lbe_van_screen"), Vector3(-950, -2150, 200), Rotation(180))

		self._van_screen:set_visible(false)
	elseif state == "success" then
		managers.statistics:send_statistics()

		if _G.IS_VR then
			managers.hud:set_floating_hud_visible(false)
		end
	elseif state == "endscreen" and _G.IS_VR then
		managers.player:set_player_state("lobby_empty")
		managers.vr:start_end_screen()
	end

	self._arcade_state = state

	if Network:is_server() then
		managers.network:session():send_to_peers_synched("sync_arcade_state", table.index_of(self.arcade_states, state))

		if Global.game_host then
			managers.player:set_sync_state_from_arcade_state(state)
		end
	end
end

function JobManager:arcade_state()
	return self._arcade_state
end

function JobManager:spawn_snitzel()
	if alive(self._snitzel) then
		World:delete_unit(self._snitzel)
	end

	self._snitzel = World:spawn_unit(Idstring("units/pd2_dlc_vr/units/lbe_snitzel/lbe_snitzel"), Vector3(), Rotation())
end

function JobManager:set_snitzel_state(state)
	if not alive(self._snitzel) then
		return
	end

	local sequence = nil

	if state == "van" then
		sequence = "snitzel_van"
	elseif state == "vault" then
		sequence = "snitzel_safe"
	else
		sequence = "hide"
	end

	self._snitzel:damage():run_sequence_simple(sequence)
end

function JobManager:force_start_lobby_timer()
	for _, data in pairs(managers.mission:scripts()) do
		for id, element in pairs(data:elements()) do
			if element:editor_name() == "start_lobby_timer" then
				element:on_executed()

				return true
			end
		end
	end
end

function JobManager:force_start_heist()
	for _, data in pairs(managers.mission:scripts()) do
		for id, element in pairs(data:elements()) do
			if element:editor_name() == "start_heist" then
				element:on_executed()

				return true
			end
		end
	end
end

function JobManager:set_peer_stats(peer_id, peer_stats)
	peer_stats.cash = peer_stats.loot * tweak_data.vr_arcade.cash_multipliers.bag + peer_stats.small_loot * tweak_data.vr_arcade.cash_multipliers.small_loot
	self._arcade_stats = self._arcade_stats or {}
	self._arcade_stats.peers = self._arcade_stats.peers or {}
	self._arcade_stats.peers[peer_id] = peer_stats

	if Network:is_server() then
		managers.network:session():send_to_peers("sync_peer_score", peer_id, peer_stats.kills, peer_stats.downs, peer_stats.accuracy, peer_stats.loot, peer_stats.small_loot)
	end
end

function JobManager:set_score(score)
	self._arcade_stats = self._arcade_stats or {}
	self._arcade_stats.score = math.max(score, 1)

	self:_check_show_score_screen()
end

function JobManager:set_cash(cash)
	self._arcade_stats = self._arcade_stats or {}
	self._arcade_stats.cash = cash

	self:_check_show_score_screen()
end

function JobManager:set_team_stats(stats)
	self._arcade_stats = self._arcade_stats or {}
	self._arcade_stats.team_stats = stats

	self:_check_show_score_screen()

	if Network:is_client() then
		self:client_calculate_team_score(stats)
	end
end

function JobManager:client_calculate_team_score(stats)
	local score = 0
	local cash = 0

	for stat, value in pairs(stats) do
		score = score + self:score_from_stat(stat, value)

		if stat == "bag" or stat == "small_loot" then
			cash = cash + tweak_data.vr_arcade.cash_multipliers[stat]
		end
	end

	self:set_score(score)
	self:set_cash(cash)
end

function JobManager:calculate_peer_score(peer_id)
	self._arcade_stats = self._arcade_stats or {}
	local peer_score = nil
	local peer_stats = self._arcade_stats.peers and self._arcade_stats.peers[peer_id]
	local team_stats = self._arcade_stats.team_stats

	if not peer_stats or not team_stats then
		return
	end

	peer_score = team_stats.bag * tweak_data.vr_arcade.score_multipliers.bag
	peer_score = peer_score + team_stats.small_loot * tweak_data.vr_arcade.score_multipliers.small_loot
	peer_score = peer_score + peer_stats.loot * tweak_data.vr_arcade.local_score_multiplier.bag
	peer_score = peer_score + peer_stats.small_loot * tweak_data.vr_arcade.local_score_multiplier.small_loot
	peer_score = peer_score + peer_stats.kills * tweak_data.vr_arcade.local_score_multiplier.kill
	peer_score = peer_score + peer_stats.downs * tweak_data.vr_arcade.local_score_multiplier.downed
	self._arcade_stats.peers[peer_id].score = math.max(peer_score, 1)
end

function JobManager:peer_score(peer_id)
	peer_id = peer_id or managers.network:session() and managers.network:session():local_peer():id()

	return self._arcade_stats and self._arcade_stats.peers and self._arcade_stats.peers[peer_id] and self._arcade_stats.peers[peer_id].score
end

function JobManager:_check_show_score_screen()
	if self._arcade_stats then
		if self._arcade_stats.score and self._arcade_stats.cash and self._arcade_stats.team_stats then
			managers.hud:set_arcade_score(self._arcade_stats.score, self._arcade_stats.cash, self._arcade_stats.team_stats)
		end

		if self._arcade_stats.peers then
			local highest_stats = {}

			for id in pairs(self._arcade_stats.peers) do
				self:calculate_peer_score(id)
				managers.hud:set_arcade_peer_stats(id, self._arcade_stats.peers[id])

				for stat, value in pairs(self._arcade_stats.peers[id]) do
					local function cmp(a, b, invert)
						return invert and b <= a or not invert and a <= b
					end

					if not highest_stats[stat] or cmp(highest_stats[stat].value, value, stat == "downs") then
						if highest_stats[stat] and highest_stats[stat].value == value then
							local peer_list = {}

							if type(highest_stats[stat].peer_id) == "table" then
								peer_list = highest_stats[stat].peer_id
							else
								table.insert(peer_list, highest_stats[stat].peer_id)
							end

							table.insert(peer_list, id)

							highest_stats[stat].peer_id = peer_list
						else
							highest_stats[stat] = {
								peer_id = id,
								value = value
							}
						end
					end
				end
			end

			local highlights = {}

			for stat, data in pairs(highest_stats) do
				for _, peer_id in ipairs(type(data.peer_id) == "table" and data.peer_id or {
					data.peer_id
				}) do
					highlights[peer_id] = highlights[peer_id] or {}
					highlights[peer_id][stat] = true
				end
			end

			managers.hud:highlight_peer_stats(highlights)
		end
	end
end

function JobManager:score_from_stat(name, stat)
	if name == "downed" and stat == 0 then
		return tweak_data.vr_arcade.score_multipliers.no_downs_bonus
	end

	return stat * tweak_data.vr_arcade.score_multipliers[name]
end

function JobManager:_arcade_loot()
	local bags = 0
	local small_loot = 0

	for _, data in ipairs(Global.loot_manager.secured) do
		if tweak_data.carry.small_loot[data.carry_id] then
			small_loot = small_loot + 1
		else
			bags = bags + 1
		end
	end

	return bags, small_loot
end

function JobManager:calculate_team_score()
	if not Network:is_server() or not self._arcade_stats then
		return
	end

	local stats = {
		kill = managers.statistics:session_total_kills_by_anyone()
	}
	stats.bag, stats.small_loot = self:_arcade_loot()
	stats.hostages_remaining = #World:find_units_quick("all", 21)
	stats.downed = 0

	for id in pairs(self._arcade_stats.peers or {}) do
		stats.downed = stats.downed + managers.statistics:session_peer_downed(id)
	end

	local total = 0

	for key, value in pairs(stats) do
		total = total + self:score_from_stat(key, value)
	end

	self:set_score(total)
	self:set_team_stats(stats)
	managers.network:session():send_to_peers("sync_team_stats", stats.kill, stats.bag, stats.small_loot, stats.hostages_remaining, stats.downed)
end

function JobManager:calculate_team_cash()
	if not Network:is_server() then
		return
	end

	local cash = {}
	cash.bags, cash.small_loot = self:_arcade_loot()
	cash.bags = cash.bags * tweak_data.vr_arcade.cash_multipliers.bag
	cash.small_loot = cash.small_loot * tweak_data.vr_arcade.cash_multipliers.small_loot
	cash.total = cash.bags + cash.small_loot

	self:set_cash(cash.total)
end

function JobManager:sync_score_to_drop_in(peer)
	if not Network:is_server() or not self._arcade_stats then
		return
	end

	local team_stats = self._arcade_stats.team_stats

	managers.network:session():send_to_peer_synched(peer, "sync_team_stats", team_stats.kill, team_stats.bag, team_stats.small_loot, team_stats.hostages_remaining, team_stats.downed)

	for id, stats in pairs(self._arcade_stats.peers) do
		managers.network:session():send_to_peer_synched(peer, "sync_peer_score", id, stats.kills, stats.downs, stats.accuracy, stats.loot, stats.small_loot)
	end
end

function JobManager:sync_arcade_state_to_drop_in(peer)
	if not Network:is_server() or not self._arcade_state then
		return
	end

	managers.network:session():send_to_peer_synched(peer, "sync_arcade_state", table.index_of(self.arcade_states, self._arcade_state))
end

function JobManager:sync_arcade_team_name_to_drop_in(peer)
	if not Network:is_server() or not self._team_name_index then
		return
	end

	managers.network:session():send_to_peer_synched(peer, "sync_team_name", self._team_name_index)
end
