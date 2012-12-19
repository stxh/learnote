--[[

LuCI njit-client
Author:ferstar
Email:zhangjianfei3@gmail.com

]]--

module("luci.controller.njit-client", package.seeall)

function index()

	if nixio.fs.access("/etc/config/njit-client") then
	local page 
	page = entry({"admin", "services", "njit-client"}, cbi("njit-client"), _("NJIT-CLIENT"), 10)
	page.i18n = "njit-client"
	page.dependent = true
	end
end
