
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local VIM = game:GetService("VirtualInputManager")

local LocalPlayer = Players.LocalPlayer
local Fishing = LocalPlayer:WaitForChild("PlayerGui")
    :WaitForChild("FishingGui")
    :WaitForChild("Fishing")

local function SelectAndClick(v)
	if v.Name ~= "TapHalo" then
		return
	end

	GuiService.SelectedObject = v
	local pos = v.AbsolutePosition + v.AbsoluteSize / 2
    
	VIM:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 0)
	task.wait(0.1)
	VIM:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 0)
	task.wait(0.1)
	VIM:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 0)
end

Fishing.ChildAdded:Connect(SelectAndClick)

local existing = Fishing:FindFirstChild("TapHalo")
if existing then
	SelectAndClick(existing)
end
