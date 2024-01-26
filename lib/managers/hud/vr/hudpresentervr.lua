HUDPresenterVR = HUDPresenter
HUDPresenterVR.old_init = HUDPresenter.init

function HUDPresenterVR:init(hud)
	hud.old_panel = hud.panel
	hud.panel = managers.hud:prompt_panel()

	self:old_init(hud)

	hud.panel = hud.old_panel
	hud.old_panel = nil
end
