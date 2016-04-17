local GetAllUnits = import('/mods/NameAllTheThings/modules/allunits.lua').GetAllUnits
local randomOffset = math.floor(Random(0,10))

local names = {
	'Figaro',
	'Morgan',
	'Entropy',
	'Figaro',
	'Morgan',
	'Entropy',
	'MaxwellsDemon',
	'BrownianRatchet',
	'Juice',
	'Nose',
	'Horse',
	'Kevin',
	'Evil Colleagues',
	'Photon',
	'Phelom',
	'Vanguard',
	'MistakeNot',
	'WoodenNipple',
	'Spoon',
	'Phantom',
	'unit'
}

local uefNames = {
	'Space Nazy',
	'Space Nazy',
	'Space Nazy'
}

local idleWorkerPrefixes = {
	'Bored',
	'Lazy',
	'Useless',
	'Slacking',
	'"Who needs engies anyway"',
	'"I\'m le tired"',
	'"Making lunch"',
	'"Making dinner"',
	'"Can I please have some shoes"'
}

local idleNonWorkerPrefixes = {
	'Bored',
	'Lazy',
	'Useless',
	'Slacking',
	'Tired',
	'"Lunchbreak"',
	'"Eating dinner"',
	'"<3 defence budget"',
	'"Not earning enough"'
}

local stunnedPrefixes = {
	"KO'd",
	'Shocked',
	'Unconscious'
}

local outOfFualAdjective = 'hungry'

local highHealthOpener = 'Such a'
local minorDamageOpener = 'Annoyed'
local mediumDamageOpener = 'Angry'
local highDamageOpener = 'Raging'

local numNames = table.getn(names)
local numIdleWorker = table.getn(idleWorkerPrefixes)
local numIdleNonWorker = table.getn(idleNonWorkerPrefixes)
local numStunned = table.getn(stunnedPrefixes)

for _,v in ipairs(names) do 
    table.insert(uefNames, v)
end

local numUefNames = table.getn(uefNames)

function NameUnits()
  while true do
	  WaitSeconds(1)
	  for _,u in GetAllUnits() do
		  if not u:IsInCategory("STRUCTURE") and not u:IsInCategory("COMMAND") then
			NameUnit(u)
		  end
	  end
  end
end

function NameUnit(u)
  name = MakeUnitName(u)

  if u:GetCustomName(nil) != name then
	  u:SetCustomName(name)
  end
end

function MakeUnitName(u)
  local entityId = tonumber(u:GetEntityId()) + randomOffset
  local name = GetHealthPrefix((u:GetMaxHealth() == 0) and 1 or (u:GetHealth() / u:GetMaxHealth()))
  
  if u:IsStunned() then
	  name = name .. " " .. stunnedPrefixes[modulo(entityId, numStunned) + 1]
  end
  
  if u:IsInCategory('AIR') and u:GetFuelRatio() > -1 and u:GetFuelRatio() < .2 then
	  name = name .. " " .. outOfFualAdjective
  end

  if u:IsIdle() then
	if u:IsInCategory('ENGINEER') then
		name = name .. " " .. idleWorkerPrefixes[modulo(entityId, numIdleWorker) + 1]
	else 
		name = name .. " " .. idleNonWorkerPrefixes[modulo(entityId, numIdleNonWorker) + 1]
	end
  end
  
  if u:IsInCategory('UEF') then
    name = name .. " " .. uefNames[modulo(entityId, numUefNames) + 1]
  else
	name = name .. " " .. names[modulo(entityId, numNames) + 1]
  end
  
  return name
end

function modulo(a,b)
	return a - math.floor(a/b)*b
end

function GetHealthPrefix(percent)
	if percent > 0.8 then
		return highHealthOpener
	end
	if percent > 0.6 then
		return minorDamageOpener
	end
	if percent > 0.3 then
		return mediumDamageOpener
	end
	return highDamageOpener
end
