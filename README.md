Autofill
=====

The Autofill mod by rk84 updated for .13 by Jakimfett and more default sets added by Nexela

###Please report any problems to the forum post, or to Github. The mod portal does not notify me about new posts.
https://forums.factorio.com/viewtopic.php?f=92&t=1612
https://github.com/Nexela/autofill/issues

Autofill Automatically fills fuel (like coal) and ammo from your main inventory to entities when you create them. Including Trains, Planes, and Automobiles. Oh and Turrets, boilers, burner inserters, burner assemblers, and overpowered nuclear weapon launchers just to name a few more!

##Now with HOTKEY support!
All these keys are configurable in your Factorio - Controls - Mods menu.
Hover over an entity in the field and CTRL-F to fill it based on your ruleset!
Toggle filling limits on or off with CTRL-SHIFT-F for those times when you want to Fill something without limits.
Toggle dividing fuel/ammo amongst groups of items with CTRL-ALT-F

Current Mods with a set enabled by default:

* Yuoki Industries - All Turrets, Boilers, Ammos
* Bob's Mods - All Turrets, Tanks including Artillery ammo, Ammos
* Uranium Power - Ammo's and shells
* Shuttle Train
* Advanced Tanks
* Combat Robots
* General Improvments
* Farl
* And many others.

---

####More Information

* Fuel items are automaticly added and sorted from low to high anytime a mod is added, changed, or removed.
* car, dielsel-locomotive and tank are loaded with fuel with highest fuelvalue. (+ tank includes ammos too)
* Burners group: Burner mining drills, Stone furnaces, Steel furnaces, Burner inserters and Boilers work same as vehicles, but all fuel is divided to all "burners" that are in quickbar and hand.
* Turrets group: Gun turrets are loaded with ammos (First in array first in use). Ammo is divided to all turrets in quickbar and hand.

If a mod you like doesn't work out of the box let me know and I will see about adding it, or walk your through how to add it to your personal set using the command line interface.

####Examples for making your own set:  

Create  personal setting for car.
`remote.call("af", "insertset", "", "car", {{"coal","raw-wood"}, "basic-bullet-magazine"}) `
Insert nothing to car. (ignores default setting)
`remote.call("af", "insertset", "", "car", 0) `
reset to default setting
`remote.call("af", "insertset", "", "car", nil)`

------

###TODO

* Super Awesome GUI for making sets a lot easier
* Better Error Checking
* Fuel blacklists so we are not burning our wooden power poles

---

####Change Log
##Please see the changelog.txt file for more details

* 1.4.4   - Factorio Version .14
* 1.4.3   - Natural Evolution! -Added Biological Bullet from NE-Enemies -minor code fixes
* 1.4.2   - Factorio Extended - Remote interface changes, Factorio Extended and Nucular added, cleaned up the sets a bit. squashed a few biters, Hotkey for toggling groups.
* 1.4.1   - The NotEnoughTanks Release - More safety checks for when mods are removed, Added Tankwerks, MoCombat, Supertank, KSpower, Military5, IncindiaryMunitions, Artillery.
* 1.4.0   - The No Limits release - More Hotkeys, more mods supported by default, General improvements, Advanced Tanks.
* 1.3.18 -  The Tap, tap, tap release -Hotkeys!, Added some more of Bob's Stuff, Temporary fix for mods being removed causing crash.
* 1.3.17 - Added Bulldozer and Combat Drones.  Might have to do /c remote.call("af", "resetMod") if adding to an existing save.