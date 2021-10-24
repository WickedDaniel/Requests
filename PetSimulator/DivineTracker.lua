game.workspace:WaitForChild("__MAP")
getgenv().HU4fSnoKBPrOyf4asTdZd9tkgTsqvAGDr7hHAhxU649SYT11vNNYEuNmCW5lHWNZAru5 = false
repeat wait(1) until game:GetService('ContentProvider').RequestQueueSize < 1
local HeadShot, ready = game.Players:GetUserThumbnailAsync(game.Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
getgenv().HU4fSnoKBPrOyf4asTdZd9tkgTsqvAGDr7hHAhxU649SYT11vNNYEuNmCW5lHWNZAru5 = true
function infoweb()
    local ID = tostring(game.Players.LocalPlayer.UserId) local IDFormat = ID.format("https://www.roblox.com/headshot-thumbnail/image?userId=%d&width=420&height=420&format=png", ID)
    if not getgenv().Rank then t = "Disabled" elseif getgenv().Rank then t = "Enabled" else t = "Unknown" end
    if not getgenv().HCandy then t = "Disabled" elseif getgenv().HCandy then t = "Enabled" else t = "Unknown" end
    local data = {["content"] = ""; 
        ["avatar_url"] = IDFormat;
        ["username"] = "Stats Tracker";
        ["embeds"] = {{
        ["title"] = "Tracker set up"; 
        ["color"] = tonumber("10940962"); 
        ["thumbnail"] = {["url"] = "https://media.discordapp.net/attachments/854170869579382795/901884280521785445/pngegg.png"};
        ["fields"] = {
        { ["name"] = "> **Rank Rewards tracker:      **"; ["value"] = "```" .. tostring(t) .. "```"; ["inline"] = true; };
        { ["name"] = "> **Halloween Candy tracker:      **"; ["value"] = "```" .. tostring(t) .. "```"; ["inline"] = true; };
        };
        }}
        ;}
        getgenv().response = syn.request({
        Url = getgenv().WebhookURL,
        Method = 'POST', Headers = { ['Content-Type'] = 'application/json'}, Body = game:GetService('HttpService'):JSONEncode(data)
        });
end
function send(t)
local Library = require(game:GetService("ReplicatedStorage").Framework.Library) local Save = Library.Save.Get()
if Library.Save.Get()["BoostsInventory"]["Triple Coins"] then tc = Library.Save.Get()["BoostsInventory"]["Triple Coins"] else tc = 0  end
if Library.Save.Get()["BoostsInventory"]["Super Lucky"] then sp = Library.Save.Get()["BoostsInventory"]["Super Lucky"] else sp = 0 end
if Library.Save.Get()["BoostsInventory"]["Ultra Lucky"] then ul = Library.Save.Get()["BoostsInventory"]["Ultra Lucky"] else ul = 0 end
local peticonimage = "rbxassetid://7402604294" local image = peticonimage:gsub("rbxassetid%:%/%/", "")
        local image = image.format("https://www.roblox.com/asset-thumbnail/image?assetId=%d&width=420&height=420&format=png", image)
        local data = {["content"] = ""; 
        ["embeds"] = {{
        ["title"] = "Timer for " .. tostring(game.Players.LocalPlayer.Name); 
        ["color"] = tonumber("10497745"); 
        ["thumbnail"] = {["url"] = image;};
        ["fields"] = {
        { ["name"] = "> **Rank Timer      **"; ["value"] = "```" .. tostring(t) .. "```"; ["inline"] = true; };
        { ["name"] = "> **Last Claim          **"; ["value"] = "```" .. tostring(getgenv().SinceLastCollected)  .. "```"; ["inline"] = true; };
        { ["name"] = "> **Times Claimed   **"; ["value"] = "```" .. tostring(getgenv().TimesCollected) .. "```" ; ["inline"] = true; };
        { ["name"] = "> **Super Lucky     **"; ["value"] = "```" .. tostring(sp) .. "```" ; ["inline"] = true; };
        { ["name"] = "> **Ultra Lucky     **"; ["value"] = "```" .. tostring(ul) .. "```" ; ["inline"] = true; };
        { ["name"] = "> **Triple Coins     **"; ["value"] = "```" .. tostring(tc) .. "```" ; ["inline"] = true; };
        };
        }}
        ;}
        getgenv().response = syn.request({
        Url = getgenv().WebhookURL,
        Method = 'POST', Headers = { ['Content-Type'] = 'application/json'}, Body = game:GetService('HttpService'):JSONEncode(data)
        });
end
function candyweb(t, t2, t3)
local Library = require(game:GetService("ReplicatedStorage").Framework.Library) local Save = Library.Save.Get()
local peticonimage = "rbxassetid://7799128977" local image = peticonimage:gsub("rbxassetid%:%/%/", "")
        local image = image.format("https://www.roblox.com/asset-thumbnail/image?assetId=%d&width=420&height=420&format=png", image)
        local data = {["content"] = ""; 
        ["embeds"] = {{
        ["title"] = "Halloween Candy (" .. tostring(game:GetService("Players").DivineEntity01.PlayerGui.Main.Right["Halloween Candy"].Amount.Text) .. ")"; 
        ["color"] = tonumber("10047689"); 
        ["thumbnail"] = {["url"] = image;};
        ["fields"] = {
        { ["name"] = "**Earned in the last 60 seconds:**"; ["value"] = tostring(t); ["inline"] = true; };
        { ["name"] = "**Earned in this session:**"; ["value"] = tostring(t2); ["inline"] = false; };
        { ["name"] = "**Starting value:**"; ["value"] = tostring(t3); ["inline"] = false; };
        };
        }}
        ;}
        getgenv().response = syn.request({
        Url = getgenv().WebhookURL,
        Method = 'POST', Headers = { ['Content-Type'] = 'application/json'}, Body = game:GetService('HttpService'):JSONEncode(data)
        });
end
coroutine.wrap(function()
local Library = require(game:GetService("ReplicatedStorage").Framework.Library)
if not getgenv().HU4fSnoKBPrOyf4asTdZd9tkgTsqvAGDr7hHAhxU649SYT11vNNYEuNmCW5lHWNZAru5 then return end
infoweb()
getgenv().SinceLastCollected = "Unknown"
getgenv().TimesCollected = 0
getgenv().EarnedTotal = 0
getgenv().OldCandy = Library.Save.Get()["Halloween Candy"]
local SHC = game:GetService("Players").DivineEntity01.PlayerGui.Main.Right["Halloween Candy"].Amount.Text
while getgenv().HU4fSnoKBPrOyf4asTdZd9tkgTsqvAGDr7hHAhxU649SYT11vNNYEuNmCW5lHWNZAru5 do
local Seconds = os.time()
if (Seconds % 60 == 0) then 
if getgenv().Rank then
        local Library = require(game:GetService("ReplicatedStorage").Framework.Library) local Save = Library.Save.Get()
        local OC = os.clock() local CD = Library.Directory.Ranks[Save.Rank].rewardCooldown - (Library.Network.Invoke("Get OSTime") + (OC - os.clock()) - Save.RankTimer)
        local CDD = os.date("!%X", CD)
        if CD <= 5 then
            send("Ready!")
            local Library = require(game:GetService("ReplicatedStorage").Framework.Library)
            Library.Network.Invoke("redeem rank rewards", {})
            getgenv().SinceLastCollected = os.date("%X", os.time())
            getgenv().TimesCollected = getgenv().TimesCollected + 1
        else
            if not Alt then send(tostring(CDD)) end
        end
end
if getgenv().HCandy then
    getgenv().NewCandy = Library.Save.Get()["Halloween Candy"]
    local Library = require(game:GetService("ReplicatedStorage").Framework.Library)
    local function AddComma(amount)
            local formatted = amount
            while true do
                formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", "%1,%2")
                if (k == 0) then
                    break
                end
            end
            return formatted
    end
    local Average =  NewCandy - OldCandy local CommadAverage = AddComma(Average)
    getgenv().EarnedTotal = getgenv().EarnedTotal + Average local CommadEarned = AddComma(getgenv().EarnedTotal)
    candyweb(CommadAverage, CommadEarned, SHC)
    getgenv().OldCandy = Library.Save.Get()["Halloween Candy"]
end
		wait(1)
	end
	wait(0.2) 
    end
end)()
