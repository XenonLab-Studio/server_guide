--[[
 Copyright © 2018, Stefano Peris

 eMail: <xenon77.dev@gmail.com>
 Github: <https://github.com/XenonCoder>

 GNU GENERAL PUBLIC LICENSE
 Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.
]]--

local serverguide_Book_title="The server guide"

local serverguide_Tab_Text_1="Server info\n Type /guide to see this"

local serverguide_Tab_Text_2="Server Rules \nNo ask for privs or admin stuff \nNo swearing or bad names (like God, fuc...)\nNo griefing\nNo bad stealing or steal people's usernames\nNo hacking\nDon't mess up with moderators or admins"

local serverguide_Tab_Text_3="Staff (moderator or admins)"

local serverguide_Tab_Text_4="Commands:\nSet your home with /sethome say /home to teleport back \nSee who are online /status"

local serverguide_Tab_Text_5="Help info\nHelp you self\n Only call a moderator or admin if you\n get problems that you cant fix it by own"

local serverguide_Tab_1="Server"
local serverguide_Tab_2="Rules"
local serverguide_Tab_3="Staff"
local serverguide_Tab_4="Commands"
local serverguide_Tab_5="Help"

local function serverguide_guide(user,text_to_show)
local text=""
if text_to_show==1 then text=serverguide_Tab_Text_1 end
if text_to_show==2 then text=serverguide_Tab_Text_2 end
if text_to_show==3 then text=serverguide_Tab_Text_3 end
if text_to_show==4 then text=serverguide_Tab_Text_4 end
if text_to_show==5 then text=serverguide_Tab_Text_5 end

local form="size[8.5,9]" ..default.gui_bg..default.gui_bg_img..
	"button[0,0;1.5,1;tab1;" .. serverguide_Tab_1 .. "]" ..
	"button[1.5,0;1.5,1;tab2;" .. serverguide_Tab_2 .. "]" ..
	"button[3,0;1.5,1;tab3;" .. serverguide_Tab_3 .. "]" ..
	"button[4.5,0;1.5,1;tab4;" .. serverguide_Tab_4 .. "]" ..
	"button[6,0;1.5,1;tab5;" .. serverguide_Tab_5 .. "]" ..
	"button_exit[7.5,0; 1,1;tab6;X]" ..
	"label[0,1;"..text .."]"
	
minetest.show_formspec(user:get_player_name(), "serverguide",form)
end

minetest.register_on_player_receive_fields(function(player, form, pressed)
	if form=="serverguide" then
	if pressed.tab1 then serverguide_guide(player,1) end
	if pressed.tab2 then serverguide_guide(player,2) end
	if pressed.tab3 then serverguide_guide(player,3) end
	if pressed.tab4 then serverguide_guide(player,4) end
	if pressed.tab5 then serverguide_guide(player,5) end
	end
end)

minetest.register_tool("serverguide:book", {
	description = serverguide_Book_title,
	inventory_image = "default_book.png",
	on_use = function(itemstack, user, pointed_thing)
	serverguide_guide(user,1)
	return itemstack
	end
})

minetest.register_alias("guide", "serverguide:book")

minetest.register_on_newplayer(function(player)
player:get_inventory():add_item("main", "serverguide:book")
end)

--[[
-- Message that appears on the form when accessing the server
minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
end)
]]--

minetest.register_chatcommand("guide", {
	params = "",
	description = serverguide_Book_title,
	func = function(name, param)
		serverguide_guide(minetest.get_player_by_name(name),1)
		return true
	end
})

