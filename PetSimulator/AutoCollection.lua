
function GetTime(t) local t = tick() local hours = math.floor(t / 3600) % 24 local mins = math.floor(t / 60) % 60 local secs = t % 60 if secs < 10 then secs = "0" .. tostring(math.floor(secs)) elseif secs > 10 then secs = tostring(math.floor(secs)) end if mins < 10 then mins = "0" .. tostring(math.floor(mins)) elseif mins > 10 then mins = tostring(math.floor(mins)) end if hours < 10 then hours = "0" .. tostring(math.floor(hours)) elseif hours > 10 then hours = tostring(math.floor(hours)) end local t = hours ..":" .. mins .. ":" .. secs .. " | " return t end Time = GetTime()
function  cprint(string)  rconsoleprint("\n" .. tostring(Time)  .. tostring(string)) end
function Wait(d) if d == nil then wait(0.15) else wait(d) end end
Library = require(game:GetService("ReplicatedStorage"):WaitForChild("Framework"):WaitForChild("Library"))
if getgenv().ML == nil then local GC = getconnections or get_signal_cons if GC then for i,v in pairs(GC(game.Players.LocalPlayer.Idled)) do if v["Disable"] then v["Disable"](v) elseif v["Disconnect"] then v["Disconnect"](v) end end else local vu = game:GetService("VirtualUser") game:GetService("Players").LocalPlayer.Idled:connect(function() vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) wait(1) vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)end) end local MainLoad = {{[1] = "b", [2] = "join coin"}; {[1] = "a",[2] = "farm coin"};  {[1] = "a", [2] = "claim orbs"}; {[1] = "b", [2] = "enchant pet"}; {[1] = "b", [2] = "buy egg"};{[1] = "b",[2] = "use rainbow machine"};{[1] = "a", [2] = "activate boost"};{"b", "convert to dark matter"}; {[1] = "b",[2] = "fuse pets"};{[1] = "a",[2] = "performed teleport"};{[1] = "b",[2] = "use golden machine"}; {[1] = "b"; [2] = "redeem dark matter pet"}; {[1] = "b",[2] = "delete several pets"}} for _,m in pairs(MainLoad) do workspace.__THINGS.__REMOTES.MAIN:FireServer(unpack(m)) end end for i,v in pairs(getgc(true)) do if (typeof(v) == 'table' and rawget(v, 'OpenEgg')) then v.OpenEgg = function() return end end end getgenv().ML = true
Vape = loadstring(game:HttpGet('https://raw.githubusercontent.com/DivineEntity01/UI-Librarys/main/Vape.lua'))()
MainWindow = Vape:Window("PSX Utilities",Color3.fromRGB(44, 120, 224), Enum.KeyCode.Z)
CollectionTab = MainWindow:Tab("Collection")
SettingsTab = MainWindow:Tab("Settings")

--[ Untouchable Variables
Inventory = game.Players.LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets
getgenv().EggTable = {"Cracked Egg","Spotted Egg","Wood Egg","Grass Egg","Beachball Egg", "Rock Egg", "Geode Egg", "Snow Egg", "Ice Egg", "Icicle Egg", "Yeti Egg", "Cactus Egg", "Spiked Egg", "Obsidian Egg", "Magma Egg", "Dominus Egg"}
getgenv().TypeTier = "None" -- Gold, Rainbow, DarkMatter
getgenv().EggReward = {} -- Down in script, this table fills with the petid from the egg
getgenv().IndexNumber = 1
getgenv().DisableIndexSkip = false
getgenv().CAInventory = false -- Child Added Connection, it later disconnects if destroyed
getgenv().CAIPet = nil -- Pet Added Name
getgenv().RainbowTable = {} -- This is for the rainbow adding that counts to 6
getgenv().CurrentEggIndex = 1 -- This is the custom index or pet index(generally eggs have 5 pets so index = 5)
getgenv().Queue = 0 -- queue of the dark matter, forgot if i used this below
getgenv().DarkMatterTable = {} -- this is for knowing if the queue is full
getgenv().UsingMachine = false -- This is to detect if the rainbow machine is being used, idk if i removed it
getgenv().TH = false -- Triple Hatch setting, might delete because the script is meant to work checking individual pets
getgenv().Last = 0 -- this is for knowing which index was last
getgenv().LastNumberOfDarkMatter = 0
--]



