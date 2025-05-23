GossipFrame:HookScript("OnShow", function()
    local gossipOptions = C_GossipInfo.GetOptions()
    
    if gossipOptions and #gossipOptions > 0 then
        local locale = GetLocale()
        local patterns = {}
        
        if locale == "ruRU" then
            patterns = {
                "^Надеть безликую маску*",
                "^Я помогу тебе. <Помочь Гароне подняться.>*"
            }
        elseif locale == "ptBR" then
                patterns = {
                    "^Coloque a Máscara Sem Rosto*",
                    "^Você tem minha ajuda%. <Ajude Garona a se levantar>*"
                }
        elseif locale == "frFR" then
            patterns = {
                "^Mettre le masque sans-visage*",
                "^Vous avez mon soutien%. <Aider Garona à se relever>*"
            }
        else
            patterns = {
                "^Put on the Faceless Mask*",
                "^You have my aid%. <Help Garona up>*"
            }
        end
        
        for i, option in ipairs(gossipOptions) do
            if option.name then
                for _, pattern in ipairs(patterns) do
                    if string.match(tostring(option.name), pattern) then
                        C_GossipInfo.SelectOption(option.gossipOptionID)
                        break
                    end
                end
            end
        end
    end
end)