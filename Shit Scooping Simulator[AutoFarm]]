
--Game: https://www.roblox.com/games/1266586304/Poop-Scooping-Simulator
--Configuration
getgenv().tier = 1 --Poop Tier(Brown for 1, green for 2, idk about 3, 4 and 5, you figure it out)
getgenv().capacity = 75 --The max amount or the amount autosell will sell the shit





if exe then
    wait(9e9)
end
local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(input, gameProcessedEvent)
	if (input.KeyCode == Enum.KeyCode.Z and UIS:IsKeyDown(Enum.KeyCode.X)) or (input.KeyCode == Enum.KeyCode.X and UIS:IsKeyDown(Enum.KeyCode.Z)) then
		if getgenv().t then
            getgenv().t = false
            pcall(farm)
        else
            getgenv().t = true
    end
	end
end)

function farm()
getgenv().exe = true
getgenv().was = false
while wait(0.05) do
if t then
    repeat wait(1)
    until not game.Players.LocalPlayer
end
if not game:GetService("Players").LocalPlayer.info.sellingPoop.Value then
    for _, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
        if v.Name ~= "Poo" then
        v.Parent = game:GetService("Players").LocalPlayer.Character
        end
    end
end
for _,v in pairs(workspace.PoopsHolder:GetChildren()) do
    if v:WaitForChild("id", 5) then
    if getgenv().tier == 1 then
    if v:WaitForChild("id", 0.03).Value == 1 then
    local v1 = (v:GetChildren()[1].Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if v1 <= 5 then
    was = true
    break
    end
    if v1 >= 6 then
        was = false
    end
    end
    end
    if getgenv().tier == 2 then
    if v:WaitForChild("id", 5).Value == 2 then
    local v1 = (v:GetChildren()[1].Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if v1 <= 5 then
    was = true
    break
    end
    if v1 >= 6 then
        was = false
    end
    end
    end
    if getgenv().tier == 3 then
    if v:WaitForChild("id", 5).Value == 3 then
    local v1 = (v:GetChildren()[1].Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if v1 <= 5 then
    was = true
    break
    end
    if v1 >= 6 then
        was = false
    end
    end
    end
    if getgenv().tier == 4 then
    if v:WaitForChild("id", 5).Value == 4 then
    local v1 = (v:GetChildren()[1].Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if v1 <= 5 then
    was = true
    break
    end
    if v1 >= 6 then
        was = false
    end
    end
    end
    if getgenv().tier == 5 then
    if v:WaitForChild("id", 5).Value == 5 then
    local v1 = (v:GetChildren()[1].Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if v1 <= 5 then
    was = true
    break
    end
    if v1 >= 6 then
        was = false
    end
    end
    end
    end
end
if game:GetService("Players").LocalPlayer.info.inBag.Value >= capacity then
local args = {
    [1] = "SellPoop",
    [2] = game:GetService("Players").LocalPlayer.info.inBag.Value
}
game:GetService("ReplicatedStorage").Remotes.RemoteEvent:FireServer(unpack(args))
end
if was then
    for _,v in pairs(workspace.PoopsHolder:GetChildren()) do
    if getgenv().tier == 1 then
    if v.id.Value == 1 then
    local v1 = (v:GetChildren()[1].Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if v1 <= 5 then
    local args = {
    [1] = v}
    game:GetService("ReplicatedStorage").Remotes.collectPoop:FireServer(unpack(args))
    end
    end
    end
    if getgenv().tier == 2 then
    if v.id.Value == 2 then
    local v1 = (v:GetChildren()[1].Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if v1 <= 5 then
    local args = {
    [1] = v}
    game:GetService("ReplicatedStorage").Remotes.collectPoop:FireServer(unpack(args))
    end
    end
    end
    if getgenv().tier == 3 then
    if v.id.Value == 3 then
    local v1 = (v:GetChildren()[1].Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if v1 <= 5 then
    local args = {
    [1] = v}
    game:GetService("ReplicatedStorage").Remotes.collectPoop:FireServer(unpack(args))
    end
    end
    end
    if getgenv().tier == 4 then
    if v.id.Value == 4 then
    local v1 = (v:GetChildren()[1].Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if v1 <= 5 then
    local args = {
    [1] = v}
    game:GetService("ReplicatedStorage").Remotes.collectPoop:FireServer(unpack(args))
    end
    end
    end
    if getgenv().tier == 5 then
    if v.id.Value == 5 then
    local v1 = (v:GetChildren()[1].Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if v1 <= 5 then
    local args = {
    [1] = v}
    game:GetService("ReplicatedStorage").Remotes.collectPoop:FireServer(unpack(args))
    end
    end
    end
    end
elseif not was then
    for _,v in pairs(workspace.PoopsHolder:GetChildren()) do
    if getgenv().tier == 1 then
    if v.id.Value == 1 then
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.PoopsHolder[1]:GetChildren()[1].Position) + Vector3.new(0, 3, 0)
    end
    end
    if getgenv().tier == 2 then
    if v.id.Value == 2 then
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.PoopsHolder[1]:GetChildren()[1].Position) + Vector3.new(0, 3, 0)
    end
    end
    if getgenv().tier == 3 then
    if v.id.Value == 3 then
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.PoopsHolder[1]:GetChildren()[1].Position) + Vector3.new(0, 3, 0)
    end
    end
    if getgenv().tier == 4 then
    if v.id.Value == 4 then
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.PoopsHolder[1]:GetChildren()[1].Position) + Vector3.new(0, 3, 0)
    end
    end
    if getgenv().tier == 5 then
    if v.id.Value == 5 then
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.PoopsHolder[1]:GetChildren()[1].Position) + Vector3.new(0, 3, 0)
    end
    end
    end
end
end
end
call, msg = pcall(farm)
if call then
else
    print("What the fuck does this mean > "..msg) 
end
