if myHero.charName ~= "Zed"  or not VIP_USER then return end
local version = 0.5
local AUTOUPDATE = true
local SCRIPT_NAME = "SXZed"
require 'VPrediction'
require "SxOrbwalk"
--require 'Prodiction' 
require 'Collision'
require 'DivinePred'
require 'HPrediction'


-- Constants --
local ignite, igniteReady = nil, nil
local ts = nil
local VP = nil
local qOff, wOff, eOff, rOff = 0,0,0,0
local abilitySequence = {1,3,2,1,1,4,1,3,1,3,4,3,3,2,2,4,2,2}
local Ranges = { AA = 550 }
local skills = {
	SkillQ = { ready = true, name = "Razor Shuriken", range = 900, delay = 0.5, speed = math.huge, width = 45.0 },
	SkillW = { ready = true, name = "Living Shadow", range = 550, delay = 0.5, speed = 1600, width = 40.0 },
	SkillE = { ready = true, name = "Shadow Slash", range = 280, delay = 0, speed = 0, width = 300.0 },
	SkillR = { ready = true, name = "Death Mark", range = 625, delay = 0.5, speed = math.huge, width = 0.0 },
}
--[[ Slots Itens ]]--
local tiamatSlot, hydraSlot, youmuuSlot, bilgeSlot, bladeSlot, dfgSlot, divineSlot = nil, nil, nil, nil, nil, nil, nil
local tiamatReady, hydraReady, youmuuReady, bilgeReady, bladeReady, dfgReady, divineReady = nil, nil, nil, nil, nil, nil, nil

--[[Auto Attacks]]--
local lastBasicAttack = 0
local swingDelay = 0.25
local swing = false

--[[Misc]]--
local lastSkin = 0
local isSAC = false
local isMMA = false
local target = nil

function CheckUpdate()
        local scriptName = "SXZed"
        local version = 1.5
        local ToUpdate = {}
        ToUpdate.Version = version
        ToUpdate.Host = "raw.githubusercontent.com"
        ToUpdate.VersionPath = "/syraxtepper/bolscripts/master/SXZed"..scriptName..".version"
        ToUpdate.ScriptPath = "/syraxtepper/bolscripts/master/SXZed"..scriptName..".lua"
        ScriptUpdate(ToUpdate.Version, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath)
end
class "ScriptUpdate"
function ScriptUpdate:__init(LocalVersion, Host, VersionPath, ScriptPath)
    self.LocalVersion = LocalVersion
    self.Host = Host
    self.VersionPath = '/BoL/TCPUpdater/GetScript2.php?script='..self:Base64Encode(self.Host..VersionPath)..'&rand='..math.random(99999999)
    self.ScriptPath = '/BoL/TCPUpdater/GetScript2.php?script='..self:Base64Encode(self.Host..ScriptPath)..'&rand='..math.random(99999999)
    self.SavePath = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
    self.CallbackUpdate = function(NewVersion, OldVersion) print("Updated to "..NewVersion..". Please Reload with 2x F9.") end
    self.CallbackNoUpdate = function(OldVersion) print("No Updates Found") end
    self.CallbackNewVersion = function(NewVersion) print("New Version found ("..NewVersion.."). Please wait..") end
    self.LuaSocket = require("socket")
    self.Socket = self.LuaSocket.connect('sx-bol.eu', 80)
    self.Socket:send("GET "..self.VersionPath.." HTTP/1.0\r\nHost: sx-bol.eu\r\n\r\n")
    self.Socket:settimeout(0, 'b')
    self.Socket:settimeout(99999999, 't')
    self.LastPrint = ""
    self.File = ""
    AddTickCallback(function() self:GetOnlineVersion() end)
end

