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

man = {}
-- SETTINGS 

man.welcome = "Message...";


man.players = {};
local worldpath = minetest.get_worldpath();


minetest.register_on_joinplayer(function(player) 
	local name = player:get_player_name(); if name == nil then return end 
	
	-- read player inventory data
	local form = "size [6,2] textarea[0,0;6.6,3.5;help;*** Form title ***;".. man.welcome.."]"
	        -- minetest.chat_send_player(name, man.welcome);
			minetest.show_formspec(name, "man:welcome", form)
end)