--[ Toggles
CollectionTab:Dropdown("Spawn Eggs", getgenv().EggTable, function(t)
    getgenv().SelectedEgg = t
    getgenv().EggReward = {}
    for _, v in pairs(Library.Directory.Eggs[getgenv().SelectedEgg]["drops"]) do table.insert(getgenv().EggReward, {[v[1]] = v[1]}) end
end)

CollectionTab:Dropdown("Type of Tier",{"Gold", "Rainbow", "Dark Matter"}, function(t)
    getgenv().TypeTier = t 
end)

CollectionTab:Button("Skip Current Index", function()
    getgenv().IndexNumber = getgenv().IndexNumber + 1
end)
--[ Actual Script
CollectionTab:Toggle("Start Collection",false, function(t)
    getgenv().CollectionEnabled = t getgenv().EggReward = {} if not getgenv().SelectedEgg and getgenv().CollectionEnabled then Vape:Notification("Egg Selection Invalid!", "No Egg Selected/Egg is invalid", "Ok!") end
    if getgenv().CollectionEnabled then
        -- Fill the EggReward Table
        if getgenv().CustomIndex then getgenv().IndexNumber = tonumber(getgenv().CustomIndexNumber) else getgenv().IndexNumber = 1 end
        function EggTableFill() getgenv().EggReward = {} getgenv().IndexNumber = 1 for _, v in pairs(Library.Directory.Eggs[getgenv().SelectedEgg]["drops"]) do table.insert(getgenv().EggReward, {["id"] = v[1]}) end end
        EggTableFill()
        -- Connect Child Added
        if getgenv().CAInventory ~= false then getgenv().CAInventory:Disconnect() end getgenv().CAInventory = Inventory.ChildAdded:Connect(function(d) 
        if d.Name ~= "Empty" then
        getgenv().CAIPet = d.Name end end)
        cprint("Getting Collection for - " .. getgenv().SelectedEgg .. " || " .. tostring(getgenv().TypeTier))
        -- Check for rarity
        function raritycheck(f, r) for _,v in pairs(Library.Save.Get().Pets) do if v.uid == f and v[tostring(r)] then return true end end end
        -- idfinder
        function idcheck(d)
            for _,v in pairs(Library.Save.Get().Pets) do
                if getgenv().IndexNumber > #getgenv().EggReward then break end
                if v.uid == d  and v.id == getgenv().EggReward[getgenv().IndexNumber]["id"] then
                    return true
                end
            end
        end
        -- fordarkmatterrainbow
        function fordarkmatterrainbow(p)
            while getgenv().CollectionEnabled do
            if raritycheck(tostring(p), 'r') then break end
            if raritycheck(tostring(p), 'g') then break end
            if raritycheck(tostring(p), 'dm') then break end
            if getgenv().TypeTier ~= "Dark Matter" then break end
            if #getgenv().RainbowTable > 6 then 
            workspace.__THINGS.__REMOTES["delete several pets"]:InvokeServer({[1] = {[1] = tostring(p)}}) break end
            if Inventory:WaitForChild(tostring(p), 0.1) and not raritycheck(tostring(p), "r") then
            workspace.__THINGS.__REMOTES["use rainbow machine"]:InvokeServer({[1] = {[1] = p}})
            wait(0.3)
            else break end end
        end
        -- Start Checks
        getgenv().DarkMatterTable = {}
        while getgenv().CollectionEnabled do
            -- Check if golden argument, makes golden pets, then breaks
            if getgenv().TypeTier == "Gold" then
                if Inventory:WaitForChild(tostring(getgenv().CAIPet), 0.1) then if raritycheck(tostring(getgenv().CAIPet), "g") then getgenv().IndexNumber = getgenv().IndexNumber + 1 end end
                workspace.__THINGS.__REMOTES["buy egg"]:InvokeServer({[1] = getgenv().SelectedEgg,[2] = getgenv().TH})
                if idcheck(tostring(getgenv().CAIPet)) then workspace.__THINGS.__REMOTES["use golden machine"]:InvokeServer({[1] = {[1] = getgenv().CAIPet}}) wait(2)
                else workspace.__THINGS.__REMOTES["delete several pets"]:InvokeServer({[1] = {[1] = tostring(getgenv().CAIPet)}}) end
                end
            
            -- Check if rainbow argument, makes rainbow pets then breaks
            if getgenv().TypeTier == "Rainbow" then
                if Inventory:WaitForChild(tostring(getgenv().CAIPet), 0.1) then if raritycheck(tostring(getgenv().CAIPet), "r") then getgenv().IndexNumber = getgenv().IndexNumber + 1 end end
                workspace.__THINGS.__REMOTES["buy egg"]:InvokeServer({[1] = getgenv().SelectedEgg,[2] = getgenv().TH})
                if idcheck(tostring(getgenv().CAIPet)) then workspace.__THINGS.__REMOTES["use rainbow machine"]:InvokeServer({[1] = {[1] = getgenv().CAIPet}}) wait(2)
                else workspace.__THINGS.__REMOTES["delete several pets"]:InvokeServer({[1] = {[1] = tostring(getgenv().CAIPet)}}) end
            end
            
            -- Check if dark matter argument, makes 6 rainbow, 1 dark matter, and then tries to convert and breaks
            if getgenv().TypeTier == "Dark Matter" then
                if getgenv().Last ~= getgenv().IndexNumber then if getgenv().IndexNumber <= #getgenv().EggReward then cprint("Now going for Index || " .. tostring(getgenv().IndexNumber).. ' || ' .. Library.Directory.Pets[tostring(getgenv().EggReward[getgenv().IndexNumber]["id"])].name) getgenv().Last = getgenv().IndexNumber end end
                for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Collection.Frame.Container.Holder:GetChildren()) do
                    if getgenv().IndexNumber > #getgenv().EggReward then break end if v:IsA("TextButton") then if v.Name == tostring(getgenv().EggReward[getgenv().IndexNumber]["id"])  then
                        if v.PetIcon.Image == Library.Directory.Pets[tostring(getgenv().EggReward[getgenv().IndexNumber]["id"])]["darkMatterThumbnail"] and not v.PetIcon.Locked.Visible then
                            if not getgenv().DisableIndexSkip then getgenv().IndexNumber = getgenv().IndexNumber + 1 end
                            wait(0.05)
                            break
                        end
                    end end
                end
                for i,v in pairs(Library.Save.Get().DarkMatterQueue) do 
                    if v.readyTime <= os.time() then workspace.__THINGS.__REMOTES:FindFirstChild("redeem dark matter pet"):InvokeServer({[1] = tostring(i)}) getgenv().Claimed = true end
                    if not table.find(getgenv().DarkMatterTable, tostring(i)) then table.insert(getgenv().DarkMatterTable, i) end
                end
                if getgenv().Claimed then wait(5) getgenv().Claimed = false end
                workspace.__THINGS.__REMOTES["buy egg"]:InvokeServer({[1] = getgenv().SelectedEgg,[2] = getgenv().TH})
                for i,v in pairs(Inventory:GetChildren())do
                if #getgenv().RainbowTable >= 6 then
                workspace.__THINGS.__REMOTES["convert to dark matter"]:InvokeServer({[1] = {getgenv().RainbowTable[1]; getgenv().RainbowTable[2]; getgenv().RainbowTable[3], getgenv().RainbowTable[4];getgenv().RainbowTable[5], getgenv().RainbowTable[6]}}) 
                getgenv().RainbowTable = {} getgenv().DarkMatterTable = {} getgenv().IndexNumber = getgenv().IndexNumber + 1 break end
                if v:IsA("TextButton") then if idcheck(tostring(v.Name)) then
                spawn(function()fordarkmatterrainbow(tostring(v.Name))end)
                if raritycheck(tostring(v.Name), "r") and not table.find(getgenv().RainbowTable, tostring(v.Name)) and idcheck(tostring(v.Name)) then
                    table.insert(getgenv().RainbowTable, tostring(v.Name))
                end
                end end end
                if not idcheck(tostring(getgenv().CAIPet)) then workspace.__THINGS.__REMOTES["delete several pets"]:InvokeServer({[1] = {[1] = tostring(getgenv().CAIPet)}}) end
                spawn(function() fordarkmatterrainbow(tostring(getgenv().CAIPet)) end)
                --if getgenv().Last ~= getgenv().IndexNumber then if getgenv().IndexNumber <= #getgenv().EggReward then cprint("Now going for Index || " .. tostring(getgenv().IndexNumber).. ' || ' .. Library.Directory.Pets[tostring(getgenv().EggReward[getgenv().IndexNumber]["id"])].name) getgenv().Last = getgenv().IndexNumber end end
                if getgenv().LastNumberOfDarkMatter ~= #getgenv().DarkMatterTable then if not getgenv().CollectionEnabled then break end cprint("Dark Matter on progress || " .. tostring(#getgenv().DarkMatterTable)) getgenv().LastNumberOfDarkMatter = #getgenv().DarkMatterTable end
                if #getgenv().DarkMatterTable >= 6 then
                while wait(1) and getgenv().CollectionEnabled do
                    getgenv().DarkMatterTable = {}
                    for i,v in pairs(Library.Save.Get().DarkMatterQueue) do 
                    if not table.find(getgenv().DarkMatterTable, tostring(i)) then table.insert(getgenv().DarkMatterTable, i) end
                    if v["readyTime"] <= os.time() then workspace.__THINGS.__REMOTES:FindFirstChild("redeem dark matter pet"):InvokeServer({[1] = i}) end
                    end
                    if #getgenv().DarkMatterTable <= 5 then break end
                end
            end
            end
            if getgenv().IndexNumber > #getgenv().EggReward then if not getgenv().CollectionEnabled then break end for i,v in pairs(getgenv().EggTable) do if v == getgenv().SelectedEgg and i > 16 then getgenv().CollectionEnabled = false cprint("Finished Collection") end
            if v == getgenv().SelectedEgg then nextegg = tostring(getgenv().EggTable[i + 1]) getgenv().SelectedEgg = nextegg EggTableFill() cprint(nextegg) wait(3) break end
            end end
            wait()
            end
    end
end)

SettingsTab:Button("Destroy PSXU", function() game:GetService("CoreGui"):FindFirstChild("ui"):Destroy()
getgenv().Bind:Disconnect() getgenv().Bind = nil getgenv().TypeTier = "None" getgenv().SelectedEgg = false getgenv().CollectionEnabled = false if getgenv().CAInventory ~= false then getgenv().CAInventory:Disconnect() end getgenv().CAInventory = false getgenv().CustomIndex = false getgenv().IndexNumber = 1
end)
SettingsTab:Toggle("Disable Index Skip",false, function(t)
    getgenv().DisableIndexSkip = t
end)