function ScriptUpdate:Base64Encode(data)
    local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    return ((data:gsub('.', function(x)
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

function ScriptUpdate:GetOnlineVersion()
    if self.Status == 'closed' then return end
    self.Receive, self.Status, self.Snipped = self.Socket:receive(1024)

    if self.Receive then
        if self.LastPrint ~= self.Receive then
            self.LastPrint = self.Receive
            self.File = self.File .. self.Receive
        end
    end

    if self.Snipped ~= "" and self.Snipped then
        self.File = self.File .. self.Snipped
    end
    if self.Status == 'closed' then
        local HeaderEnd, ContentStart = self.File:find('\r\n\r\n')
        if HeaderEnd and ContentStart then
            self.OnlineVersion = tonumber(self.File:sub(ContentStart + 1))
            if self.OnlineVersion > self.LocalVersion then
                if self.CallbackNewVersion and type(self.CallbackNewVersion) == 'function' then
                    self.CallbackNewVersion(self.OnlineVersion,self.LocalVersion)
                end
                self.DownloadSocket = self.LuaSocket.connect('sx-bol.eu', 80)
                self.DownloadSocket:send("GET "..self.ScriptPath.." HTTP/1.0\r\nHost: sx-bol.eu\r\n\r\n")
                self.DownloadSocket:settimeout(0, 'b')
                self.DownloadSocket:settimeout(99999999, 't')
                self.LastPrint = ""
                self.File = ""
                AddTickCallback(function() self:DownloadUpdate() end)
            else
                if self.CallbackNoUpdate and type(self.CallbackNoUpdate) == 'function' then
                    self.CallbackNoUpdate(self.LocalVersion)
                end
            end
        else
            print('Error: Could not get end of Header')
        end
    end
end

function ScriptUpdate:DownloadUpdate()
    if self.DownloadStatus == 'closed' then return end
    self.DownloadReceive, self.DownloadStatus, self.DownloadSnipped = self.DownloadSocket:receive(1024)

    if self.DownloadReceive then
        if self.LastPrint ~= self.DownloadReceive then
            self.LastPrint = self.DownloadReceive
            self.File = self.File .. self.DownloadReceive
        end
    end

    if self.DownloadSnipped ~= "" and self.DownloadSnipped then
        self.File = self.File .. self.DownloadSnipped
    end

    if self.DownloadStatus == 'closed' then
        local HeaderEnd, ContentStart = self.File:find('\r\n\r\n')
        if HeaderEnd and ContentStart then
            local ScriptFileOpen = io.open(self.SavePath, "w+")
            ScriptFileOpen:write(self.File:sub(ContentStart + 1))
            ScriptFileOpen:close()
            if self.CallbackUpdate and type(self.CallbackUpdate) == 'function' then
                self.CallbackUpdate(self.OnlineVersion,self.LocalVersion)
            end
        end
    end
end
--Credit Trees

function GetCustomTarget()
	ts:update()
	if _G.MMA_Target and _G.MMA_Target.type == myHero.type then return _G.MMA_Target end
	if _G.AutoCarry and _G.AutoCarry.Crosshair and _G.AutoCarry.Attack_Crosshair and _G.AutoCarry.Attack_Crosshair.target and _G.AutoCarry.Attack_Crosshair.target.type == myHero.type then return _G.AutoCarry.Attack_Crosshair.target end
  if SelectedTarget ~= nil and ValidTarget(SelectedTarget, 1800) and (Ignore == nil or (Ignore.networkID ~= SelectedTarget.networkID)) then
		return SelectedTarget
	end
	return ts.target
end

function OnLoad()
	if _G.ScriptLoaded then	return end
	_G.ScriptLoaded = true
	initComponents()
  HookPackets()
  Zed_Q  = HPSkillshot({type = "DelayLine", delay = 0.5, range = 1500, speed = math.huge,  width = 45})
  Zed_W  = HPSkillshot({type = "PromptCircle", delay = 0.25, range = 550, speed = 1600, width = 40, radius = 28})
end
function initComponents()
VP = VPrediction()
DP = DivinePred()
HPred = HPrediction()
ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 2500)
Menu = scriptConfig("SXZed by SyraX", "ZedMA")
  if _G.MMA_Loaded ~= nil then
     PrintChat("<font color = \"#33CCCC\">MMA Status:</font> <font color = \"#fff8e7\"> Loaded</font>")
     isMMA = true
 elseif _G.AutoCarry ~= nil then
      PrintChat("<font color = \"#33CCCC\">SAC Status:</font> <font color = \"#fff8e7\"> Loaded</font>")
     isSAC = true
 else
    PrintChat("<font color = \"#33CCCC\">OrbWalker not found:</font> <font color = \"#fff8e7\"> Loading SX</font>")
    Menu:addSubMenu("["..myHero.charName.."] - Orbwalking Settings", "Orbwalking")
		SxOrb:LoadToMenu(Menu.Orbwalking)
    end
    
 Menu:addSubMenu("["..myHero.charName.." - Combo]", "ZedCombo")
    Menu.ZedCombo:addParam("combo", "Combo mode", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Menu.ZedCombo:addSubMenu("Q Settings", "qSet")
  Menu.ZedCombo.qSet:addParam("useQ", "Use Q in combo", SCRIPT_PARAM_ONOFF, true)
 Menu.ZedCombo:addSubMenu("W Settings", "wSet")
  Menu.ZedCombo.wSet:addParam("useW", "Use W", SCRIPT_PARAM_ONOFF, false)
 Menu.ZedCombo:addSubMenu("E Settings", "eSet")
  Menu.ZedCombo.eSet:addParam("useE", "Use E in combo", SCRIPT_PARAM_ONOFF, true)
 Menu.ZedCombo:addSubMenu("R Settings", "rSet")
  Menu.ZedCombo.rSet:addParam("useR", "Use Smart Ultimate", SCRIPT_PARAM_ONOFF, true)
  --Menu.ZedCombo.rSet:addParam("SelectR", "How you wanna cast R?", SCRIPT_PARAM_LIST, 1, {"Manual", "Let Script do it on count", "Spacebar + Leftclick"})
  Menu.ZedCombo.rSet:addParam("RMode", "Use Ultimate enemy count:", SCRIPT_PARAM_SLICE, 1, 1, 5, 0)
  Menu.ZedCombo:addParam("SwapUlt","Swap back with ult if hp < %", SCRIPT_PARAM_SLICE, 15, 2, 100, 0)
  Menu.ZedCombo:addParam("swap", "When Mark will kill target Swap", SCRIPT_PARAM_ONOFF, true)
  

Menu.ZedCombo:addParam("Cap", "Dive with W combo to pick up a kill", SCRIPT_PARAM_ONOFF, true)
Menu.ZedCombo:addParam("l", "Swap ulti underturret or count + 5 +", SCRIPT_PARAM_INFO)
Menu.ZedCombo:addParam("Combomode", "Choose Combo Mode", SCRIPT_PARAM_LIST, 1, {"LineCombo", "Traingle Combo"})


 Menu:addSubMenu("["..myHero.charName.." - Harass]", "Harass")
  Menu.Harass:addParam("harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("G"))
  Menu.Harass:addParam("useQ", "Use Q in Harass", SCRIPT_PARAM_ONOFF, true)
    Menu.Harass:addParam("useW", "Use W in Harass", SCRIPT_PARAM_ONOFF, false)
   Menu.Harass:addParam("useE", "Use E in Harass", SCRIPT_PARAM_ONOFF, true)
    Menu.Harass:addParam("Mana", " Use mana logic", SCRIPT_PARAM_ONOFF, false)
 Menu:addSubMenu("["..myHero.charName.." - Laneclear]", "Laneclear")
    Menu.Laneclear:addParam("lclr", "Laneclear Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  Menu.Laneclear:addParam("useClearQ", "Use Q in Laneclear", SCRIPT_PARAM_ONOFF, true)
 Menu.Laneclear:addParam("useClearW", "Use W in Laneclear", SCRIPT_PARAM_ONOFF, false)
    Menu.Laneclear:addParam("useClearE", "Use E in Laneclear", SCRIPT_PARAM_ONOFF, true)
 
 Menu:addSubMenu("["..myHero.charName.." - Jungleclear]", "Jungleclear")
    Menu.Jungleclear:addParam("jclr", "Jungleclear Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  Menu.Jungleclear:addParam("useClearQ", "Use Q in Jungleclear", SCRIPT_PARAM_ONOFF, true)
 Menu.Jungleclear:addParam("useClearW", "Use W in Jungleclear", SCRIPT_PARAM_ONOFF, false)
    Menu.Jungleclear:addParam("useClearE", "Use E in Jungleclear", SCRIPT_PARAM_ONOFF, true)
 
 Menu:addSubMenu("["..myHero.charName.." - Prodiction Settings]", "ProdSettings") -- Menu.ProdSettings.SelectProdiction
 -- Menu.selectProdSettings == 1 or 2
	Menu.ProdSettings:addParam("SelectProdiction", "Select Prodiction", SCRIPT_PARAM_LIST, 1, {"Devine", "VPrediction", "HPrediction"})

 
 Menu:addSubMenu("["..myHero.charName.." - Additionals]", "Ads")
    Menu.Ads:addParam("autoLevel", "Auto-Level Spells", SCRIPT_PARAM_ONOFF, false)
   Menu.Ads:addSubMenu("Killsteal", "KS")
    Menu.Ads:addParam ("Farm", "Last hit farm", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
  Menu.Ads:addParam ("Doit", "Enable Q Lasthit", SCRIPT_PARAM_ONOFF, false)
  -- Menu.Ads:addParam("Tower", "Target under your tower use stun", SCRIPT_PARAM_ONOFF, false)
   
   Menu.Ads.KS:addParam("ignite", "Use Ignite", SCRIPT_PARAM_ONOFF, false)
  Menu.Ads.KS:addParam("igniteRange", "Minimum range to cast Ignite", SCRIPT_PARAM_SLICE, 470, 0, 600, 0)
    Menu.Ads.KS:addParam("KS", "KillSteal", SCRIPT_PARAM_ONOFF, false)

  
 
  Menu.Ads:addSubMenu("VIP", "VIP")
 --   Menu.Ads.VIP:addParam("skin", "Use custom skin", SCRIPT_PARAM_ONOFF, false)
  --Menu.Ads.VIP:addParam("skin1", "Skin changer", SCRIPT_PARAM_SLICE, 1, 1, 5)

  
 Menu:addSubMenu("["..myHero.charName.." - Drawings]", "drawings")
  Menu.drawings:addParam("drawAA", "Draw AA Range", SCRIPT_PARAM_ONOFF, true)
  Menu.drawings:addParam("drawQ", "Draw Q Range", SCRIPT_PARAM_ONOFF, true)
    Menu.drawings:addParam("drawW", "Draw W Range", SCRIPT_PARAM_ONOFF, true)
    Menu.drawings:addParam("drawE", "Draw E Range", SCRIPT_PARAM_ONOFF, true)
    Menu.drawings:addParam("drawR", "Draw R Range", SCRIPT_PARAM_ONOFF, true)
    
 targetMinions = minionManager(MINION_ENEMY, 360, myHero, MINION_SORT_MAXHEALTH_DEC)
  allyMinions = minionManager(MINION_ALLY, 360, myHero, MINION_SORT_MAXHEALTH_DEC)
 jungleMinions = minionManager(MINION_JUNGLE, 360, myHero, MINION_SORT_MAXHEALTH_DEC)
 
 if Menu.Ads.VIP.skin and VIP_USER then
       GenModelPacket("Zed", Menu.Ads.VIP.skin1)
     lastSkin = Menu.Ads.VIP.skin1
    end
  
  PrintChat("<font color = \"#FFA319\">SX</font><font color = \"#52524F\">Zed/font> <font color = \"#FFFFFF\">by</font><font color = \"#FF0066\"> SyraX</font><font color = \"#00FF00\"> V"..version.."</font>")
end

pis = false
kut = math.huge
Positie = nil
pieter = false
gaap = false
timertimer = math.huge
stap2 = false 
stap2timer = math.huge
stap3 = false
stap3timer = math.huge
DeathTimer = math.huge
TargetDeath = false
function OnTick()
	target = GetCustomTarget()
	targetMinions:update()
	allyMinions:update()
	jungleMinions:update()
	CDHandler()
	KillSteal()
  Calculation()
  if TargetDeath then
    if DeathTimer + 2 <= GetGameTimer() then
      TargetDeath = false
      DeathTimer = math.huge
    end
  end
if MarkDamage ~= nil then
  --print(MarkDamage)
end
if target ~= nil and Mark then
  if target.health <= MarkDamage and Menu.ZedCombo.swap then
    CastSpell(_R, myHero)
    TargetDeath = true
    DeathTimer = GetGameTimer()
  end
end
    
  
if not Mark then
BA = 0
CA = 0 
QQ = 0
WW = 0 
EE = 0
QQQ = 0
QQQQ = 0
QQQQQ = 0
EEE = 0
EEEE = 0
EEEEE = 0
BAa = 0
BAaa = 0
BAaa = 0
MarkDamage = 0
end

if gaap and pieter then 
  if timertimer + 1 then
    pieter = false
    timertimer = math.huge
  end
end
 

if target ~= nil and Ghost and Whandler and target.type == myHero.type and target.team ~= myHero.team and target.valid then
  if GetDistance(GhostPos, target) <= skills.SkillE.range then
    CastSpell(_E)
  end
end
  
if target ~= nil and Ghost and Whandler and target.type == myHero.type and target.team ~= myHero.team and target.valid and GhostPos ~= nil then 
  if GetDistance(GhostPos, target) <= skills.SkillQ.range then
    if Menu.ZedCombo.qSet.useQ then
      if Menu.ProdSettings.SelectProdiction == 2 then
			local CastPosition, HitChance, Position = VP:GetLineCastPosition(target, skills.SkillQ.delay, skills.SkillQ.width, debug, skills.SkillQ.speed, myHero, false)
      if HitChance >= 2  then
				CastSpell(_Q, CastPosition.x, CastPosition.z)
      end
  elseif Menu.ProdSettings.SelectProdiction == 1 then
    if Menu.ZedCombo.qSet.useQ and ValidTarget(target, debug) and skills.SkillQ.range  then
      DevineQ()
    end
  elseif Menu.ProdSettings.SelectProdiction == 3 then
    if Menu.ZedCombo.qSet.useQ and ValidTarget(target, debug) and skills.SkillQ.range  then 
      CastQ()
    end
  end
  end
  end
end
 
	if Menu.Ads.VIP.skin and VIP_USER and skinChanged() then
		GenModelPacket("Zed", Menu.Ads.VIP.skin1)
		lastSkin = Menu.Ads.VIP.skin1
	end 
  

if click == 2 then
  DoubleClick()
  if click == 2 then
    click = 0
  end
end
if click >= 3 then
  click = 0
end
if click == 1 then
  if time + 0.4 <= GetGameTimer() then
    click = 0
    time  = math.huge
  end
end 
 
	if Menu.Ads.autoLevel then
		AutoLevel()
	end
	
	if Menu.ZedCombo.combo then
		Combo()
    --GhostCheck()
	end
	
	if Menu.Harass.harass then
		chooseharass()
    --GhostCheck()
	end
	
	if Menu.Laneclear.lclr then
		LaneClear()
	end
	
	if Menu.Jungleclear.jclr then
		JungleClear()
	end

end

function CDHandler()
	-- Spells
	skills.SkillQ.ready = (myHero:CanUseSpell(_Q) == READY)
	skills.SkillW.ready = (myHero:CanUseSpell(_W) == READY)
	skills.SkillE.ready = (myHero:CanUseSpell(_E) == READY)
	skills.SkillR.ready = (myHero:CanUseSpell(_R) == READY)

	-- Items
	tiamatSlot = GetInventorySlotItem(3077)
	hydraSlot = GetInventorySlotItem(3074)
	youmuuSlot = GetInventorySlotItem(3142) 
	bilgeSlot = GetInventorySlotItem(3144)
	bladeSlot = GetInventorySlotItem(3153)
	dfgSlot = GetInventorySlotItem(3128)
	divineSlot = GetInventorySlotItem(3131)
	
	tiamatReady = (tiamatSlot ~= nil and myHero:CanUseSpell(tiamatSlot) == READY)
	hydraReady = (hydraSlot ~= nil and myHero:CanUseSpell(hydraSlot) == READY)
	youmuuReady = (youmuuSlot ~= nil and myHero:CanUseSpell(youmuuSlot) == READY)
	bilgeReady = (bilgeSlot ~= nil and myHero:CanUseSpell(bilgeSlot) == READY)
	bladeReady = (bladeSlot ~= nil and myHero:CanUseSpell(bladeSlot) == READY)
	dfgReady = (dfgSlot ~= nil and myHero:CanUseSpell(dfgSlot) == READY)
	divineReady = (divineSlot ~= nil and myHero:CanUseSpell(divineSlot) == READY)

	-- Summoners
	if myHero:GetSpellData(SUMMONER_1).name:find("SummonerDot") then
		ignite = SUMMONER_1
	elseif myHero:GetSpellData(SUMMONER_2).name:find("SummonerDot") then
		ignite = SUMMONER_2
	end
	igniteReady = (ignite ~= nil and myHero:CanUseSpell(ignite) == READY)

end-- Harass --

function chooseharass()
   if Menu.Harass.useQ and Menu.Harass.useW and Menu.Harass.useE and skills.SkillQ.ready and skills.SkillW.ready and skills.SkillE.ready then 
    if target ~= nil and target.type == myHero.type and target.team ~= myHero.team then
      if GetDistance(target, myHero) <= 650 then
        HarassClose()
          if myHero.mana > myHero.maxMana * 0.65 and Menu.Harass.Mana then
       HarassClose()
      end
      if not Menu.Harass.Mana then
    HarassClose()
        end
      end
    end
    end
  if Menu.Harass.useQ and not skills.SkillW.ready then
    if target ~= nil and target.type == myHero.type and target.team ~= myHero.team then
      if GetDistance(target, myHero) <= 900 then
        harassQ()
        --print("1")
      end
    end
    end

  if Menu.Harass.useQ and Menu.Harass.useW and Menu.Harass.useE then 
    if target ~= nil and target.type == myHero.type and target.team ~= myHero.team then
    if ValidTarget(target, 1625) and GetDistance(target, myHero) > 900 then
        if myHero.mana > myHero.maxMana * 0.65 and Menu.Harass.Mana then
        HarassFar()
      end
      if not Menu.Harass.Mana then
        HarassFar()
        end
        -- print("3")
      end
    end
  end
end

function harassQ()
  --print("harassQ")
 if GetDistance(target, myHero) <= 650 and skills.SkillW.ready then HarassClose() end
   
  if target ~= nil and ValidTarget(target) and target ~= nil and target.type == myHero.type and target.team ~= myHero.team then
    if  Menu.ProdSettings.SelectProdiction == 2 then
      if Menu.Harass.useQ and ValidTarget(target, skills.SkillQ.range) and skills.SkillQ.ready then
        local CastPosition, HitChance, Position = VP:GetLineCastPosition(target, skills.SkillQ.delay, skills.SkillQ.width, skills.SkillQ.range, skills.SkillQ.speed, myHero, false)
           if HitChance >= 2 and GetDistance(CastPosition) < 900 then
				CastSpell(_Q, CastPosition.x, CastPosition.z)
       -- print("301")
          end
          end
    elseif Menu.ProdSettings.SelectProdiction == 1 and Menu.Harass.useQ and ValidTarget(target, skills.SkillQ.range) and skills.SkillQ.ready then
          DevineQ()
    elseif Menu.ProdSettings.SelectProdiction == 3 and Menu.Harass.useQ and ValidTarget(target, skills.SkillQ.range) and skills.SkillQ.ready then
      CastQ()
    end
  end
  if target.type == myHero.type and target ~= nil and skills.SkillE.ready then
    if ValidTarget(target, skills.SkillE.range) then
      CastSpell(_E)
    end
    end
  
  end
function HarassClose()
 -- print("harrasClose")
  if target ~= nil and target.valid and target.type == myHero.type and target.team ~= myHero.team then
    if skills.SkillW.ready and not Ghost  and not Whandler then
        if GetDistance(target, myHero) <= 730 and GetDistance(target, myHero) > 550 and myHero:GetSpellData(_W).name ~= "zedw2" then
          --print("kop Op kan toch niet altijd waar zijn")
           Solution()
           end
        if Menu.ProdSettings.SelectProdiction == 2 then
        AOECastPosition, MainTargetHitChance, nTargets = VP:GetCircularAOECastPosition(target, skills.SkillW.delay, skills.SkillW.width, skills.SkillW.range, skills.SkillW.speed, myHero)
          if GetDistance(AOECastPosition) <= skills.SkillW.range and MainTargetHitChance >= 2 and not Ghost and not Whandler and myHero:GetSpellData(_W).name ~= "zedw2" then
          Packet("S_CAST", {spellId = _W, fromX = AOECastPosition.x, fromY = AOECastPosition.z, toX = AOECastPosition.x, toY = AOECastPosition.z}):send()
      
        end
    elseif Menu.ProdSettings.SelectProdiction == 1 then
      DevineW()
    elseif Menu.ProdSettings.SelectProdiction == 3 and Menu.Harass.useW and ValidTarget(target, skills.SkillW.range) and skills.SkillW.ready and not Ghost then
      CastW()
    --  print("wajoo")
  end
end

if skills.SkillE.ready then
  if target and target.valid  and target.type == myHero.type and target.team ~= myHero.team then
  if GhostPos ~= nil  and GetDistance(GhostPos, target) <= skills.SkillE.range then
    CastSpell(_E)
  end
end
end
    
    if skills.SkillE.ready then
      if target and target.valid and target.type == myHero.type and target.team ~= myHero.team then
        if ValidTarget(target, skills.SkillE.range) then
          CastSpell(_E)
        end
      end
      end
      	
    
      if Menu.Harass.useQ and ValidTarget(target, skills.SkillQ.range) and skills.SkillQ.ready and Ghost and  target ~= nil and target.type == myHero.type and target.team ~= myHero.team then
        if  Menu.ProdSettings.SelectProdiction == 2 then
        local CastPosition, HitChance, Position = VP:GetLineCastPosition(target, skills.SkillQ.delay, skills.SkillQ.width, skills.SkillQ.range, skills.SkillQ.speed, myHero, false)
           if HitChance >= 2 and GetDistance(CastPosition) < 900 then
				CastSpell(_Q, CastPosition.x, CastPosition.z)
      end
      
          elseif Menu.ProdSettings.SelectProdiction == 1 then
      DevineQ()
            
    elseif Menu.ProdSettings.SelectProdiction == 3  then
      CastQ()
      
  
  
	end
  end
    end
  end


    


function HarassFar()
 -- print("harrasfar")
  if target ~= nil and target.valid and target ~= nil and target.type == myHero.type and target.team ~= myHero.team then 
    if skills.SkillW.ready and not Ghost and not Whandler then
      WVector()
     -- print("bami")
      
  end


  
if skills.SkillE.ready and target ~= nil and GhostPos ~= nil then 
  if GetDistance(target, GhostPos) <= skills.SkillE.range then 
    CastSpell(_E)
  end
end
if Ghost then
 -- print(GhostPos)
  if Menu.Harass.useQ  and skills.SkillQ.ready and GhostPos ~= nil and GetDistance(target, GhostPos) <= 900 then
   --print("Q")
        if  Menu.ProdSettings.SelectProdiction == 2 then
        local CastPosition, HitChance, Position = VP:GetLineCastPosition(target, skills.SkillQ.delay, skills.SkillQ.width, debug, skills.SkillQ.speed, myHero, false)
           if HitChance >= 2 then
				CastSpell(_Q, CastPosition.x, CastPosition.z)
          end
        elseif Menu.ProdSettings.SelectProdiction == 1 then
          DevineQ()
        elseif Menu.ProdSettings.SelectProdiction == 3 then
          CastQ()
      
end

      
  
  
end
end
  if not skills.SkillW.ready and skills.SkillQ.ready then
    if target ~= nil and ValidTarget(target, skills.SkillQ.range) and target ~= nil and target.type == myHero.type and target.team ~= myHero.team then
        if Menu.ProdSettings.SelectProdiction == 2 then
      local CastPosition, HitChance, Position = VP:GetLineCastPosition(target, skills.SkillQ.delay, skills.SkillQ.width, skills.SkillQ.range, skills.SkillQ.speed, myHero, false)
           if HitChance >= 2 then
				CastSpell(_Q, CastPosition.x, CastPosition.z)
    --print("676")
      end
    elseif Menu.ProdSettings.SelectProdiction == 1 then
    DevineQ()
  elseif Menu.ProdSettings.SelectProdiction == 3 then
  CastQ()
    
  end
end

        
  end
end
end

function Solution()
 -- print(" jajajajajja")
  local range = 285
  if target ~= nil and target.team ~= myHero.team and target.type == myHero.type then
    if skills.SkillW.ready and skills.SkillE.ready and skills.SkillQ.ready then
      --print(" jajajajajja")
        local Pos = Vector(target) + (Vector(myHero) - Vector(target)):normalized() * range
    
    if not Ghost and Pos then
      if not Whandler then
      if  myHero:GetSpellData(_W).name ~= "zedw2" then
        CastSpell(_W, Pos.x, Pos.z)
       --  print(" jajajajajja")
      end
    end
    end
  end
end
end

function WVector()
  if target and ValidTarget(target, 600) and target.type == myHero.ype and target.team == myHero.team then HarassClose() end
  local shadowrange = 1625
  if target ~= nil and target.type == myHero.type then
    --print(" hij zegt dat hij er langs is")
    if skills.SkillW.ready and skills.SkillQ.ready and ValidTarget(target, 1625) then
      
      
    local rangeee = GetDistance(target) > 550 and 550 or GetDistance(target)
     -- local vectorself = Vector(myHero.x, myHero.y, myHero.z)
			--local vectortarget = Vector(target.x, target.y, target.z)
     -- local VectorShadow = Vector(
      --local VectorShadow = Vector(startpos.x, startpos.y, startpos.z)
		--	local shadow1 = vectortarget + (vectortarget + vectorself):normalized()*-2000
			--local shadow2 = vectortarget - (vectortarget - vectorself):normalized()*1475
     local shadowpos = Vector(myHero) + (Vector(target) - Vector(myHero)):normalized()*rangeee
     -- print("ja")
      --local shadowQpos = Vectorif obj.validif obj.validadow + (vectortarget - vectorShadow):normalized()skills.SkillQ.range
       -- print("ja")
        
        if not Whandler and myHero:GetSpellData(_W).name ~= "zedw2"  then
          
          
          CastSpell(_W, shadowpos.x, shadowpos.z)
          --print("Wauw")
          
					--CastSpell(_W, mousePos.x, mousePos.z)
          --print(shadowrange)
          
        end
          
            
          end
        end
      end

      
function Harass()	
	if target ~= nil and ValidTarget(target) and target.type == myHero.type and target.team ~= myHero.team and not target.dead then
    if  Menu.ProdSettings.SelectProdiction == 2 then
      if Menu.Harass.useQ and ValidTarget(target, skills.SkillQ.range) and skills.SkillQ.ready then
        local CastPosition, HitChance, Position = VP:GetLineCastPosition(target, skills.SkillQ.delay, skills.SkillQ.width, skills.SkillQ.range, skills.SkillQ.speed, myHero, false)
           if HitChance >= 2 and GetDistance(CastPosition) < 900 then
				CastSpell(_Q, CastPosition.x, CastPosition.z)
      -- print("301")
            end
    elseif Menu.Harass.useQ and ValidTarget(target, skills.SkillQ.range) and skills.SkillQ.ready and Menu.ProdSettings.SelectProdiction == 1 then
          DevineQ()
    elseif Menu.Harass.useQ and ValidTarget(target, skills.SkillQ.range) and skills.SkillQ.ready and Menu.ProdSettings.SelectProdiction == 3 then
    CastQ()
    
        end
    end
       if target ~= nil and target ~= nil and skills.SkillW.ready then
  if Menu.Harass.useW and ValidTarget(target, skills.SkillW.range) and skills.SkillW.ready and not target.dead then
  if Menu.ProdSettings.SelectProdiction == 2 then
   
  AOECastPosition, MainTargetHitChance, nTargets = VP:GetCircularAOECastPosition(target, skills.SkillW.delay, skills.SkillW.width, skills.SkillW.range, skills.SkillW.speed, myHero)
      if GetDistance(AOECastPosition) <= skills.SkillW.range and MainTargetHitChance >= 2 then
          Packet("S_CAST", {spellId = _W, fromX = AOECastPosition.x, fromY = AOECastPosition.z, toX = AOECastPosition.x, toY = AOECastPosition.z}):send()
      end
    elseif Menu.ProdSettings.SelectProdiction == 1 then
      DevineW()
    --  print("wajoo")
    end
	end
end
		if Menu.Harass.useE and ValidTarget(target, skills.SkillE.range) and skills.SkillE.ready then
			CastSpell(_E, target)
		end
	end
	
end

-- End Harass --

function DevineW()
  if target ~= nil and target.type == myHero.type and skills.SkillE.ready and ValidTarget(target, skills.SkillE.range) and not Whandler  and not Ghost then
  if Menu.ProdSettings.SelectProdiction == 1 then
			local target = DPTarget(target)
			local MaokaiW = LineSS(skills.SkillW.speed, debug, skills.SkillW.width, skills.SkillW.delay, 0)
			local State, Position, perc = DP:predict(target, MaokaiW)
			if State == SkillShot.STATUS.SUCCESS_HIT then 
     --   print("goed zo")
				
      Packet("S_CAST", {spellId = _W, fromX = Position.x, fromY = Position.z, toX = Position.x, toY = Position.z}):send()


				end
			end
end
end
  

function DevineQ()
 -- print("johhny")
  if target ~= nil and target.type == myHero.type then
  if Menu.ProdSettings.SelectProdiction == 1 then
			local target = DPTarget(target)
			local ZedQ = LineSS(skills.SkillQ.speed, debug, skills.SkillQ.width, skills.SkillQ.delay, 0)
			local State, Position, perc = DP:predict(target, ZedQ)
			if State == SkillShot.STATUS.SUCCESS_HIT then 
				
      Packet("S_CAST", {spellId = _Q, fromX = Position.x, fromY = Position.z, toX = Position.x, toY = Position.z}):send()


				end
			end
end
end

function OnTowerFocus(tower, unit)
  unit = GetTarget()
  if unit ~= nil then
       if tower.team == myHero.team then
         if unit.team ~= myHero.team then
          return true
       end
     end
  end
 

end

function AreaEnemyCount()
	local count = 0
		for _, enemy in pairs(GetEnemyHeroes()) do
			if enemy and not enemy.dead and enemy.visible and GetDistance(myHero, enemy) < 550 then
				count = count + 1
			end
		end              
	return count
end

-- Combo Selector --

function Combo()
  	if target ~= nil and target.type == myHero.type and target.team ~= myHero.team then
   for i=1, heroManager.iCount do
      local enemy = heroManager:GetHero(i)
        if ValidTarget(enemy) and enemy ~= nil then 
        qDmg = getDmg("Q", enemy,myHero)
        eDmg = getDmg("E", enemy,myHero)
        rDmg = getDmg("R", enemy,myHero)
  
     if levelR() ~= nil then
	local typeCombo = 0
  local mana = myHero.maxMana * 0.75
  local health = target.maxHealth * 0.55
  local damage1 = qDmg + qDmg + qDmg + eDmg + eDmg
  if damage1 ~= nil then
  local damage2 = damage1 * levelR()
  local damage = damage1 + damage2
  end
 -- local damage = myHero:CalcDamage(target, eDmg, qDmg, rDmg, qDmg)
  --print(damage)

    if skills.SkillQ.ready and skills.SkillW.ready and skills.SkillR.ready and myHero.mana >= mana then 
      if Menu.ZedCombo.Combomode == 1 then
        LineCombo(target, 0) 
          CHECK = true 
        
         



    elseif Menu.ZedCombo.Combomode == 2 and skills.SkillW.ready and skills.SkillQ.ready and skills.SkillR.ready then
    

     TraingleCombo(target, 0) 
        CHECK = true
      
     end
   end
   
if myHero:GetSpellData(_R).level == 0 then
    -- print("papi")
		AllInCombo(target, 0)
    end
  if myHero:GetSpellData(_R).name ~= "ZedR2"  and not skills.SkillR.ready then
    AllInCombo(target, 0)

  --  LineCombo()
end
end
	end
end

end
end

-- Combo Selector --

-- All In Combo -- 

function AllInCombo(target, typeCombo)
-- print("Shitttt")
  --print(" neehee")
	if target ~= nil and typeCombo == 0 and target.type == myHero.type and target.team ~= myHero.team and not target.dead then
		ItemUsage(target)
    if ValidTarget(target, skills.SkillR.range) and myHero:GetSpellData(_R).name ~= "ZedR2" then
       if Menu.ZedCombo.rSet.useR  then 
      --  CastSpell(_R, target)
       end
    end
    if Menu.ZedCombo.eSet.useE  and ValidTarget(target, 290) and skills.SkillE.ready then
      CastSpell(_E)
    end
    
    
 if target ~= nil and skills.SkillW.ready then
  if Menu.ZedCombo.wSet.useW and ValidTarget(target, skills.SkillW.range) and skills.SkillW.ready and not target.dead and not Whandler then
  if Menu.ProdSettings.SelectProdiction == 2 then
   
  AOECastPosition, MainTargetHitChance, nTargets = VP:GetCircularAOECastPosition(target, skills.SkillW.delay, skills.SkillW.width, skills.SkillW.range, skills.SkillW.speed, myHero)
      if GetDistance(AOECastPosition) <= skills.SkillW.range and MainTargetHitChance >= 2 then
          Packet("S_CAST", {spellId = _W, fromX = AOECastPosition.x, fromY = AOECastPosition.z, toX = AOECastPosition.x, toY = AOECastPosition.z}):send()
      end
    elseif Menu.ProdSettings.SelectProdiction == 1 then
      DevineW()
    --  print("wajoo")
  elseif Menu.ProdSettings.SelectProdiction == 3 then
    CastW()
	end
end
end

if target ~= nil and target.valid and Menu.ZedCombo.Cap and not target.death then
  if Whandler and Ghost then
    if target.type == myHero.type and target.team ~= myHero.team then
       for i=1, heroManager.iCount do
      local enemy = heroManager:GetHero(i)
        if ValidTarget(enemy) and enemy ~= nil then 
        qDmg = getDmg("Q", enemy,myHero)
        eDmg = getDmg("E", enemy,myHero)
        rDmg = getDmg("R", enemy,myHero)
      if target.health < qDmg + eDmg + qDmg and Ghost then
      local check12 = GetDistance(target, myHero)
      local check22 = GetDistance(target, GhostPos)
      local max = myHero.maxHealth * 0.4
      if check12 ~= nil and check22 ~= nil and max ~= nil and target ~= nil then
      if check12 > check22 and check22 <= 325 and myHero.health >= max then
        if not UnitAtTower(target, 0)  then
        CastSpell(_W)
    --    print("Gapclose")
    end
      end
    end
    end
  end
  end
    end
  end
end
end
  --  print("check2")

    --  print("check3")
      if Menu.ZedCombo.qSet.useQ and ValidTarget(target, skills.SkillQ.range) and skills.SkillQ.range then
            if  Menu.ProdSettings.SelectProdiction == 2 then
			local CastPosition, HitChance, Position = VP:GetLineCastPosition(target, skills.SkillQ.delay, skills.SkillQ.width, skills.SkillQ.range, skills.SkillQ.speed, myHero, false)
      --print("check 2")
            if HitChance >= 2 and GetDistance(CastPosition) < 900 then
             -- print("check1")
				CastSpell(_Q, CastPosition.x, CastPosition.z)
       -- print("877")
            end
  elseif Menu.ProdSettings.SelectProdiction == 1 then
    if Menu.ZedCombo.qSet.useQ and ValidTarget(target, debug) and skills.SkillQ.range  then
      DevineQ()
    end
  elseif Menu.ProdSettings.SelectProdiction == 3 then
    if Menu.ZedCombo.qSet.useQ and ValidTarget(target, debug) and skills.SkillQ.range  then 
      CastQ()
    end
  end
  
    end


	
	end


-- All In Combo --


function LaneClear()
	for i, targetMinion in pairs(targetMinions.objects) do
		if targetMinion ~= nil then
			if Menu.Laneclear.useClearQ and skills.SkillQ.ready and ValidTarget(targetMinion, skills.SkillQ.range) then
				CastSpell(_Q, targetMinion.x, targetMinion.z)
			end
			if Menu.Laneclear.useClearW and skills.SkillW.ready and ValidTarget(targetMinion, skills.SkillW.range) then
				CastSpell(_W, targetMinion.x, targetMinion.z)
			end
			if Menu.Laneclear.useClearE and skills.SkillE.ready and ValidTarget(targetMinion, skills.SkillE.range) then
				CastSpell(_E, targetMinion)
			end
		end
		
	end
end

function JungleClear()
	for i, jungleMinion in pairs(jungleMinions.objects) do
		if jungleMinion ~= nil then
			if Menu.Jungleclear.useClearQ and skills.SkillQ.ready and ValidTarget(jungleMinion, skills.SkillQ.range) then
				CastSpell(_Q, jungleMinion.x, jungleMinion.z)
			end
			if Menu.Jungleclear.useClearW and skills.SkillW.ready and ValidTarget(jungleMinion, skills.SkillW.range) then
				CastSpell(_W, jungleMinion)
			end
			if Menu.Jungleclear.useClearE and skills.SkillE.ready and ValidTarget(jungleMinion, skills.SkillE.range) then
				CastSpell(_E, jungleMinion)
			end
		end
	end
end

function AutoLevel()
	local qL, wL, eL, rL = player:GetSpellData(_Q).level + qOff, player:GetSpellData(_W).level + wOff, player:GetSpellData(_E).level + eOff, player:GetSpellData(_R).level + rOff
	if qL + wL + eL + rL < player.level then
		local spellSlot = { SPELL_1, SPELL_2, SPELL_3, SPELL_4, }
		local level = { 0, 0, 0, 0 }
		for i = 1, player.level, 1 do
			level[abilitySequence[i]] = level[abilitySequence[i]] + 1
		end
		for i, v in ipairs({ qL, wL, eL, rL }) do
			if v < level[i] then LevelSpell(spellSlot[i]) end
		end
	end
end

function KillSteal()
	if Menu.Ads.KS.ignite then
		IgniteKS()
	end
  if  Menu.Ads.KS.KS  then
    KS2()
  end
  if Menu.ZedCombo.WW or Menu.ZedCombo.SwapUlt then
    WegWezen()
    --print("453") 
  end
  --if Menu.ZedCombo.SwapBeta then
   -- BeterbenjeSlim()
 -- end
   
  
  if Menu.Ads.Tower then
   --  OnTowerFocus()
  end
end

-- Auto Ignite get the maximum range to avoid over kill --

function IgniteKS()
	if igniteReady then
		local Enemies = GetEnemyHeroes()
		for i, val in ipairs(Enemies) do
			if ValidTarget(val, 600) then
				if getDmg("IGNITE", val, myHero) > val.health and GetDistance(val) >= Menu.Ads.KS.igniteRange then
					CastSpell(ignite, val)
				end
			end
		end
	end
end

-- Auto Ignite --

function HealthCheck(unit, HealthValue)
	if unit.health > (unit.maxHealth * (HealthValue/100)) then 
		return true
	else
		return false
	end
end

function ItemUsage(target)

	if dfgReady then CastSpell(dfgSlot, target) end
	if youmuuReady then CastSpell(youmuuSlot, target) end
	if bilgeReady then CastSpell(bilgeSlot, target) end
	if bladeReady then CastSpell(bladeSlot, target) end
	if divineReady then CastSpell(divineSlot, target) end

end

-- Change skin function, made by Shalzuth
function GenModelPacket(champ, skinId)
	p = CLoLPacket(0x97)
	p:EncodeF(myHero.networkID)
	p.pos = 1
	t1 = p:Decode1()
	t2 = p:Decode1()
	t3 = p:Decode1()
	t4 = p:Decode1()
	p:Encode1(t1)
	p:Encode1(t2)
	p:Encode1(t3)
	p:Encode1(bit32.band(t4,0xB))
	p:Encode1(1)--hardcode 1 bitfield
	p:Encode4(skinId)
	for i = 1, #champ do
		p:Encode1(string.byte(champ:sub(i,i)))
	end
	for i = #champ + 1, 64 do
		p:Encode1(0)
	end
	p:Hide()
	RecvPacket(p)
end



    
function skinChanged()
	return Menu.Ads.VIP.skin1 ~= lastSkin
end

function DrawCircleNextLvl(x, y, z, radius, width, color, chordlength)
 radius = radius or 300
 quality = math.max(8,math.floor(180/math.deg((math.asin((chordlength/(2*radius)))))))
 quality = 2 * math.pi / quality
 radius = radius*.92
 local points = {}
 for theta = 0, 2 * math.pi + quality, quality do
  local c = WorldToScreen(D3DXVECTOR3(x + radius * math.cos(theta), y, z - radius * math.sin(theta)))
  points[#points + 1] = D3DXVECTOR2(c.x, c.y)
 end
 DrawLines2(points, width or 1, color or 4294967295)
end

function DrawCircle2(x, y, z, radius, color)
 local vPos1 = Vector(x, y, z)
 local vPos2 = Vector(cameraPos.x, cameraPos.y, cameraPos.z)
 local tPos = vPos1 - (vPos1 - vPos2):normalized() * radius
 local sPos = WorldToScreen(D3DXVECTOR3(tPos.x, tPos.y, tPos.z))
 if OnScreen({ x = sPos.x, y = sPos.y }, { x = sPos.x, y = sPos.y })  then
  self:DrawCircleNextLvl(x, y, z, radius, 1, color, 75)
 end
end

function CircleDraw(x,y,z,radius, color)
	self:DrawCircle2(x, y, z, radius, color)
end--[[ Kill Text ]]--
TextList = {"Harass him", "Q", "W", "E", "ULT HIM !", "Items", "All In", "Skills Not Ready"}
KillText = {}
colorText = ARGB(229,229,229,0)
_G.ShowTextDraw = true

-- Damage Calculation Thanks Skeem for the base --



    

function OnDraw() 
 -- DamageCalculation()
  if not myHero.dead then
        if Menu.drawings.drawAA then DrawCircle(myHero.x, myHero.y, myHero.z, Ranges.AA, ARGB(25 , 9, 12, 102)) end
        if Menu.drawings.drawQ then DrawCircle(myHero.x, myHero.y, myHero.z, skills.SkillQ.range, ARGB(25 , 255, 0, 0)) end
        if Menu.drawings.drawW then DrawCircle(myHero.x, myHero.y, myHero.z, skills.SkillW.range, ARGB(25 , 255, 128, 0)) end
        if Menu.drawings.drawE then DrawCircle(myHero.x, myHero.y, myHero.z, skills.SkillE.range, ARGB(25 , 145, 0, 161)) end
        if Menu.drawings.drawR then DrawCircle(myHero.x, myHero.y, myHero.z, skills.SkillR.range, ARGB(25 , 255, 255, 0)) end
    end
if _G.ShowTextDraw then
    for i = 1, heroManager.iCount do
	    local enemy = heroManager:GetHero(i)
      
	    if ValidTarget(enemy) and enemy ~= nil then
        
	      local barPos = Vector(enemy.pos)--(Credit to Zikkah)
	    
	      if KillText[i] ~= 10 then
	       -- DrawText3D(TextList[KillText[i]], barPos.x, barPos.y, barPos.z, 20, colorText)
          --print("kaas")
	      else
	       -- DrawText3D(TextList[KillText[i]] .. string.format("%4.1f", ((enemy.health - (qDmg + pDmg + eDmg + itemsDmg)) * (1/rDmg)) * 2.5) .. "s = Kill", 16, barPos.x, barPos.y, barPos.z, colorText)
	      end
	    end
	end
end
if not myHero.dead and target ~= nil and	target.team ~= myHero.team and target.type == myHero.type then 
		--	if Settings.drawing.text then 
				DrawText3D("Focus This Bitch!",target.x-100, target.y-50, target.z, 20, 0xFFFF9900) --0xFF9900
			end
      if not myHero.dead and object and object.name:find("zed_ult_pop_kill.tory") then
        DrawText3D("Mark Wil kill! him!",target.x-75, target.y-75, target.z, 20, 0xFFFF9900)
      end
if Ghost2 then
      local range = 540
      local range2 =250
      local Post = Vector(target) + (Vector(target) - GhostPos2):normalized() * range
  
if Post ~= nil then
DrawCircle(Post.x, Post.y, Post.z, 100, 0x99990f)

end
end
if Ghost2 then 
DrawCircle(GhostPos2.x, GhostPos2.y, GhostPos2.z, 100, 0x99990f)

end
if not skills.SkillR.ready then return end
if target ~= nil and target.type == myHero.type and target.team ~= myHero.team and levelR() ~= nil then
 for i=1, heroManager.iCount do
      local enemy = heroManager:GetHero(i)
        if ValidTarget(enemy) and enemy ~= nil then 
        qDmg = getDmg("Q", enemy,myHero)
        eDmg = getDmg("E", enemy,myHero)
        rDmg = getDmg("R", enemy,myHero)
          local damage1 = qDmg + qDmg + qDmg + eDmg
  local damage2 = damage1 * levelR()
  local damage = damage1 + damage2
if not myHero.dead and target ~= nil and	target.team ~= myHero.team and target.type == myHero.type then 
 if skills.SkillQ.ready and skills.SkillE.ready and skills.SkillW.ready and skills.SkillR.ready  and target.health <= damage then 
   DrawText3D("spacebar will kill!",target.x-150, target.y-100, target.z, 20, 0xFF00FF00)
 end
 end
end
end
end
if Ghost2 and Mark and target ~= nil then

 if target and target.valid then
   
local A = Vector(myHero)
local B = Vector(target)
local direction = (B-A):normalized()
local midV = A + direction*(A:dist(B)/2) -- get mid vec halfway from A to B
local shadowV = midV + direction:perpendicular()*300 -- get the shadowV a vector of the length you set extending outwards from mid position to the right/left use :perpendicular2() to get the other dir.
DrawCircle(shadowV.x, shadowV.y, shadowV.z, 100 , 0x9FF0000)
--[[   a = Vector(target)
   b = Vector(myHero)
   Distance = GetDistance(a, b) / 2
   
   keer = Vector:perpendicular() 
   
  DrawCircle(keer.x, keer.y, keer.z, 100 , 0x9FF0000)
   
   
   
---   DrawCircle(kees.x, kees.y, kees.z, 50, 0x99990f)
  --  DrawCircle(D2.x, D2.y, D2.z, 50, 0x99990f)
   
   local A = Vector(GhostPos2)
    local B = Vector(target)
    local direction = (B-A):normalized()
    local distanceToMidway = GetDistance(A,B)/2
   local C = A + direction * distanceToMidway
    local normal = Point(direction.y, - direction.x):normalized()
    local kipje = 300
    -- one side:
    local D1 = C - normal * kipje
    -- another side:
    local D2 = C + normal * kipje--]]
  --  DrawCircle(D1.x, D1.y, D1.z, 50, 0x99990f)
  --  DrawCircle(D2.x, D2.y, D2.z, 50, 0x99990f)
  
  
    
end
end

---keer = Vector:perpendicular(myHero.pos) * 540-- return new Vector rotated 90° right
---   DrawCircle(kees.x, kees.y, kees.z, 50, 0x99990f)
  --  DrawCircle(D2.x, D2.y, D2.z, 50, 0x99990f)

  end

ulti = false
ultitime = math.huge
BA = 0
CA = 0 
QQ = 0
WW = 0 
EE = 0
QQQ = 0
QQQQ = 0
QQQQQ = 0
EEE = 0
EEEE = 0
EEEEE = 0
BAa = 0
BAaa = 0
BAaa = 0
MarkDamage = 0
            
              function RR()
                if myHero:GetSpellData(_R).level == 0 then
                    return 0
                    
                  elseif myHero:GetSpellData(_R).level == 1 then
                return 20
        elseif myHero:GetSpellData(_R).level == 2 then
                return 35
        elseif myHero:GetSpellData(_R).level == 3 then
                return 50
        end
      end
function OnProcessSpell(object, spell)
 -- print("stap0")
  if Mark and spell then
  --  print("stap1")
    
  if object.type == "AIHeroClient" and object.charName == myHero.charName then
  --  print("stap2")
			spelltype, casttype = getSpellType(object, spell.name)
			--if casttype == 4 or casttype == 5 or casttype == 6 then return end
			if spelltype == "BAttack" then
        BA = BA + 1
        --print(BA)
        end
      if spelltype == "CAttack" then
				CA = CA + 1
        
        end
        --print("dwaas222")
      --  print(CA)
			if spelltype == "Q" then 
        QQ = QQ + 1
       -- print(QQ)
      end
      
        
        
        if spelltype == "E" then
          EE = EE + 1.
         -- print(EE)
        end
        end
     
   
end
end



function Calculation()
            if target and target.team ~= myHero.team and target.type == myHero.type and not target.dead then
     for i=1, heroManager.iCount do
    local enemy = heroManager:GetHero(i)
    if ValidTarget(enemy) and enemy ~= nil then
      qDmg = getDmg("Q", enemy,myHero)
      wDmg = getDmg("W", enemy,myHero)
      eDmg = getDmg("E", enemy,myHero)
      rDmg = getDmg("R", enemy,myHero)
      AD = getDmg("AD", enemy, myHero)
      dfgDmg = getDmg("DFG", enemy, myHero)
       -- if spelltype == "R" then-- spelltype == "P" or spelltype == "QM" or spelltype == "WM" or spelltype == "EM" then
      QQQ = QQ * qDmg
      EEE = EE * eDmg
      BAa = BA * AD
      QQQQ = QQQ / 100
      EEEE = EEE / 100
      BAaa = BAa / 100
      QQQQQ = QQQQ * RR()
      EEEEE = EEEE * RR()
      BAaaa = BAaa * RR()
      MarkDamage = AD + QQQQQ + EEEEE + BAaaa
    end
  end
end
end
    -- print(MarkDamage)
 --[[ if p.header == 0x00B5 then p:Block() end
end

function OnSendPacket(p)
  print(string.format('%02X', p.header))
end--]]
--[[function OnSendPacket(p)
  print(string.format('%02X', p.header))
  if p.header == 0x00D1 then 
    p:Block()
    end
end
--]]


function OnSendPacket(packet)


end
--[[
function CastQ(unit,pos)
    if target ~= nil and not ult then 
      if GetDistance(pos) < skills.SkillQ.range and skills.SkillQ.ready then

   
                CastSpell(_Q, pos.x, pos.z)
              --  print("774")
            end
    end
  end
  
function GetQPos(unit, pos)
        qPos = pos
end--]]


 function DoubleClick()
 
 end
 
 function DoubleClick2()
 
  end


  Kip = false
  --[[
function OnTowerFocus(tower, unit)
  unit = GetTarget()
  if unit ~= nil then
       if tower.team == myHero.team then
         if unit.team ~= myHero.team then
             if target ~= nil and ValidTarget(target, skills.SkillR.range) and skills.SkillR.ready and target.type == myHero.type and target.team ~= myHero.team then
      CastSpell(_R, target)
    end
       end
     end
  end
  end--]]
  
  function UnitAtTower(unit,offset)
  for i, turret in pairs(GetTurrets()) do
    if turret ~= nil then
      if turret.team ~= myHero.team then
        if GetDistance(unit, turret) <= turret.range+offset then
          return true
        end
      end
    end
  end
  return false
end
--[[
function TurretStun()
  for _, enemy in ipairs(GetEnemyHeroes()) do
    if UnitAtTower(enemy, 0) then
      CastSpell(_R, enemy)
    end
  end
end--]]
lastLeftClick = 0 
--- thxx too klokje!
kijk = 0
tijd = math.huge
click = 0
time = math.huge
function OnWndMsg(Msg, Key)
	
	
	if Msg == WM_LBUTTONUP then
        
      
		local minD = 0
		local target = nil
		for i, unit in ipairs(GetEnemyHeroes()) do
			if ValidTarget(unit) and unit.type == myHero.type and unit.team ~= myHero.team then
				if GetDistance(unit, mousePos) <= minD or target == nil then
					minD = GetDistance(unit, mousePos)
					target = unit
         
    
    
    if target and minD < 115 then
        click = click + 1
        time = GetGameTimer()
			if SelectedTarget and target.charName == SelectedTarget.charName then
				SelectedTarget = nil
			else
				SelectedTarget = target
        pis = true
        kut = GetGameTimer()
   
             
          end
			end
		end
  end
  end
      
      end
        
	end

function KS2()
    if target ~= nil and target.type == myHero.type and target.team ~= myHero.team  and not target.dead then
      for i=1, heroManager.iCount do
      local enemy = heroManager:GetHero(i)
        if ValidTarget(enemy) and enemy ~= nil then 
        qDmg = getDmg("Q", enemy,myHero)
        eDmg = getDmg("E", enemy,myHero)
        rDmg = getDmg("R", enemy,myHero)
       -- wDmg = getDmg("W", enemy,myHero)
      --print(rDmg)
          if target ~= nil and skills.SkillQ.ready and ValidTarget(target, skills.SkillQ.range) and target.health < qDmg then
            if Menu.ZedCombo.qSet.useQ and Menu.ProdSettings.SelectProdiction == 1 then
          --ProdQ:GetPredictionCallBack(target, CastQ)
            DevineQ()
            elseif Menu.ProdSettings.SelectProdiction == 2 then
              if Menu.ZedCombo.qSet.useQ and ValidTarget(target, skills.SkillQ.range) and skills.SkillQ.range then
                local CastPosition, HitChance, Position = VP:GetLineCastPosition(target, skills.SkillQ.delay, skills.SkillQ.width, skills.SkillQ.range, skills.SkillQ.speed, myHero, false)
                if HitChance >= 2 and GetDistance(CastPosition) < 900 then
                  CastSpell(_Q, CastPosition.x, CastPosition.z)
                --  print("1328")
                end
              end
            end
          end

          if skills.SkillE.ready and ValidTarget(target, skills.SkillE.range) and target.health < eDmg then
            CastSpell(_E, target)
          end
          if target ~= nil and target.type == myHero.type and target.team ~= myHero.team then
            if GetDistance(target, myHero) > 900 then
              if target.health <= qDmg then
               if GetDistance(target, myHero) < 1625 then
                  WVector()
                  if Ghost and GetDistance(target, GhostPos) < 900 then
                    if Menu.ProdSettings.SelectProdiction == 2 then
              if Menu.ZedCombo.qSet.useQ then
                local CastPosition, HitChance, Position = VP:GetLineCastPosition(target, skills.SkillQ.delay, skills.SkillQ.width, debug, skills.SkillQ.speed, myHero, false)
                if HitChance >= 2 then
                  CastSpell(_Q, CastPosition.x, CastPosition.z)
                   -- print("1348")
                 end
               end
             end
           end
         end
       end
     end
     end
if target ~= nil and target.type == myHero.type and target.team ~= myHero.team then
  if target.health <= eDmg then
    if skills.SkillW.ready and skills.SkillQ.ready and ValidTarget(target, skills.SkillW.range) then
      
if Menu.ProdSettings.SelectProdiction == 2 then
   
  AOECastPosition, MainTargetHitChance, nTargets = VP:GetCircularAOECastPosition(target, skills.SkillW.delay, skills.SkillW.width, skills.SkillW.range, skills.SkillW.speed, myHero)
      if GetDistance(AOECastPosition) <= skills.SkillW.range and MainTargetHitChance >= 2 then
          Packet("S_CAST", {spellId = _W, fromX = AOECastPosition.x, fromY = AOECastPosition.z, toX = AOECastPosition.x, toY = AOECastPosition.z}):send()
      end
    elseif Menu.ProdSettings.SelectProdiction == 1 then
      DevineW()
    --  print("wajoo")
  elseif Menu.ProdSettings.SelectProdiction == 3 then
    CastW()
	end
--[[if Ghost and Whandler and GetDistance(GhostPos, target) < 300 then 
  CastSpell(_E)
end--]]
end

end
end

             end
            end
          end
        end
  
Ghost = false
GhostPos = nil
Whandler = false
GhostTimer = math.huge
Mark = false
MarkTimer = math.huge
Vera = 0
function OnApplyBuff(source, unit, buff)
  --if buff then print(buff.name) end
  if buff and unit.type == myHero.type and unit.team == myHero.team then
    if unit.isMe and buff.name == "zedwhandler" then
      Whandler = true
    end   
    end
    if unit.team ~= myHero.team and unit.type == myHero.type then
      if buff and buff.name == "zedulttargetmark" then
        Mark = true
        MarkTimer = GetGameTimer()
        Vera = unit.health
      end
    end
    


    
  end



  
  
  debug = 1625
  Ghost2 = false
  Ghost2Pos = nil
  

function OnCreateObj(object)
   --if object and GetDistance(object, myHero) <= 550 then print(object.name) end
  if object and object.name:find("zed_ult_pop_kill.troy") and Menu.ZedCombo.rSet.Back and UnitAtTower(myHero, 0) then
  --  print("onder de toren?")
    CastSpell(_R)
  --  print("onder de toren?")
 -- end

end
  if object and object.name:find("Zed_Base_W_tar.troy") then --Zed_Base_W_tar.troy Zed_Base_cloneswap_buf.troy
    --print("gehakt")
  Ghost = true
  GhostPos = Vector(object.pos)
  GhostTimer = GetGameTimer()
end
if object and object.name:find("Zed_Base_R_cloneswap_buf.troy") then
  Ghost2 = true
  GhostPos2 = Vector(object.pos)
  Ghost2Timer = GetGameTimer()
  end

    end
 
function OnDeleteObj(object)
  if object and object.name:find("zed_ult_pop_kill.tory") and Menu.ZedCombo.rSet.Back then
    MarkKiller = false
    KillerTimer = math.huge
  end
   if object and object.name:find("Zed_Clone_idle.troy") then --Zed_Base_CloneDeath.troy
 Ghost = false
  GhostPos = nil
end
 if object and object.name:find("Zed_Base_CloneDeath.troy") and not skills.SkillR.ready then --Zed_Base_CloneDeath.troy
 Ghost2 = false
  Ghost2Pos = nil
end

end

function OnRemoveBuff(unit, buff)
  if buff and unit.type == myHero.type and unit.team == myHero.team then
       if unit.isMe and buff.name == "zedwhandler" then
      Whandler = false
    end
  end
    if unit.team ~= myHero.team and unit.type == myHero.type then
      if buff and buff.name == "zedulttargetmark" then
        Mark = false
        MarkTimer = math.huge
        Vera = 0
      
      end
    end
  end


function CountClone(point, range)
  local CloneCount = 0
  for k = 1, heroManager.iCount, 1 do
    local Gastenbijdubbel = heroManager:getHero(k)
    if myHero.team ~= enemyhero.team and ValidTarget(enemyhero, 750) then
      if GetDistanceSqr(enemyhero, point) <= range*range then
        CloneCount = CloneCount + 1
      end
    end
  end
  return CloneCount
end
--[[
function BeterbenjeSlim()
  if target ~= nil and target.type == myHero.type then
       if GhostPos ~= nil and ((myHero.health / myHero.maxHealth * 100) <= Menu.ZedCombo.SwapBeta) then
         local Slim = GetDistance(GhostPos, target)
         local Smart = GetDistance(myHero, target)
          if Slim > Smart and not Menu.ZedCombo.NO and ChampCount <= 2 then
                
                        CastSpell(_W)
                        
                end
        end
  end
end
--]]
function WegWezen()
       if myHero:GetSpellData(_R).name == "ZedR2" and ((myHero.health / myHero.maxHealth * 100) <= Menu.ZedCombo.SwapUlt) then
                
                        CastSpell(_R)
                end
              end
              
              
              function levelR()
                
                  if myHero:GetSpellData(_R).level == 1 then
                return 0.20
        elseif myHero:GetSpellData(_R).level == 2 then
                return 0.35
        elseif myHero:GetSpellData(_R).level == 3 then
                return 0.50
        end
      end
    --[[  
    function CalucalateR()
     -- print("tipje")
      if target ~= nil and target.type == myHero.type and target.team ~= myHero.team then
      local dmg = myHero.totalDamage 
      for i=1, heroManager.iCount do
      local enemy = heroManager:GetHero(i)
        if ValidTarget(enemy) and enemy ~= nil then 
        qDmg = getDmg("Q", enemy,myHero)
        eDmg = getDmg("E", enemy,myHero)
        rDmg = getDmg("R", enemy,myHero)
      
      if Mark then
        -- print("tipje")
        if target ~= nil and target ~= nil and target.type == myHero.type and target.team ~= myHero.team then
          if Vera ~= nil then
            Damage1 = myHero.totalDamage
            Damage2 = myHero.totalDamage * levelR()
            Totaal = Damage1 + Damage2
            
            if target.health <= Totaal then
               
              CastSpell(_R)
            end
          end
        end
        
            
            
          
        
      end
    end
end
end
end--]]
CHECK = false
function GhostCheck()
  if Ghost and Whandler then
    if target ~= nil and target.type == myHero.type and target.team ~= myHero.team then
      if skills.SkillE.ready then
        if GetDistance(target, Ghostpos) <= skills.SkillE.range then
          CastSpell(_E)
        end
      end
    end
  end
end
function CountEnemies(point, range)
    local ChampCount = 0
    for j = 1, heroManager.iCount, 1 do
        local enemyhero = heroManager:getHero(j)
        if myHero.team ~= enemyhero.team and ValidTarget(enemyhero, 750) then
            if GetDistanceSqr(enemyhero, point) <= range*range then
                ChampCount = ChampCount + 1
            end
        end
    end 
    return ChampCount
end
function AA()
  if target ~= nil and ValidTarget(target, 125) then
    myHero:Attack(target)
  end
end--[[
function Driekhoek()
  if target ~= nil and target.type == myHero.type and target.team ~= myHero.team and not target.dead then
    if skills.SkillW.ready and skills.SkillQ.ready and skills.SkillR.ready then
      if ValidTarget(target,skills.SkillR.range) and myHero:GetSpellData(_R).name ~= "ZedR2" then
        CastSpell(_R, target)
      end
      end--]]
  --    CHECK = false
function TraingleCombo(target, typeCombo)
 -- print("jaja")
  --CHECK = true
  --local gaap = false
  if target ~= nil and target.type == myHero.type and target.team ~= myHero.team and not target.dead  and target.valid and not TargetDeath and Menu.ZedCombo.combo then
    if skills.SkillW.ready and skills.SkillQ.ready and skills.SkillR.ready then
      if ValidTarget(target, skills.SkillR.range) and myHero:GetSpellData(_R).name ~= "ZedR2" then
           CastSpell(_R, target)
         end
       end
  if Ghost2 and Mark and target ~= nil then
    if target and target.valid then
    local A = Vector(myHero)
    local B = Vector(target)
    local direction = (B-A):normalized()
    local midV = A + direction*(A:dist(B)/2) -- get mid vec halfway from A to B
    local shadowV = midV + direction:perpendicular()*300
    if Mark then

         if skills.SkillW.ready then
          if Ghost2 and shadowV then
            CastSpell(_W, shadowV.x, shadowV.z)
            local stap1 = true
          end
          end
            if Ghost and Whandler then
                CastSpell(_E)
                end
                if skills.SkillQ.ready and ValidTarget(target, skills.SkillQ.range)  and Ghost2 then
                      if  Menu.ProdSettings.SelectProdiction == 2 then
                      local CastPosition, HitChance, Position = VP:GetLineCastPosition(target, skills.SkillQ.delay, skills.SkillQ.width, skills.SkillQ.range, skills.SkillQ.speed, myHero, false)
            if HitChance >= 2 and GetDistance(CastPosition) < 900 then
               stap3 = true
               stap3timer = GetGameTimer()
              -- pieter = true
				CastSpell(_Q, CastPosition.x, CastPosition.z)
        
        
        --local gaap = true
       -- print("1655")
            end
  elseif Menu.ProdSettings.SelectProdiction == 1 then
    if Menu.ZedCombo.qSet.useQ and ValidTarget(target, debug) and skills.SkillQ.range  then
      DevineQ()
      --local gaap = true
    end
  elseif Menu.ProdSettings.SelectProdiction == 3 then
    if Menu.ZedCombo.qSet.useQ and ValidTarget(target, debug) and skills.SkillQ.range  then 
      CastQ()
      --local gaap = true
      
    end
  end
end
end
end

  
     
       if skills.SkillE.ready then
          if Ghost then
            if GetDistance(GhostPos, target) <= 290 then
              CastSpell(_E)
            end
          end
          end
  if Ghost2 then
    if GetDistance(GhostPos2, target) <= 290  then
      CastSpell(_E)
    end
  end
  if Ghost2 or Ghost then
    if ValidTarget(target, 290) then
      CastSpell(_E)
    end
    end



if Menu.ZedCombo.eSet.useE  and ValidTarget(target, skills.SkillE.range) and skills.SkillE.ready then
      CastSpell(_E)
    end
if Ghost2 and Ghost and ((myHero.health / myHero.maxHealth * 100) <= Menu.ZedCombo.SwapUlt) then 
  CastSpell(_R, myHero)
end
if Ghost and Whandler and Mark then

    CastSpell(_W)

end


  if myHero:GetSpellData(_R).name == "ZedR2" then
    
    --CastSpell(_R)
    CHECK = true
   
  
  end
end
--[[  if not skills.SkillQ.ready and myHero:GetSpellData(_R).name == "ZedR2" then
    CastSpell(_R)
    print("baas")
  gaap = false
  end--]]
end
end

-- Q maken
    -- get the shadowV a vector of the length you set extending outwards from mid position to the right/left use :perpendicular2() to get the other dir.
      
function LineCombo(target, typeCombo)
--CHECK = true
--print(Menu.ZedCombo.combo)
  if target ~= nil and target.type == myHero.type and target.team ~= myHero.team and not target.dead and not TargetDeath and Menu.ZedCombo.combo then
     --print("line2")
    if skills.SkillW.ready and skills.SkillQ.ready and skills.SkillR.ready then
     -- print("line2")
      if ValidTarget(target, skills.SkillR.range) and myHero:GetSpellData(_R).name ~= "ZedR2" then
           CastSpell(_R, target)
           CHECK = true
         end
       end
       if Mark then
        -- print("yo")
         if skills.SkillW.ready then
          if Ghost2 then
            --print("yo")
          if skills.SkillE.ready and target.valid then
          CastSpell(_E)
          if GhostPos2 ~= nil then
               --print("yo")
            local range = 540
            local range2 =250
            local Post = Vector(target) + (Vector(target) - GhostPos2):normalized() * range
            local Post2 = Vector(target) + (Vector(target) - GhostPos2):normalized() * range2
            local maxxx = myHero.maxHealth * 0.25
           -- print(maxxx)
              if myHero.health < maxxx then
             --   print("yo")
              CastSpell(_W, Post.x, Post.z)
              elseif myHero.health > maxxx then
                CastSpell(_W, Post2.x, Post2.z)
                AA()
              end
              AA()
                  if Whanler and Ghost  then
                  CastSpell(_W)
                    if skills.SkillQ.ready and ValidTarget(target, skills.SkillQ.range) then
                      if  Menu.ProdSettings.SelectProdiction == 2 then
                      local CastPosition, HitChance, Position = VP:GetLineCastPosition(target, skills.SkillQ.delay, skills.SkillQ.width, skills.SkillQ.range, skills.SkillQ.speed, myHero, false)
            if HitChance >= 2 and GetDistance(CastPosition) < 900 then
				CastSpell(_Q, CastPosition.x, CastPosition.z)
       -- print("1655")
          end
          end
  elseif Menu.ProdSettings.SelectProdiction == 1 then
    if Menu.ZedCombo.qSet.useQ and ValidTarget(target, debug) and skills.SkillQ.range  then
      DevineQ()
    end
  elseif Menu.ProdSettings.SelectProdiction == 3 then
    if Menu.ZedCombo.qSet.useQ and ValidTarget(target, debug) and skills.SkillQ.range  then 
      CastQ()
    end
  end
  
    end
    end
  end
end
end
end
--print(Menu.ZedCombo.rSet.SwapUlt)
if Ghost2 and Ghost and ((myHero.health / myHero.maxHealth * 100) <= Menu.ZedCombo.SwapUlt) then 
  CastSpell(_R, myHero)
end
if skills.SkillE.ready then
  if Ghost then
    if GetDistance(GhostPos, target) <= 290 then
      CastSpell(_E)
    end
  if Ghost2 then
    if GetDistance(GhostPos2, target) <= 290  then
      CastSpell(_E)
    end
  end
  if Ghost2 or Ghost then
    if ValidTarget(target, 290) then
      CastSpell(_E)
    end
    end

end
end
end
if Menu.ZedCombo.eSet.useE  and ValidTarget(target, skills.SkillE.range) and skills.SkillE.ready then
      CastSpell(_E)
    end

end
--CHECK = false


--[[
    
    function AllInCombo(target, typeCombo)
	if target ~= nil and typeCombo == 0 and target.type == myHero.type and target.team ~= myHero.team and not target.dead then
		ItemUsage(target)
    if ValidTarget(target, skills.SkillR.range) and myHero:GetSpellData(_R).name ~= "ZedR2" then
       if Menu.ZedCombo.rSet.useR  then 
        CastSpell(_R, target)
       end
    end
    if Menu.ZedCombo.eSet.useE  and ValidTarget(target, skills.SkillE.range) and skills.SkillE.ready then
      CastSpell(_E)
    end
    
    
 if target ~= nil and skills.SkillW.ready then
  if Menu.ZedCombo.wSet.useW and ValidTarget(target, skills.SkillW.range) and skills.SkillW.ready and not target.dead and not Whandler then
  if Menu.ProdSettings.SelectProdiction == 2 then
   
  AOECastPosition, MainTargetHitChance, nTargets = VP:GetCircularAOECastPosition(target, skills.SkillW.delay, skills.SkillW.width, skills.SkillW.range, skills.SkillW.speed, myHero)
      if GetDistance(AOECastPosition) <= skills.SkillW.range and MainTargetHitChance >= 2 then
          Packet("S_CAST", {spellId = _W, fromX = AOECastPosition.x, fromY = AOECastPosition.z, toX = AOECastPosition.x, toY = AOECastPosition.z}):send()
      end
    elseif Menu.ProdSettings.SelectProdiction == 1 then
      DevineW()
    --  print("wajoo")
  elseif Menu.ProdSettings.SelectProdiction == 3 then
    CastW()
	end
end
end

if target ~= nil and target.valid and Menu.ZedCombo.Cap then
  if Whandler and Ghost then
    if target.type == myHero.type and target.team ~= myHero.team then
       for i=1, heroManager.iCount do
      local enemy = heroManager:GetHero(i)
        if ValidTarget(enemy) and enemy ~= nil then 
        qDmg = getDmg("Q", enemy,myHero)
        eDmg = getDmg("E", enemy,myHero)
        rDmg = getDmg("R", enemy,myHero)
      if target.health < qDmg + eDmg + qDmg then
      local check = GetDistance(target, myHero)
      local check2 = GetDistance(target, GhostPos)
      local max = myHero.maxHealth * 0.4
      if check > check2 and check2 <= 325 and myHero.Health > max and not UnitAtTower(Target, 0) then
        CastSpell(_W)
        print("Gapclose")
      end
    end
    end
  end
  end
    end
    end
  --  print("check2")

    --  print("check3")
      if Menu.ZedCombo.qSet.useQ and ValidTarget(target, skills.SkillQ.range) and skills.SkillQ.range then
            if  Menu.ProdSettings.SelectProdiction == 2 then
			local CastPosition, HitChance, Position = VP:GetLineCastPosition(target, skills.SkillQ.delay, skills.SkillQ.width, skills.SkillQ.range, skills.SkillQ.speed, myHero, false)
      --print("check 2")
            if HitChance >= 2 and GetDistance(CastPosition) < 900 then
             -- print("check1")
				CastSpell(_Q, CastPosition.x, CastPosition.z)
       -- print("301")
            end
  elseif Menu.ProdSettings.SelectProdiction == 1 then
    if Menu.ZedCombo.qSet.useQ and ValidTarget(target, debug) and skills.SkillQ.range  then
      DevineQ()
    end
  elseif Menu.ProdSettings.SelectProdiction == 3 then
    if Menu.ZedCombo.qSet.useQ and ValidTarget(target, debug) and skills.SkillQ.range  then 
      CastQ()
    end
  end
  
    end


	
	end
end
--]]



-- ulti

function CastQ()
 -- print("castQ")
  
  if target ~= nil and target.type == myHero.type and target.team ~= myHero.team and target.valid then
 -- QPos, QHitChance = HPred:GetPredict("Q", target, myHero)
 --print("Paasdasas")
  local QPos, QHitchance = HPred:GetPredict(Zed_Q, target, myHero)
 -- print(QHitchance)
  --print("CAstQ@")
  --print(QHitchance)
  if QHitchance >= 0.9 then
   -- print("wow")
    --print("short")
  --print("laastecheck")
    if VIP_USER then
      Packet("S_CAST", {spellId = _Q, toX = QPos.x, toY = QPos.z, fromX = QPos.x, fromY = QPos.z}):send()
    --  print("castQ3")
    else
      CastSpell(_Q, QPos.x, QPos.z)
    end

  --print("laastecheck")

end
end
  end
  
    
    function CastW()
  --print("castE")
  if target ~= nil then
    
local WPos, WHitchance = HPred:GetPredict(Zed_W, target, myHero)
 -- EPos, EHitChance = HPred:GetPredict("E", target, myHero)
  
  --print("CAstE@")
  if WHitchance >= 1 then
  --print("laastecheck")
    if VIP_USER then
      Packet("S_CAST", {spellId = _W, toX = WPos.x, toY = WPos.z, fromX = WPos.x, fromY = WPos.z}):send()
    --  print("castE3")
    else
      CastSpell(_W, WPos.x, WPos.z)
    end
    
  end
  
end
end
