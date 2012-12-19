--[[

LuCI njit-client
#Author:ferstar
#Email:zhangjianfei3@gmail.com

]]--

require("luci.tools.webadmin")

m = Map("njit-client", translate("NJIT-CLIENT"), translate("A H3C supplicant on Linux"))
function m.on_commit(self)
os.execute("/etc/init.d/njit-client start")
end

s = m:section(TypedSection, "option", translate("Start option"),translate("Configure njit-client's start option"))
s.anonymous = true

s:option(Flag, "enable", translate("NJIT-CLIENT_enable"), translate("enable or disable njit-client")).default="0"

s:option(Flag, "boot", translate("Start at boot"), translate("Start njit-client when the route is booting.")).default="0"


s = m:section(TypedSection, "njit-client", translate("Config njit-client"),translate("The options below are all of njit-client's arguments."))
s.anonymous = true

s:option(Value, "Username", translate("Username")).default="***"

pw=s:option(Value, "Password", translate("Password"))
pw.password = true
pw.rmempty = false
pw.default= "***"

return m
