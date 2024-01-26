require("lib/network/matchmaking/NetworkAccount")

NetworkAccountLBE = NetworkAccountLBE or class(NetworkAccount)

function NetworkAccountLBE:init()
	NetworkAccount.init(self)

	local ip = Network:hostname_ip_lookup(Network:hostname())

	if #ip > 0 then
		self._player_id = ip[1] .. ":" .. NetworkManager.DEFAULT_PORT
	end
end

function NetworkAccountLBE:signin_state()
	return "signed in"
end

function NetworkAccountLBE:local_signin_state()
	return true
end

function NetworkAccountLBE:username_id()
	return Network:self("TCP_IP"):name_at_index(0)
end

function NetworkAccountLBE:player_id()
	return self._player_id or Network:self("TCP_IP"):name_at_index(0)
end

function NetworkAccountLBE:is_connected()
	return true
end

function NetworkAccountLBE:lan_connection()
	return true
end

function NetworkAccountLBE:publish_statistics(stats, force_store)
	Application:error("NetworkAccountLBE:publish_statistics( stats, force_store )")
	Application:stack_dump()
end

function NetworkAccountLBE:achievements_fetched()
	self._achievements_fetched = true
end

function NetworkAccountLBE:add_overlay_listener()
end

function NetworkAccountLBE:challenges_loaded()
	self._challenges_loaded = true
end

function NetworkAccountLBE:experience_loaded()
	self._experience_loaded = true
end
