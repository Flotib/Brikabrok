--[[

        _______      ______   ______ _____ _     _ _______ ______   ______  _____  _     _
 |      |______      |_____] |_____/   |   |____/  |_____| |_____] |_____/ |     | |____/ 
 |_____ |______      |_____] |    \_ __|__ |    \_ |     | |_____] |    \_ |_____| |    \_
                                                                                          

    MIT License

    Copyright (c) BinarySpace

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.

--]]



local Brikabrok = LibStub("AceAddon-3.0"):GetAddon("Brikabrok")
BrikabrokUI = Brikabrok:NewModule("UI", "AceEvent-3.0")
local AceGUI = LibStub("AceGUI-3.0")
-----------------------------------
----------- Main Frame ------------
-----------------------------------


function BrikabrokUI:OnEnable()

--[[
**	 DrawGroup1
**	 Draws the first tab of the main frame aka Spells
**		container: Which container hold this
--]]
function Brikabrok:DrawGroup1(container)
	if Brikabrok.db ~= nil then
	  Brikabrok.BuildSpData(Brikabrok.db.profile.spells) 
	end
end
--[[
**	 DrawGroup2
**	 Draws the second tab of the main frame aka Gobs
**		container: Which container hold this
--]]
function Brikabrok:DrawGroup2(container)
	if Brikabrok.db ~= nil then
		Brikabrok.BuildGobsData(Brikabrok.db.profile.gobs)
	end
end


--[[
**	 DrawGroup3
**	 Draws the third tab of the main frame aka ForgeInfo
**		container: Which container hold this
--]]
--[[
**   DrawGroup2
**   Draws the second tab of the main frame aka Gobs
**    container: Which container hold this
--]]
function Brikabrok:DrawGroup2(container)
  if Brikabrok.db ~= nil then
    Brikabrok.BuildGobsData(Brikabrok.db.profile.gobs)
  end
end


