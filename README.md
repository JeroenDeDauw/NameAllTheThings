# Name All The Things

A naming mod for [Supreme Commander: Forged Alliance Forever][FAF].

<img align="right" src="icon.PNG">

Automatically sets names for your units. The names can change based on the units status. For instance,
damage can cause a unit to be labeled "anrgy", while idle units can be labeled "lazy" or "useless".
These names are visible to you, and to the people you are playing with.

## Installation

* Download the [latest version of the mod][download]
* Extract the zip and rename the directory from `NameAllTheThings-master` to `NameAllTheThings`
* Place the directory into `Documents\My Games\Gas Powered Games\Supreme Commander Forged Alliance\Mods`

## Configuration

You can configure the names that show up by editting the text at the top of `modules\nameunits.lua`.
The names cannot contain the quotation marks placed in front and after them and need to be followed
by a comma, except for the last name in a list, which should not be followed by a comma.

## Updates and contributing

You can find the latest version of the mod on the [Name All The Things GitHub project][GitHub], which is
also the place where you can file issues, post feature request, and submit patches.

## Release notes

### Version 2.0 - 2016-04-17

Changes by EntropyWins

* All texts are now configurable at the top of the file
* Out of fuel units will be "hungry"
* Workers and non-workers now have different IDLE messages
* You can now set special names that only show up for UEF units
* Renamed mod from "NameStuff" to "Name All The Things"
* Added this README
* Refactored naming code for readability
* Removed dead code and unused files
* Added mod icon

### Version 1.0 - 2014-07-22

Initial version by Sheeo

[FAF]: http://www.faforever.com/
[download]: https://github.com/JeroenDeDauw/NameAllTheThings/archive/master.zip
[GitHub]: https://github.com/JeroenDeDauw/NameAllTheThings
