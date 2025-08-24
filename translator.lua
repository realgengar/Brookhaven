
local Translator = {}
Translator.currentLang = "pt"

local TRANSLATIONS_URL = "https://raw.githubusercontent.com/realgengar/Brookhaven/refs/heads/main/translations.lua"

local function loadTranslations()
    local success, result = pcall(function()
        local response = game:HttpGet(TRANSLATIONS_URL)
        return loadstring(response)()
    end)
    
    if success and result then
        Translator.translations = result
        return true
    else
        Translator.translations = {
            pt = {
                ["Anti ChatSpy"] = "Anti ChatSpy",
                ["Velocidade"] = "Velocidade",
                ["Configurações"] = "Configurações",
                ["Selecionar Idioma"] = "Selecionar Idioma"
            },
            en = {
                ["Anti ChatSpy"] = "Anti ChatSpy", 
                ["Velocidade"] = "Speed",
                ["Configurações"] = "Settings",
                ["Selecionar Idioma"] = "Select Language"
            },
            es = {
                ["Anti ChatSpy"] = "Anti ChatSpy",
                ["Velocidade"] = "Velocidad", 
                ["Configurações"] = "Configuraciones",
                ["Selecionar Idioma"] = "Seleccionar Idioma"
            }
        }
        return false
    end
end

function Translator.T(text)
    if Translator.translations[Translator.currentLang] and 
       Translator.translations[Translator.currentLang][text] then
        return Translator.translations[Translator.currentLang][text]
    end
    return text
end

function Translator.setLanguage(lang)
    if Translator.translations[lang] then
        Translator.currentLang = lang
        return true
    end
    return false
end

loadTranslations()

return Translator
