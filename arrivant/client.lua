ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



-- MENU FUNCTION --

local open = false 
local mainMenu6 = RageUI.CreateMenu('Menu Arrivant', 'Intéraction Disponibles')
local touche = RageUI.CreateSubMenu(mainMenu6, 'Touche', 'Intéraction Disponibles')
local lieux = RageUI.CreateSubMenu(mainMenu6, 'Lieux', 'Intéraction Disponibles')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
  FreezeEntityPosition(PlayerPedId(), false)

end



function OpenMenuArrivant()
     if open then 
         open = false
         RageUI.Visible(mainMenu6, false)
         return
     else
         open = true 
         RageUI.Visible(mainMenu6, true)
         CreateThread(function()
         while open do 
            RageUI.IsVisible(mainMenu6,function() 

                
            
                
                RageUI.Button("Discord", nil, { RightLabel = "→→"}, true , {
                  onSelected = function()
                    ESX.ShowNotification('~b~Discord~s~ \nVoici le lien Discord du serveur : ~g~https://discord.gg/KzvQqvPb7p')

                  end
                })

                RageUI.Button("Touches | Commandes", nil, { RightLabel = "→→"}, true , {
                  onSelected = function()

                  end
                }, touche)

                RageUI.Button("Lieux dans la ville", nil, { RightLabel = "→→"}, true , {
                  onSelected = function()

                  end
                }, lieux)




                  RageUI.Button("Fermer", "Bon jeu !!", {Color = {BackgroundColor = {255, 0, 0, 50}}, RightLabel = "→→"}, true , {
                    onSelected = function()
                        RageUI.CloseAll()
                    end
                  })
            
            end)
            RageUI.IsVisible(touche,function()
              RageUI.Separator("↓ ~g~Liste des Touches~s~ ↓")
                        for k,v in pairs(Config.Touche) do
                            RageUI.Button(v.label, false, {RightLabel = v.right}, true, {
                                onSelected = function()
                                    
                                end
                            })
                        end
            end)

            RageUI.IsVisible(lieux,function()
              RageUI.Separator("↓ ~g~Liste des Lieux de début~s~ ↓")
              
                RageUI.Button("Pôle Emploi", nil, { RightLabel = "→→"}, true , {
                  onSelected = function()
                    SetNewWaypoint(-509.94, -1001.59)
                    ESX.ShowNotification("Vous avez le point du ~b~Pôle Emploi~w~ sur votre gps.") 

                  end
                })

                RageUI.Button("Magasin de Téléphone", nil, { RightLabel = "→→"}, true , {
                  onSelected = function()
                    SetNewWaypoint(-629.76, -276.78)
                    ESX.ShowNotification("Vous avez le point du ~b~Magasin de Téléphone~w~ sur votre gps.") 

                  end
                })

                RageUI.Button("Auto Ecole", nil, { RightLabel = "→→"}, true , {
                  onSelected = function()
                    SetNewWaypoint(228.21, 373.4)
                    ESX.ShowNotification("Vous avez le point de ~b~l\'Auto Ecole~w~ sur votre gps.") 

                  end
                })

                

                RageUI.Button("Supérette", nil, { RightLabel = "→→"}, true , {
                  onSelected = function()
                    SetNewWaypoint(26.05, -1345.72)
                    ESX.ShowNotification("Vous avez le point d\'une ~b~Supérette~w~ sur votre gps.") 

                  end
                })

          

                
              
                
            end)
          Wait(0)
         end
      end)
   end
end




local position = {
	{x = -1035.92, y = -2734.51, z = 20.17}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData  then 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
       if dist <= 1.0 then
               wait = 1
                ESX.ShowHelpNotification("Appuyer sur~b~ ~INPUT_PICKUP~ pour ouvrir le menu arrivant") 
                if IsControlJustPressed(1,51) then
                  OpenMenuArrivant()
            end
        end
      end
    Citizen.Wait(wait)
    end
  end
end)

Citizen.CreateThread(function()
  local hash = GetHashKey("u_m_y_baygor")
  while not HasModelLoaded(hash) do
  RequestModel(hash)
  Wait(20)
  end
  ped = CreatePed("PED_TYPE_CIVFEMALE", "u_m_y_baygor", -1035.58, -2733.87, 19.17, 155.36, false, true)
  SetBlockingOfNonTemporaryEvents(ped, true)
  FreezeEntityPosition(ped, true)
  CreateFakeMpGamerTag(ped, "Peter", false, false, false, false)
  SetEntityInvincible(ped, true)
end)


