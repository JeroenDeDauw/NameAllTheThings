local originalCreateUI = CreateUI 
local originalOnSelectionChanged = OnSelectionChanged
local UpdateAllUnits = import('/mods/NameAllTheThings/modules/allunits.lua').UpdateAllUnits
local NameUnits = import('/mods/NameAllTheThings/modules/nameunits.lua').NameUnits

function OnSelectionChanged(oldSelection, newSelection, added, removed)
   if not import('/mods/NameAllTheThings/modules/allunits.lua').IsAutoSelection() then
      originalOnSelectionChanged(oldSelection, newSelection, added, removed)
   end
end

function CreateUI(isReplay) 
  originalCreateUI(isReplay) 
  AddBeatFunction(UpdateAllUnits)
  if not isReplay then
	  ForkThread(NameUnits)
  end
end