--[[
**   DrawGroup3
**   Draws the third tab of the main frame aka ForgeInfo
**    container: Which container hold this
--]]
function Brikabrok:DrawGroup3(container)

  local forgeinfoCommand = AceGUI:Create("Button")
  forgeinfoCommand:SetPoint("Top", 10, 10)
  forgeinfoCommand:SetPoint("Center")
  forgeinfoCommand:SetText("Forge Info")
  forgeinfoCommand:SetWidth(200)
  forgeinfoCommand:SetCallback("OnClick", function() SendChatMessage(".forge info", "GUILD") end)
  Brikabrok:addToScroll(forgeinfoCommand)
  
  Brikabrok:createHeading("Apparence")

  -- Very BAD code incoming, I didn't figure out how to do this yet properly in Lua :'(
  
   local customCode = AceGUI:Create("EditBox")
   customCode:SetText("Custom")
   customCode:SetLabel("Custom")
   Brikabrok:addToScroll(customCode)

  Brikabrok:createHeading("Tenue et armes")

  local editbox1 = AceGUI:Create("EditBox")
  editbox1:SetText("Casque")
  editbox1:SetLabel("Casque")
  Brikabrok:addToScroll(editbox1)
  
  local editbox2 = AceGUI:Create("EditBox")
  editbox2:SetText("Epaulières")
  editbox2:SetLabel("Epaulières")
  Brikabrok:addToScroll(editbox2)
  
  local editbox3 = AceGUI:Create("EditBox")
  editbox3:SetText("Chemise")
  editbox3:SetLabel("Chemise")
  Brikabrok:addToScroll(editbox3)
  
  local editbox4 = AceGUI:Create("EditBox")
  editbox4:SetText("Torse")
  editbox4:SetLabel("Torse")
  Brikabrok:addToScroll(editbox4)
  
  local editbox5 = AceGUI:Create("EditBox")
  editbox5:SetText("Ceinture")
  editbox5:SetLabel("Ceinture")
  Brikabrok:addToScroll(editbox5)
  
  local editbox6 = AceGUI:Create("EditBox")
  editbox6:SetText("Jambières")
  editbox6:SetLabel("Jambières")
  Brikabrok:addToScroll(editbox6)
  
  local editbox7 = AceGUI:Create("EditBox")
  editbox7:SetText("Bottes")
  editbox7:SetLabel("Bottes")
  Brikabrok:addToScroll(editbox7)
  
  local editbox8 = AceGUI:Create("EditBox")
  editbox8:SetText("Brassards")
  editbox8:SetLabel("Brassards")
  Brikabrok:addToScroll(editbox8)
  
  local editbox9 = AceGUI:Create("EditBox")
  editbox9:SetText("Gants")
  editbox9:SetLabel("Gants")
  Brikabrok:addToScroll(editbox9)
  
  local editbox10 = AceGUI:Create("EditBox")
  editbox10:SetText("Cape")
  editbox10:SetLabel("Cape")
  Brikabrok:addToScroll(editbox10)
  
  local editbox11 = AceGUI:Create("EditBox")
  editbox11:SetText("Tabard")
  editbox11:SetLabel("Tabard")
  Brikabrok:addToScroll(editbox11)
  
  local editbox12 = AceGUI:Create("EditBox")
  editbox12:SetText("Arme Droite")
  editbox12:SetLabel("Arme Droite")
  Brikabrok:addToScroll(editbox12)
  
  local editbox13 = AceGUI:Create("EditBox")
  editbox13:SetText("Arme Gauche")
  editbox13:SetLabel("Arme Gauche")
  Brikabrok:addToScroll(editbox13)

function findID (self,event,msg)
 if string.match (msg, "DisplayID du casque") then
  for guid in string.gmatch(msg, "DisplayID du casque : (%-?%d+).") do
     editbox1:SetText(guid)
  end
 elseif string.match (msg, "DisplayID des épaulières") then
  for guid in string.gmatch(msg, "DisplayID des épaulières : (%-?%d+).") do
     editbox2:SetText(guid)
  end
 elseif string.match (msg, "DisplayID de la chemise") then
  for guid in string.gmatch(msg, "DisplayID de la chemise : (%-?%d+).") do
     editbox3:SetText(guid)
  end
 elseif string.match (msg, "DisplayID du torse") then
  for guid in string.gmatch(msg, "DisplayID du torse : (%-?%d+).") do
     editbox4:SetText(guid)
  end
 elseif string.match (msg, "DisplayID de la ceinture") then
  for guid in string.gmatch(msg, "DisplayID de la ceinture : (%-?%d+).") do
     editbox5:SetText(guid)
  end
 elseif string.match (msg, "DisplayID des jambières") then
  for guid in string.gmatch(msg, "DisplayID des jambières : (%-?%d+).") do
     editbox6:SetText(guid)
  end
 elseif string.match (msg, "DisplayID des bottes") then
  for guid in string.gmatch(msg, "DisplayID des bottes : (%-?%d+).") do
     editbox7:SetText(guid)
  end
 elseif string.match (msg, "DisplayID des brassards") then
  for guid in string.gmatch(msg, "DisplayID des brassards: (%-?%d+)") do
     editbox8:SetText(guid)
  end
 elseif string.match (msg, "DisplayID des gants") then
  for guid in string.gmatch(msg, "DisplayID des gants: (%-?%d+).") do
     editbox9:SetText(guid)
  end
 elseif string.match (msg, "DisplayID de la cape") then
  for guid in string.gmatch(msg, "DisplayID de la cape: (%-?%d+).") do
     editbox10:SetText(guid)
  end
 elseif string.match (msg, "DisplayID du tabard") then
  for guid in string.gmatch(msg, "DisplayID du tabard: (%-?%d+).") do
     editbox11:SetText(guid)
  end
 elseif string.match (msg, "Code Customisation") then
   local firstHalf = msg:gsub('Code Customisation : ', '')
   local sndHalf = firstHalf:sub(1, -2)
   customCode:SetText(sndHalf)
 elseif string.match (msg, "ID de l'arme droite") then
   for guid in string.gmatch(msg, "ID de l'arme droite : (%-?%d+).") do
      editbox12:SetText(guid)
   end
 elseif string.match (msg, "ID de l'arme gauche") then
  for guid in string.gmatch(msg, "ID de l'arme gauche : (%-?%d+).") do
     editbox13:SetText(guid)
  end
  return false
 end
end

for k, v in pairs({"EMOTE", "GUILD", "OFFICER", "PARTY", "PARTY_LEADER", "RAID", "RAID_LEADER", "SAY", "SYSTEM", "WHISPER", "WHISPER_INFORM", "YELL"}) do
  ChatFrame_AddMessageEventFilter("CHAT_MSG_"..v, findID)
end

end



--[[
**	 DrawGroup4
**	 Draws the fourth tab of the main frame aka Divers
**		container: Which container hold this
--]]
function Brikabrok:DrawGroup4(container)

for i = 1, #BrikabrokSliders do
  local slName = BrikabrokSliders[i][1]
  local slMin = BrikabrokSliders[i][2]
  local slMax = BrikabrokSliders[i][3]
  local slMessage = BrikabrokSliders[i][4]
  
  
  local slList = AceGUI:Create("Slider")
  slList:SetLabel(slName)
  slList:SetValue(slMin)
  slList:SetSliderValues(slMin,slMax,slMin)
       callbacks = {
        OnValueChanged = function (value, container, event, group)  end ,
        OnMouseUp = function (self) SendChatMessage(BrikabrokSliders[i][4]..self.editbox:GetText(), "SAY") end ,
             }
  Brikabrok:addCallbacks(slList, callbacks)
  Brikabrok:addToScroll(slList)
  


end

for i = 1, #BrikabrokChecks do

  local cName = BrikabrokChecks[i][1]
  
  local cList = AceGUI:Create("CheckBox")
  cList:SetLabel(cName)
  sliderCallbacks = {
        OnValueChanged = function (value, container, event, group) SendChatMessage(BrikabrokChecks[i][cList:GetValue()], "GUILD")  end ,
  }
  Brikabrok:addCallbacks(cList, sliderCallbacks)
  Brikabrok:addToScroll(cList)
end
end

function Brikabrok:DrawGroup5(container)
	if Brikabrok.db ~= nil then
		Brikabrok.BuildAnimationsData(Brikabrok.db.profile.anim)
	end
end

function Brikabrok:DrawGroup6(container)
  Brikabrok.BuildMacrosData()
end

function Brikabrok:DrawGroup7(container)
	Brikabrok:createHeading("Spells RP")
  
	local spellsOne = AceGUI:Create("Button")
	spellsOne:SetPoint("Center")
	spellsOne:SetText("Spells 1")
	spellsOne:SetCallback("OnClick", function() SendChatMessage(".lea 196") SendChatMessage(".lea 197") SendChatMessage(".lea 198") SendChatMessage(".lea 199") SendChatMessage(".lea 200") SendChatMessage(".lea 201") SendChatMessage(".lea 202") SendChatMessage(".lea 227") SendChatMessage(".lea 264") SendChatMessage(".lea 266") SendChatMessage(".lea 5011") SendChatMessage(".lea 1180") SendChatMessage(".lea 15590") SendChatMessage(".lea 5009") SendChatMessage(".lea 9077") SendChatMessage(".lea 8737") SendChatMessage(".lea 750") SendChatMessage(".lea 9116") SendChatMessage(".lea 674") SendChatMessage(".lea 46917") SendChatMessage(".lea 100321") end)
	Brikabrok:addToScroll(spellsOne)

	local spellsTwo = AceGUI:Create("Button")
	spellsTwo:SetPoint("Center")
	spellsTwo:SetText("Spells 2")
	spellsTwo:SetCallback("OnClick", function() SendChatMessage(".lea 42880") SendChatMessage(".lea 42902") SendChatMessage(".lea 42889") SendChatMessage(".lea 42901") SendChatMessage(".lea 69873") SendChatMessage(".lea 70092") SendChatMessage(".lea 42908") SendChatMessage(".lea 42906") SendChatMessage(".lea 42963") SendChatMessage(".lea 16723") SendChatMessage(".lea 88390") SendChatMessage(".lea 94610") SendChatMessage(".lea 80264") SendChatMessage(".lea 80109") SendChatMessage(".lea 74301") SendChatMessage(".lea 80612") SendChatMessage(".lea 45873") SendChatMessage(".lea 46581") SendChatMessage(".lea 73669") SendChatMessage(".lea 42871") SendChatMessage(".lea 93474") end)
	Brikabrok:addToScroll(spellsTwo)

	local spellsThree = AceGUI:Create("Button")
	spellsThree:SetPoint("Center")
	spellsThree:SetText("Spells 3")
	spellsThree:SetCallback("OnClick", function() SendChatMessage(".lea 90265") SendChatMessage(".lea 90267") SendChatMessage(".lea 54197") SendChatMessage(".lea 55518") SendChatMessage(".lea 32759") SendChatMessage(".lea 71077") SendChatMessage(".lea 26659") SendChatMessage(".lea 16245") SendChatMessage(".lea 85500") SendChatMessage(".lea 104953") SendChatMessage(".lea 105008") SendChatMessage(".lea 90353") SendChatMessage(".lea 90699") SendChatMessage(".lea 91920") SendChatMessage(".lea 70153") SendChatMessage(".lea 58203") SendChatMessage(".lea 110154") SendChatMessage(".lea 105734") SendChatMessage(".lea 104945") SendChatMessage(".lea 80681") SendChatMessage(".lea 80676") end)
	Brikabrok:addToScroll(spellsThree)

	local spellsFour = AceGUI:Create("Button")
	spellsFour:SetPoint("Center")
	spellsFour:SetText("Spells 4")
	spellsFour:SetCallback("OnClick", function() SendChatMessage(".lea 95479") SendChatMessage(".lea 95480") SendChatMessage(".lea 81041") SendChatMessage(".lea 94980") SendChatMessage(".lea 42336") SendChatMessage(".lea 83615") SendChatMessage(".lea 83610") SendChatMessage(".lea 86600") SendChatMessage(".lea 86600") SendChatMessage(".lea 84823") SendChatMessage(".lea 81245") SendChatMessage(".lea 82612") SendChatMessage(".lea 92372") SendChatMessage(".lea 80126") SendChatMessage(".lea 79756") SendChatMessage(".lea 79827") SendChatMessage(".lea 79832") SendChatMessage(".lea 76183") SendChatMessage(".lea 101624") SendChatMessage(".lea 84594") SendChatMessage(".lea 107082") end)
	Brikabrok:addToScroll(spellsFour)

	local spellsFive = AceGUI:Create("Button")
	spellsFive:SetPoint("Center")
	spellsFive:SetText("Spells 5")
	spellsFive:SetCallback("OnClick", function() SendChatMessage(".lea 79116") SendChatMessage(".lea 84401") SendChatMessage(".lea 85234") SendChatMessage(".lea 92718") SendChatMessage(".lea 92719") SendChatMessage(".lea 71459") SendChatMessage(".lea 81083") SendChatMessage(".lea 81084") SendChatMessage(".lea 82020") SendChatMessage(".lea 93090") SendChatMessage(".lea 69191") SendChatMessage(".lea 90085") SendChatMessage(".lea 79157") SendChatMessage(".lea 79252") SendChatMessage(".lea 81723") SendChatMessage(".lea 97134") SendChatMessage(".lea 100320") SendChatMessage(".lea 69356") SendChatMessage(".lea 9487") SendChatMessage(".lea 79116") SendChatMessage(".lea 668") end)
	Brikabrok:addToScroll(spellsFive)

	local spellsSix = AceGUI:Create("Button")
	spellsSix:SetPoint("Center")
	spellsSix:SetText("Tout apprendre [!]Crash Risk")
	spellsSix:SetCallback("OnClick", function() SendChatMessage(".lea 196") SendChatMessage(".lea 197") SendChatMessage(".lea 198") SendChatMessage(".lea 199") SendChatMessage(".lea 200") SendChatMessage(".lea 201") SendChatMessage(".lea 202") SendChatMessage(".lea 227") SendChatMessage(".lea 264") SendChatMessage(".lea 266") SendChatMessage(".lea 5011") SendChatMessage(".lea 1180") SendChatMessage(".lea 15590") SendChatMessage(".lea 5009") SendChatMessage(".lea 9077") SendChatMessage(".lea 8737") SendChatMessage(".lea 750") SendChatMessage(".lea 9116") SendChatMessage(".lea 674") SendChatMessage(".lea 46917") SendChatMessage(".lea 100321") SendChatMessage(".lea 42880") SendChatMessage(".lea 42902") SendChatMessage(".lea 42889") SendChatMessage(".lea 42901") SendChatMessage(".lea 69873") SendChatMessage(".lea 70092") SendChatMessage(".lea 42908") SendChatMessage(".lea 42906") SendChatMessage(".lea 42963") SendChatMessage(".lea 16723") SendChatMessage(".lea 88390") SendChatMessage(".lea 94610") SendChatMessage(".lea 80264") SendChatMessage(".lea 80109") SendChatMessage(".lea 74301") SendChatMessage(".lea 80612") SendChatMessage(".lea 45873") SendChatMessage(".lea 46581") SendChatMessage(".lea 73669") SendChatMessage(".lea 42871") SendChatMessage(".lea 93474") SendChatMessage(".lea 90265") SendChatMessage(".lea 90267") SendChatMessage(".lea 54197") SendChatMessage(".lea 55518") SendChatMessage(".lea 32759") SendChatMessage(".lea 71077") SendChatMessage(".lea 26659") SendChatMessage(".lea 16245") SendChatMessage(".lea 85500") SendChatMessage(".lea 104953") SendChatMessage(".lea 105008") SendChatMessage(".lea 90353") SendChatMessage(".lea 90699") SendChatMessage(".lea 91920") SendChatMessage(".lea 70153") SendChatMessage(".lea 58203") SendChatMessage(".lea 110154") SendChatMessage(".lea 105734") SendChatMessage(".lea 104945") SendChatMessage(".lea 80681") SendChatMessage(".lea 80676") SendChatMessage(".lea 95479") SendChatMessage(".lea 95480") SendChatMessage(".lea 81041") SendChatMessage(".lea 94980") SendChatMessage(".lea 42336") SendChatMessage(".lea 83615") SendChatMessage(".lea 83610") SendChatMessage(".lea 86600") SendChatMessage(".lea 86600") SendChatMessage(".lea 84823") SendChatMessage(".lea 81245") SendChatMessage(".lea 82612") SendChatMessage(".lea 92372") SendChatMessage(".lea 80126") SendChatMessage(".lea 79756") SendChatMessage(".lea 79827") SendChatMessage(".lea 79832") SendChatMessage(".lea 76183") SendChatMessage(".lea 101624") SendChatMessage(".lea 84594") SendChatMessage(".lea 107082") SendChatMessage(".lea 79116") SendChatMessage(".lea 84401") SendChatMessage(".lea 85234") SendChatMessage(".lea 92718") SendChatMessage(".lea 92719") SendChatMessage(".lea 71459") SendChatMessage(".lea 81083") SendChatMessage(".lea 81084") SendChatMessage(".lea 82020") SendChatMessage(".lea 93090") SendChatMessage(".lea 69191") SendChatMessage(".lea 90085") SendChatMessage(".lea 79157") SendChatMessage(".lea 79252") SendChatMessage(".lea 81723") SendChatMessage(".lea 97134") SendChatMessage(".lea 100320") SendChatMessage(".lea 69356") SendChatMessage(".lea 9487") SendChatMessage(".lea 79116") SendChatMessage(".lea 668") end)
	Brikabrok:addToScroll(spellsSix)

	
	
   Brikabrok:createHeading("Spellviskit")

   idSVK = 1

   local SVK = AceGUI:Create("EditBox")
   SVK:SetText(idSVK)
   SVK:SetPoint("Center")
   SVK:SetLabel("Spellviskit ID")
   Brikabrok:addToScroll(SVK)

   Brikabrok.guidEditBox = idSVK

   local TrySVK = AceGUI:Create("Button")
   TrySVK:SetPoint("Center")
   TrySVK:SetText("Essayer")
   TrySVK:SetCallback("OnClick", function() SendChatMessage(".spellviskit "..SVK:GetText()) end)
   Brikabrok:addToScroll(TrySVK)


   local UnSVK = AceGUI:Create("Button")
   UnSVK:SetPoint("Center")
   UnSVK:SetText("Retirer")
   UnSVK:SetCallback("OnClick", function() SendChatMessage(".unspellviskit "..SVK:GetText()) end)
   Brikabrok:addToScroll(UnSVK)

   local IncSVK = AceGUI:Create("Button")
   IncSVK:SetPoint("Center")
   IncSVK:SetText("Suivant")
   IncSVK:SetCallback("OnClick", function() SendChatMessage(".unspellviskit "..SVK:GetText()) idSVK=random(110000) SVK:SetText(idSVK) SendChatMessage(".spellviskit "..SVK:GetText()) print("Spellviskit ", idSVK) end)
   Brikabrok:addToScroll(IncSVK)


   Brikabrok:createHeading("Spellvis")

   idSV = 1

   local SV = AceGUI:Create("EditBox")
   SV:SetText(idSVK)
   SV:SetPoint("Center")
   SV:SetLabel("Spellvis ID")
   Brikabrok:addToScroll(SV)

   Brikabrok.guidEditBox = idSV

   local TrySV = AceGUI:Create("Button")
   TrySV:SetPoint("Center")
   TrySV:SetText("Essayer")
   TrySV:SetCallback("OnClick", function() SendChatMessage(".spellvis "..SV:GetText()) end)
   Brikabrok:addToScroll(TrySV)


   local UnSV = AceGUI:Create("Button")
   UnSV:SetPoint("Center")
   UnSV:SetText("Retirer")
   UnSV:SetCallback("OnClick", function() SendChatMessage(".unspellvis "..SV:GetText()) end)
   Brikabrok:addToScroll(UnSV)

   local IncSV = AceGUI:Create("Button")
   IncSV:SetPoint("Center")
   IncSV:SetText("Suivant")
   IncSV:SetCallback("OnClick", function() SendChatMessage(".unspellvis "..SV:GetText()) idSV=random(110000) SV:SetText(idSV) SendChatMessage(".spellvis "..SV:GetText()) print("Spellvis ", idSV) end)
   Brikabrok:addToScroll(IncSV)

end

--[[
**	 SelectGroup
**	 Callback function for OnGroupSelected
**		container: Which container hold this
**		event: ...
**		group: ...
--]]
local function SelectGroup(container, event, group)
    container:ReleaseChildren()
    container:SetLayout("Flow")


    local scrollContainer = AceGUI:Create("SimpleGroup")
    scrollContainer:SetRelativeWidth(0.6)
    scrollContainer:SetFullHeight(true)
    scrollContainer:SetLayout("Fill")
    container:AddChild(scrollContainer)

    brikabrokScroll = AceGUI:Create("ScrollFrame")
    brikabrokScroll:SetFullHeight(true)
    brikabrokScroll:SetLayout("Flow")
    scrollContainer:AddChild(brikabrokScroll)
   
   if group == "tab1" then
      Brikabrok:DrawGroup1(container)
   elseif group == "tab2" then
      Brikabrok:DrawGroup2(container)
   elseif group == "tab3" then
      Brikabrok:DrawGroup3(container)
   elseif group == "tab4" then
      Brikabrok:DrawGroup4(container)
   elseif group == "tab5" then
      Brikabrok:DrawGroup5(container)
   elseif group == "tab6" then
      Brikabrok:DrawGroup6(container)
   elseif group == "tab7" then
      Brikabrok:DrawGroup7(container)
   end
end

-- Create main frame
local mainFrame = AceGUI:Create("Brikabrok")
mainFrame:SetTitle("Le Brikabrok")
mainFrame:SetLayout("Fill")

-- Add tabs here
local tab =  AceGUI:Create("TabGroup")
tab:SetLayout("Flow")
tab:SetTabs({{text="Spells", value="tab1"},{text="Gobs", value="tab2"},{text="Forge", value="tab3"}, {text="Divers", value="tab4"}, {text="Animations", value="tab5"}, {text="Macros", value="tab6"}, {text="Autres", value="tab7"}})
tab:SetCallback("OnGroupSelected", SelectGroup)
tab:SelectTab("tab1")
mainFrame:AddChild(tab)

function Brikabrok:OpenMainFrame()
  if Brikabrok.db.profile.everything.autoclose then
    if Brikabrok:IsVisibleEasyFrame() or Brikabrok:IsVisibleDevFrame() then
      Brikabrok:CloseEasyFrame()
      Brikabrok:CloseDevFrame()
      mainFrame:Show()
    else
      mainFrame:Show()
    end
  else
    mainFrame:Show()
  end
end

function Brikabrok:CloseMainFrame()
  mainFrame:Hide()
end

function Brikabrok:IsVisibleMainFrame()
  if mainFrame:IsVisible() then
    return true
  else
    return false
  end
end

end