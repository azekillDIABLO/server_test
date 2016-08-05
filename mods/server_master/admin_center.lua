local admin_center_wiki="Admin Center Wiki"

local admincenter_Tab_Text_1="Welcome to the Admin Center!:\n -Here you can learn to manage and use in a properly way your server!\n -The first thing is doing a spawn with the rules of your server and additional info and protecting it,\n so the people who come can see what they shouldn't do!\n -You can check out the other pages, clicking the buttons, there are different things as commands, mods and stuff\n to teach you to use your server!\n -When you want you can come back here with this command /admin_center \n -If you need more help, you can ask in forum.minetest.net For extra help!"
local admincenter_Tab_Text_2="Basic Commands:Here are some bassic commands, they are very simple and can be used anytime!\n/kick <player_name> <reason> \n Kick a player that don't agree the rules, the reason is shown to the kicked player, is optional!\n/ban \n Shows banned players\n/ban <player_name>\n Bans a player name!\n/unban <player_name> \n Unban a player name!\n/time <minutes>:<hours>\n It helps to set the time in a 24-hour time format!\n/giveme <itemstring-or-name> <quantity>\n This commmand can give you a item, you can insert the quantity of items you want too\n/grant <player_name> <priv>\n This command grant a priv (likely fly,fast, or noclip) to a player, never grant the server priv!\n/teleport <player_name>\n Teleport yourself to a player!"
local admincenter_Tab_Text_3="Advanced Commands=\n/teleport <x>,<y>,<z> - Teleport yourself to a location\n/teleport <player> <x>,<y>,<z> - Teleports <player> to given coordinates. Also requires the “bring” privilege\n/teleport <player1> <player2> - Teleports <player1> to <player2>. Also requires the “bring” privilege. "
local admincenter_Tab_Text_4="There are different mods likely:\n"
local admincenter_Tab_Text_5="Recommendations for a better server:\n"

local admin_center_Pag_1="GettingStarted!"
local admin_center_Pag_2="Privs"
local admin_center_Pag_3="BasicCommands"
local admin_center_Pag_4="AdvancedCommands"
local admin_center_Pag_5="Recommendations"

local function admin_center_wiki(user,text_to_show)
local text=""
if text_to_show==1 then text=admincenter_Tab_Text_1 end
if text_to_show==2 then text=admincenter_Tab_Text_2 end
if text_to_show==3 then text=admincenter_Tab_Text_3 end
if text_to_show==4 then text=admincenter_Tab_Text_4 end
if text_to_show==5 then text=admincenter_Tab_Text_5 end

local form="size[12,12]" ..
				"label[0.5,2;Welcome, To the Admin Center, here you can get help about use and manage your server!]" ..
				"button[0,0;2.5,1;tab1;" .. admin_center_Pag_1 .. "]" ..
				"button[2.5,0;2.5,1;tab2;" .. admin_center_Pag_2 .. "]" ..
				"button[5,0;2.5,1;tab3;" .. admin_center_Pag_3 .. "]" ..
				"button[7.5,0;2.5,1;tab4;" .. admin_center_Pag_4 .. "]" ..
				"button[10,0;2.5,1;tab5;" .. admin_center_Pag_5 .. "]" ..
				"image_button_exit[10,11;1.5,0.5;exit.png;Exit Of Menu;Exit]" ..
				"label[0.5,3;"..text .."]"
minetest.show_formspec(user:get_player_name(), "server_master:admin_wiki",form)
end			


minetest.register_on_player_receive_fields(function(player, form, pressed)
	if form=="server_master:admin_wiki" then
	if pressed.tab1 then admin_center_wiki(player,1) end
	if pressed.tab2 then admin_center_wiki(player,2) end
	if pressed.tab3 then admin_center_wiki(player,3) end
	if pressed.tab4 then admin_center_wiki(player,4) end
	if pressed.tab5 then admin_center_wiki(player,5) end
	end
end)

minetest.register_chatcommand("admin_center", {
	params = "",
	description = admin_center_wiki,
	privs = {server= true},
	func = function(name, param)
		admin_center_wiki(minetest.get_player_by_name(name),1)
		return true
	end
})

--minetest.register_chatcommand("admin_center", {
--   description = "Admin Center Wiki",
 --  privs = {server = true},
 --  func = function(name, param)
--		admin_center_wiki(minetest.get_player_by_name(name),1)
--		return true
--	end
--})