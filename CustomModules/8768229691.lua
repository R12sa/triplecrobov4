local function vapeGithubRequest(scripturl)
	if not isfile("vape/"..scripturl) then
		local suc, res = pcall(function() return game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/"..readfile("vape/commithash.txt").."/"..scripturl, true) end)
		if not suc or res == "404: Not Found" then return nil end
		if res:find(".lua") then res = "--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.\n"..res end
		writefile("vape/"..scripturl, res)
	end
	return readfile("vape/"..scripturl)
end

shared.CustomSaveVape = 8542275097
if pcall(function() readfile("vape/CustomModules/8542275097.lua") end) then
	loadstring(readfile("vape/CustomModules/8542275097.lua"))()
else
	local publicrepo = vapeGithubRequest("8542275097.lua")
	if publicrepo then
		loadstring(publicrepo)()
	end
end