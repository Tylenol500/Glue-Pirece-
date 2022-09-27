local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()
local win = DiscordLib:Window("White Bear | Glue Piece")
local serv = win:Server("Function", "")

local tab = serv:Channel("Auto Farm")

local TOOLS = {}
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if v:IsA("Tool") then
			table.insert(TOOLS,v.Name)
		end
    end
 

_G.Mob_Name = " ชื่อมอน"

Distance_X = 0
Distance_Y = 0
Distance_Z = 5

tab:Toggle("Auto Farm",false,function(t)
    _G.AutoFarm = t

while wait() do
    if _G.AutoFarm then
        for i,v in pairs(game:GetService("Workspace")['Lives']:GetChildren()) do
            if v.Name == _G.Mob_Name and v.Humanoid.Health > 0 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(Distance_X,Distance_Y,Distance_Z)
                game:GetService'VirtualUser':CaptureController()
		        game:GetService'VirtualUser':Button1Down(Vector2.new(2540, 242))
		        equip()
            end
        end
    end
end
end)

tab:Slider("[ > ] Distance X",0,10,3,function(t)
	Distance_X = t
end)
tab:Slider("[ > ] Distance Y",0,10,3,function(t)
	Distance_Y = t
end)
tab:Slider("[ > ] Distance Z",0,10,3,function(t)
	Distance_Z = t
end)


local rdropdwon = tab:Dropdown("Select Weapon",TOOLS,function(t)
	SelectedWeapon = t
end)


function equip()
	pcall(function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.Name == SelectedWeapon then
		    	game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
			end
		end
	end)
end
	tab:Button("Refresh Weapon",function()
		rdropdwon:Clear()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then
				rdropdwon:Add(v.Name)
			end
		end
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") then
				rdropdwon:Add(v.Name)
			end
		end
	end)
   
