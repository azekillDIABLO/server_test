local player_help="Player Help"

local player_help__Tab_Text_1="Welcome! Text \n There is a space! \n and another!"
local player_help__Tab_Text_2="Rules Text \n There is a space! \n and another!"
local player_help__Tab_Text_3="Players Text \n There is a space! \n and another!"
local player_help__Tab_Text_4="How to Text \n There is a space! \n and another!"
local player_help__Tab_Text_5="Crew And Credits Text \n There is a space! \n and another!"

local player_help_Pag_1="Welcome!"
local player_help_Pag_2="Rules"
local player_help_Pag_3="Players"
local player_help_Pag_4="How to"
local player_help_Pag_5="Crew and Credits"

local function player_help(user,text_to_show)
local text=""
if text_to_show==1 then text=player_help__Tab_Text_1 end
if text_to_show==2 then text=player_help__Tab_Text_2 end
if text_to_show==3 then text=player_help__Tab_Text_3 end
if text_to_show==4 then text=player_help__Tab_Text_4 end
if text_to_show==5 then text=player_help__Tab_Text_5 end

local form="size[12,12]" ..
				"label[0.5,2; Welcome To -server_name- here you can see the rules, how to report and more stuff]" ..
				"button[0,0;2.5,1;tab1;" .. player_help_Pag_1 .. "]" ..
				"button[2.5,0;2.5,1;tab2;" .. player_help_Pag_2 .. "]" ..
				"button[5,0;2.5,1;tab3;" .. player_help_Pag_3 .. "]" ..
				"button[7.5,0;2.5,1;tab4;" .. player_help_Pag_4 .. "]" ..
				"button[10,0;2.5,1;tab5;" .. player_help_Pag_5 .. "]" ..
				"image_button_exit[10,11;1.5,0.5;exit.png;Exit;Exit]" ..
				"label[0.5,3;"..text .."]"
minetest.show_formspec(user:get_player_name(), "server_player:player_wiki",form)
end			


minetest.register_on_player_receive_fields(function(player, form, pressed)
	if form=="server_player:player_wiki" then
	if pressed.tab1 then player_help(player,1) end
	if pressed.tab2 then player_help(player,2) end
	if pressed.tab3 then player_help(player,3) end
	if pressed.tab4 then player_help(player,4) end
	if pressed.tab5 then player_help(player,5) end
	end
end)

minetest.register_chatcommand("player_help", {
	params = "",
	description = "Player-Help-Center",
	privs = {},
	func = function(name, param)
		player_help(minetest.get_player_by_name(name),1)
		return true
	end
})
