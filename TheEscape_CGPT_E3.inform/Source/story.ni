"A Day in the Dungeon" by "Nico Ailani Carlson"

Include Basic Screen Effects by Emily Short. 
Include Basic Help Menu by Emily Short.

[===MENU===]
Table of Basic Help Options (continued)
	title		description
	"Hint"	"The puzzle of the game is pretty straightforward and you are confined to a single room so I won't give you too much help.[line break][line break]However, to ensure that you aren't failing because you don't know the appropriate words... Following are all of the actions that you might need in order to succeed in the game, other than the cardinal directions: [italic type]examine, look, search, take, pull, drop, pry something with something, dig something with something, enter, leave,[roman type] and [italic type]wait[roman type]."

[==================================INTRODUCTION==================================]
When play begins:
	[ADD HELP MENU DESC]
	choose row 1 in Table of Basic Help Options;
	now description entry is "[italic type]This is a game created for Narrative Studio as a part of the Game Design MFA program.[roman type][line break][line break][italic type]A Day in the Dungeon[roman type] is a classic fantasy 'escape room' adventure heavily inspired by the lore and aesthetics of [italic type]Dungeons and Dragons[roman type], [italic type]Lord of the Rings[roman type], and especially [italic type]Dungeon Meshi[roman type].";
	
	[START PROLOGUE]
	say "You trail absentmindedly behind your party. The packs of your companions sway back and forth in the torchlight ahead of you. You've been traveling down this narrow stone hallway for hours now. The most action you've seen today has been the choice between left and right when faced with a fork in these convoluted dungeon hallways. An unexciting day in the dungeon is a good one, for sure. And yet...";
	pause the game;
	say "You trail absentmindedly behind your party. The packs of your companions sway back and forth in the torchlight ahead of you. You've been traveling down this narrow stone hallway for hours now. The most action you've seen today has been the choice between left and right when faced with a fork in these convoluted dungeon hallways. An unexciting day in the dungeon is a good one, for sure. And yet....";


[==================================VARIABLES==================================]

[===INTRO VARIABLES===]
lostParty is a truth state variable. lostParty is false.
reallyLost is a truth state variable. reallyLost is false.
foundPlate is a truth state variable. foundPlate is false.

[===TRAP ROOM VARIABLES===]
arrivedInRoom is a truth state variable. arrivedInRoom is false.
droppedTorch is a truth state variable. droppedTorch is false.
roomDark is a truth state variable. roomDark is false.
gotBone is a truth state variable. gotBone is false.
seenShovel is a truth state variable. seenShovel is false.

[===CHUTE VARIABLES===]
hasChuted is a truth state variable. hasChuted is false.
wasInChute is a truth state variable. wasInChute is false.

[PUZZLE SOLUTION VARIABLES]
hasSpawnedGlimmer is a truth state variable. hasSpawnedGlimmer is false.
glimmerPried is a truth state variable. glimmerPried is false. 
glimmerDug is a truth state variable. glimmerDug is false.

[===WATER VARIABLES===]
waterLevel is a number that varies. waterLevel is 0.
waterFilling is a truth state variable. waterFilling is false.
roomFlooded is a truth state variable. roomFlooded is false.

[===MISC===]
actionEconomy is a number that varies. actionEconomy is 0.
amountBreath is a number that varies. amountBreath is 3. 

[==================================RESPONSES==================================]

[===================================ACTIONS==================================]
[INVESTIGATING]
Investigating is an action applying to one visible thing and requiring light. 
Understand "search for [something]", "look for [something]", "investigate [something]" as Investigating.
Check investigating: 
	say "There's nothing of interest here."
	
[PRYING]
Prying is an action applying to one thing and one carried thing.
Understand "dig [something] with [something]", "pry [something] with [something]", "remove [something] with [something]", "pull [something] with [something]", "pull apart [something] with [something]" as prying.
Check prying:
	say "It might be dangerous to attempt that."
	
[EXAMINING ME]
Instead of examining player:
	if the player is in Trap Room:
		if roomDark is true:
			say "You can't see yourself but you are very nearly crippled by fear and panic.";
		else if waterFilling is true:
			say "You're still bruised from your fall through the chute but now you're also chock full of panic and wetter than you were before.";
		else:
			say "You ensure that you don't have any serious wounds. You're pretty beat up from your descent through the chute but it seems to just be bruises and nothing is broken.";
	else if the player is in Golden Room:
		say "You look down at yourself... You're wet. You're bruised. You're exhausted from prolonged panic and fear... But you're alive.";
	else:
		say "You look down at yourself. You're quite wiry (some would say emaciated) but surprisingly clean and uninjured after months of delving in the dungeon. You let out a weary sigh and swap torch hands to stretch.";
	

[==================================INVENTORY=================================]

[==TORCH==]
The torch is a lit thing.
The description of the torch is "Your trusty torch. The staff itself is quite worn where you've held onto it for the past few months. You recently wrapped new pitch-soaked rags around the head of the torch so it should burn brightly for a long while, as long as nothing dramatic happens."
The printed name of torch is "trusty torch". 
Understand "torch", "trusty torch", "trusty pal", "only friend" as torch.
The player carries torch.

Instead of dropping the torch:
	say "You couldn't possibly think of dropping your trusty torch. Now that your companions have left you behind, this torch is the only friend you have!"

[==PACK==]
The pack is an undescribed closed openable container. 
The player carries the pack. 
The description of the pack is "Your trusty pack. It is heavily worn from years of use. The straps and fabric have all been replaced, multiple times in some cases... Perhaps this isn't your trusty pack but a new pack entirely... perhaps Theseus would have something to say about that."

Instead of opening the pack:
	say "You root around in your pack. You see your rations, your bedroll, and some other assorted paraphernalia. Strapped to the side is your short sword on one side and dagger on the other. Some of your companions berate you for not wearing your weapon on your hip but this is [italic type]so[roman type] much more convenient! You close up your bag and swing it over your shoulder, glad to know that everything is in its right place."


[==================================ROOMS====================================]

[=====================PRE-TRAP ROOMS=====================]

[===HALLWAY===]
The Hallway is a room. "[if not visited]Your eyes water as a yawn overtakes you. You blink rapidly as you try to regain your composure. When you prevail over your oppressive sleepiness you notice that your companions have left you behind. You see their orb of light disappear behind a corner to the north.  You can still hear them arguing about one thing or another. You raise your torch, the light is not as warm and bright as the magical orb but it's plenty to see the way forward. [else if reallyLost is true]You head back in what can only be described as the [italic type]correct[roman type] direction. You think you make it back to where you started before you went in the absolute wrong direction... Now that you've been turned around even more you're only reasonably certain that north is where your party had been heading. [else if lostParty is true]You backtrack, inexplicably. Meandering back the way you came. By your own design you now have definitely lost your party. Maybe if you move quick and have a healthy amount of luck you'll be able to catch up to them. [else] You raise your torch, looking around. The beige bricks that are stacked to make the walls of this dungeon are cracked and uneven, worn by the passage of time and the thousands of adventurers who have travelled these halls before you. Ahead of you, to the north you can hear the voices of your companions as they leave you behind."
	
Instead of thinking in the Hallway: 
	if lostParty is true:
		say "Well... You've lost your party. You can't hear them bickering anymore and you're not entirely sure what direction they went in... This is bad.";
	otherwise:
		say "You've wasted a bit of time meandering here but your companions are just barely ahead of you. Even a speed walk to the north will catch you up to them in no time.";
		
Instead of going south in the Hallway:
	now reallyLost is true;
	continue the action;
		
[===HALLWAY CONT'D (HALLWAY_3)===]
South of Hallway is Hallway_3.
The printed name of Hallway_3 is "Hallway (Cont'd)".
The description of Hallway_3 is "[If not visited]In a stunning show of stupidity, you elect to go [italic type]away[roman type] from your party and backtrack a bit."

Instead of going south in Hallway_3:
	say "Oh yeah! Just keep going that way! Brilliant!"
	
Instead of going north in Hallway_3:
	say "You head back the way you and your party had been going in the first place. You're not sure what came over you and compelled you to head in the opposite direction but the consequences of your actions have arrived: you are well behind your companions.";
	continue the action;
	
[===HALLWAY CONT'D (HALLWAY_2)===]
North of Hallway is Hallway_2.
The printed name of Hallway_2 is "Hallway (Cont'd)".
The description of Hallway_2 is "[if lostParty is true]You sheepishly jog to a fork in the hallway. One hallway bends to the east, the other to the west. Back to the south is where you and your party originally came from. And then there's you: the idiot who lost their party. [else if reallyLost is true]You're still beating yourself up about inexplicably heading in the absolute wrong direction when you stumble upon a fork. One hallway bends to the east, the other to the west. Back to the south is where you (more recently) and your party (less recently) came from. And then there's you: the idiot who lost their party. [else if not visited]You trot down the hallway after the argumentative babblings of your companions. You hoist your pack higher and pull it flush to your back as you break into a jog. Everyone knows that a surefire way to die in the dungeon is to get separated from your party.[line break][line break]You come to a fork, the very same fork you saw your companions disappear behind. You can now make out the glow of your party's conjured magical orb to the east... and you can hear that they are still arguing. [else]You come to a halt at a fork in the hallway and stop to catch your breath, looking around. Ominous dungeon hallways stretch to your west, east, and back to the south.";
		
Instead of thinking in Hallway_2:
	if lostParty is true:
		say "Well... You've lost your party. You can't hear them bickering anymore and you're not entirely sure what direction they went in... This is bad.";
	otherwise:
		say "You're just a hundred feet or so away from your bickering companions! Better catch up to them!";
		
Instead of going south in Hallway_2:
	now lostParty is true;
	continue the action;
		
[===PRESSURE PLATE===]
The pressure plate is a scenery in Hallway_2. "You start looking for signs of traps nearby. Why? You're not quite sure. Much to your surprise you actually find two well-hidden pressure plates! One to your east and one to your west. What fortune that you thought to look for pressure plates! You definitely would've stepped on one of those otherwise."

Understand "plate", "trap button", "trap", "traps" as Pressure Plate.

Instead of investigating pressure plate:
	say "You start looking for signs of traps nearby. Why? You're not quite sure. Much to your surprise you actually find two well-hidden pressure plates! One to your east and one to your west. What fortune that you thought to look for pressure plates! You definitely would've stepped on one of those otherwise.";
	now foundPlate is true;

Instead of examining pressure plate:
	now foundPlate is true;
	continue the action;

[===TRIGGERING AND HEADING TO TRAP ROOM==]	
Instead of going west in Hallway_2:
	if foundPlate is true:
		continue the action;
	otherwise:
		if lostParty is true:
			say "You're a little doubtful whether or not the party went this way but... You head west.";
		say "You trot westward down the hallway, hopeful that you'll be able to catch up when-- [italic type]CLICK[roman type] --you feel a slight decompression beneath your right foot. Then, suddenly, you are plummeting downwards into darkness. [line break]";
		wait for any key;
		say "[line break]Your pack catches on the trap opening, ripping it from your back. Then, you are hurtling down a narrow tunnel. You shield your head and neck while attempting to slow your descent by widening your legs. You try not to think about where this chute will spit you out. You hope it's not a room full of spikes or the den of a giant spider.[line break]";
		wait for any key;
		remove the pack from play;
		move torch to Trap Room;
		move player to Trap Room;

Instead of going east in Hallway_2:
	if foundPlate is true:
		continue the action;
	otherwise:
		if lostParty is true:
			say "You're pretty sure that your party went this way.";
		say "You trot eastward down the hallway, hopeful that you'll be able to catch up to your party when-- [italic type]CLICK![roman type] --you feel a slight decompression beneath your right foot. Then, suddenly, you are plummeting downwards into darkness. [line break]";
		wait for any key;
		say "[line break]Your pack catches on the trap opening, ripping it from your back. Then, you are hurtling down a narrow tunnel. You shield your head and neck while attempting to slow your descent by widening your legs. You try not to think about where this chute will spit you out. You hope it's not a room full of spikes or the den of a giant spider.[line break]";
		wait for any key;
		remove the pack from play;
		move torch to Trap Room;
		move player to Trap Room;
	
[===DUNGEON LABYRINTH===]
The Dungeon Labyrinth is west of Hallway_2. "You head westward! That's where your party went... right?"

After looking in Dungeon Labyrinth:
	end the story saying "You become hopelessly lost in the depths of the dungeon. You've done the one thing that they tell you not to do in Dungeon Delving 101: don't get seperated from the party. [line break][line break]For a few days, as you eat your way through your limited rations, you hope that you might stumble upon another party with a tracker or a guide. But after a week you lose hope. You resort to hunting the strange, monstrous creatures that dwell down here. Perhaps... now this is your home."
	
[===DUNGEON AMPHITHEATER===]
The Dungeon Chamber is east of Hallway_2. "You head eastward! You're pretty confident that's the direction your party went."

After looking in Dungeon Chamber:
	end the story saying "The hallway winds down and eventually opens up to a large, abandoned chamber. Tall columns reach up into the darkness, the ceiling not visible by your paltry torchlight.[line break][line break] You breathe a sigh of relief when you catch sight of your party's hovering orb of light. They stand in front of a large set of ornate double doors, debating how to get in, no doubt. You sheepishly jog up to them, knowing that you are in for a justifiable reaming after allowing yourself to be separated from them. [line break][line break]As you settle back in to the comfort of being surrounded by your companions you make a silent promise to yourself... to never be separated from them again."


[=====================TRAP ROOM=====================]
The Trap Room is a room. 

[GOING NORTH TO CHUTE CONDITIONS]
Instead of going north in the Trap Room:
	if waterLevel is greater than 8:
		now amountBreath is 3;
		now actionEconomy is 1;
		if hasChuted is false:
			say "[line break]You flail about in the water, reaching out to try to find the chute. You use the wall as a guide and try to stay calm. Your heart races and your lungs burn but eventually your fingers find the lip of the chute and-- [italic type]GASP![roman type] --you surface in--[line break]";
		otherwise:
			say "[line break]You flail about, swimming frantically back to the chute for another gulp of air. No matter how many times you do this you are absolutely positive that the experience of searching for the chute in pitch darkness will never not be gut-wrenchingly terrifying. You resurface with a gasp in--[line break]";
		move the player to chute_room;
		now wasInChute is true;
	otherwise:
		say "The chute you came through [italic type]is[roman type] to the north but it is a bit too high up and extremely steep to boot. There's no way you could climb up in there. Certainly no way you could make your way back up the chute.";
		

[===CHUTE===]
The chute is an enterable scenery container in the Trap Room. 
Understand "chute", "mouth", "entrance" as the chute.
The description of the chute is "A small lip protrudes from the wall, marking where the chute ends and this trap room begins. The angle of the chute is exceptionally steep and slickened with some sort of algae. It'll be impossible to climb back up the chute."

The chute_room is a room north of the Trap Room. 
The printed name of the chute_room is "Trap Room, Chute".
The description of the chute_room is "It's pitch dark in here but you think you can see the glimmer of some sort of light below you, in the submerged trap room."

Instead of looking in chute_room:
	if hasChuted is false:
		now the description of the chute_room is "After collecting your breath and stabilizing your heart rate, you notice that the water level doesn't seem to be rising. However, it also doesn't seem to be falling... These old trap mechanisms run on ancient systems of cogs and magic. It could be weeks before the room begins to drain... In fact, these traps often break upon triggering, meaning that the room could [italic type]never[roman type] drain.";
	otherwise:
		now the description of the chute_room is "It's pitch dark in here but you think you can see the glimmer of some sort of light below you, in the submerged trap room.";
	now hasChuted is true;
	continue the action;

[ENTERING/EXITING THE CHUTE]
Understand "swim to [something]", "enter [something]", "go to [something]" as entering.
Instead of entering the chute:
	if the waterLevel is greater than 8:
		now amountBreath is 3;
		now actionEconomy is 1;
		if hasChuted is false:
			say "You flail about in the water, reaching out to try to find the chute. You use the wall as a guide and try to stay calm. Your heart races and your lungs burn but eventually your fingers find the lip of the chute and-- [italic type]GASP![roman type] --you surface in--[line break]";
		otherwise:
			say "You flail about, swimming frantically back to the chute for another gulp of air. No matter how many times you do this you are absolutely positive that the experience of searching for the chute in pitch darkness will never not be gut-wrenchingly terrifying. You resurface with a gasp in--[line break]";
		move the player to chute_room;
		now wasInChute is true;
	otherwise:
		say "The chute is a bit too high up and extremely steep to boot. There's no way you could climb up in there. Certainly no way you could make your way back up the chute.";
		
Instead of exiting:
	if the player is in chute_room:
		say "You take a shuddering, deep breath and dive back into the abyssal waters.";
		move the player to the Trap Room;
		now amountBreath is 4;

[===WALLS===]
The walls is scenery in the Trap Room.
Understand "walls", "wall" as the walls.

[EXAMINING]
Instead of examining the walls:
	[IF ROOM IS FLOODED]
	if roomFlooded is true:
		now the description of the walls is "You swim in the cold void until you collide with the wall, feeling your way along the rough surface. As you make your way around the perimiter of the room you come quite close to the glimmer of light.";
	[IF ROOM IS DARK]
	else if roomDark is true:
		if waterLevel is greater than 4:
			now the description of the walls is "You wade blindly until your palms meet the rough surface of the wall. You slowly feel your way around the perimiter of the room. As you blindly stumble about you see a glimmer of light above you, seemingly coming from a top corner of this hellish room you're trapped in.";
		otherwise:
			now the description of the walls is "You walk with your hands outstretched until your palms meet the rough surface of the wall. You slowly feel your way around the perimiter of the room. As you blindly stumble about you see a glimmer of light above you, seemingly coming from a top corner of this hellish room you're trapped in.";
	[IF ROOM IS FILLING WITH WATER]
	else if waterFilling is true:
		if player carries torch:
			if waterLevel is greater than 4:
				now the description of the walls is "You wade towards the nearest wall, holding your torch up to inspect the rough surface. You reach out and feel the rough, uneven brickwork that makes up the walls of this chamber. Some of the bricks are a little loose but there are hundreds of them. Behind the bricks looks to be densely packed earth or stone. Otherwise, there is nothing else of note.";
			otherwise:
				now the description of the walls is "You walk towards the wall, holding your torch up to inspect the rough surface. You reach out and feel the rough, uneven brickwork that makes up the walls of this chamber. Some of the bricks are a little loose but there are hundreds of them. Behind the bricks looks to be densely packed earth or stone. Otherwise, there is nothing else of note.";
		otherwise:
			now the description of the walls is "The torch lies on the floor, hissing in protest of the rising water. You can't see the walls without it. ";
	[ELSE]
	else:
		if player carries torch:
			now the description of the walls is "You walk towards the wall, holding your torch up to inspect the rough surface. You reach out and feel the rough, uneven brickwork that makes up the walls of this chamber. Some of the bricks are a little loose but there are hundreds of them. Behind the bricks looks to be densely packed earth or stone. Otherwise, there is nothing else of note.";
		otherwise:
			now the description of the walls is "The torch lies on the floor, patiently waiting to be picked up. You can't see the walls without it. ";
	continue the action;

[===SKELETON===]
The skeleton is an open scenery container in the Trap Room. 
Understand "skeleton", "corpse", "body", "decayed remains", "remains", "macabre pile" as skeleton.
[EXAMINING]
Instead of examining the skeleton:
	if roomFlooded is true:
		if gotBone is false:
			now the description of the skeleton is "You dive down, feeling your way along the floor of the flooded room. It takes you long enough for your lungs to scream in protest but you are able to blindly find the skeleton. You feel along the skull... down the ribcage... and to the long leg bones. Now that you're down here you might as well try taking one of these [bone]s... right?";
			now gotBone is true;
			move the bone to the Trap Room;
		otherwise:
			now the description of the skeleton is "You dive down to the skeleton again, finding it more easily the second time around. It's still there... Though there's nothing else of use to you. ";
	else if roomDark is true:
		if gotBone is false:
			now the description of the skeleton is "You blindly feel your way around the room until you stumble across the skeleton. You feel along the skull... down the ribcage... and to the long leg bones. Now that you're down here you might as well try taking one of these [bone]s... right?";
			now gotBone is true;
			move the bone to the Trap Room;
		otherwise:
			now the description of the skeleton is "You blindly feel your way towards the skeleton, finding it more quickly this time. It's still there... Though there's nothing else of use to you.";
	else if waterFilling is true:
		if gotBone is false:
			if player carries torch:
				now the description of the skeleton is "You hold your trusty torch up, quickly walking over to the pile of bones in the corner. The skeleton has certainly seen more lively days, it looks like it could be years old. However, some of the longer leg bones still look quite sturdy... Perhaps worth taking?";
				now gotBone is true;
				move the bone to the Trap Room;
			otherwise:
				now the description of the skeleton is "Your trusty torch sputters in protest of the rising water... You can't see much without its help!";
		otherwise:
			if player carries torch:
				now the description of the skeleton is "You hold your trusty torch up, re-examining the decayed remains of the previous victim of this room... It's still there and still makes your stomach drop. But otherwise there's nothing else of use to you.";
			otherwise:
				now the description of the skeleton is "Your trusty torch sputters in protest of the rising water... You can't see much without its help!";
	else:
		if gotBone is false:
			if player carries torch:
				now the description of the skeleton is "You hold your trusty torch up, meandering over to the pile of bones in the corner. The skeleton has certainly seen more lively days, it looks like it could be years old. However, some of the longer leg bones still look quite sturdy... Perhaps worth taking?";
				now gotBone is true;
				move the bone to the Trap Room;
			otherwise:
				now the description of the skeleton is "Your trusty torch lies in wait on the floor, waiting to be put to use. You can't see much without it!";
		otherwise:
			if player carries torch:
				now the description of the skeleton is "You hold your trusty torch up, re-examining the decayed remains of the previous victim of this room... It's still there and still makes your stomach drop. But otherwise there's nothing else of use to you.";
			otherwise:
				now the description of the skeleton is "Your trusty torch lies in wait on the floor, waiting to be put to use. You can't see much without it!";
	continue the action;
	
	
[===BONE===]
The bone is an undescribed thing. 
Understand "long bone", "bone", "bones", "longer leg bone", "longer bone" as bone. 

Instead of taking the bone:
	if player carries the bone:
		say "You're already carrying one bone... You don't really need another one.";
	else:
		say "You grimace as you snap off one of the larger leg bones from the skeleton. You forget the name of it but it's the thicker one in your thigh. You feel a phantom pain in your own leg as you shove the bone through your belt.";
		now the player carries the bone;

Instead of examining the bone:
	if player carries the bone:
		now the description of the bone is "You've shoved the bone through your belt. Despite it being the rotting remains of a regrettably retired adventurer... its heft and sturdiness are somewhat comforting.";
	else if roomFlooded is true:
		now the description of the bone is "You can't see it but you're sure the bone is floating in the pitch darkness somewhere...";
	else if roomDark is true:
		now the description of the bone is "You can't see it but you're sure the bone is in the room somewhere.";
	else if waterFilling is true:
		if player carries torch:
			now the description of the bone is "You glance over towards the skeleton and its many bones. Some of them might be sturdy enough to be helpful.";
		otherwise:
			now the description of the bone is "Though you want to examine some bones, you are without your trusty torch! You can't see much without it.";
	else:
		if player carries torch:
			now the description of the bone is "You glance over towards the skeleton and its many bones. Some of them might be sturdy enough to be helpful.";
		otherwise:
			now the description of the bone is "Though you want to examine some bones, you are without your trusty torch! You can't see much without it.";
	continue the action;

[===FLOOR===]
The floor is scenery in the Trap Room.
Understand "ground", "floor", "floors" as the floor.
The description of the floor is "The floor is made up of unevenly laid porous brick. Along the wall, only a few feet away from the skeleton, there is a small [hole] surrounded by a frantic ring of loose bricks."
[EXAMINING]
Instead of examining the floor:
	if roomFlooded is true:
		now the description of the floor is "Though you can't see the floor, you're sure its down there somewhere, submerged in horrid, murky water.";
	else if roomDark is true:
		now the description of the floor is "Though you can't see the floor, you're sure it's there because you're standing on it.";
	else if waterFilling is true:
		now the description of the floor is "Though the floor is now being covered by putrid dungeon water, you can still make out its basic features: uneven brick and tightly packed earth and stone.";
	else:
		now the description of the floor is "The floor is made up of porous, unevenly laid brick that barely covers up the tightly packed earth and stone beneath. ";
	continue the action;

[===HOLE===]
The hole is scenery in the Trap Room. 
Understand "hole", "torn up bricks", "small hole", "pit", "ditch", "hollow" as hole. 
The description of the hole is "You move quickly to the small hole. You see that the hole is already mostly filled with opaque, murky water."

Understand "reach inside [something]", "look inside [something]", "search [something]" as searching.

Instead of examining the hole:
	if roomFlooded is true:
		now the description of the hole is "You can't see it but you're sure that the hole is still down there in the murky depths somewhere. Though you can't see it, you could still search it!";
	else if roomDark is true:
		now the description of the hole is "Though you can't see it, you feel about the room and eventually trip over the hole. Though you can't see inside, you could search it by reaching inside.";
	else if waterFilling is true:
		if player carries torch:
			now the description of the hole is "As the water level begins to rise the hole itself is mostly obscured. It's not particularly wide but maybe it is quite deep? Though you can't see through the murky water, you could search it by reaching inside.";
		otherwise:
			now the description of the hole is "Your trusty torch lies in wait on the floor, waiting to be put to use. You can't see much without it!";
	else:
		if player carries torch:
			now the description of the hole is "As the water level begins to rise the hole itself is mostly obscured. It's not particularly wide but maybe it is quite deep? Though you can't see through the murky water, you could search it by reaching inside.";
		otherwise:
			now the description of the hole is "Your trusty torch lies in wait on the floor, waiting to be put to use. You can't see much without it!";
	continue the action;
		

Instead of searching the hole:
	if roomFlooded is true:
		say "You dive down, searching blindly for the hole. By the time you find it your lungs are already screaming for air. You feel around the rough bottom of the hole and find your fingers wrapping around some sort of shaft or handle. [line break][line break]";
	else if waterLevel is greater than 3:
		say "Remembering where the hole was before it was fully submerged in water, you reach down into it. You feel around the rough bottom of the hole and find your fingers wrapping around some sort of shaft or handle. [line break][line break]";
	else:
		say "You reach down into the murky water and almost immediately you feel the bottom of the hole, only a foot or so down. As you feel around the rough bottom of the hole you find your fingers wrapping around some sort of shaft or handle. [line break][line break]";
	wait for any key;
	if roomDark is true:
		say "You blindly feel around the object. It seems to be some sort of shovel. You grimace, thinking of the skeleton in the corner. Looks like that fellow tried to dig their way out and... well, they didn't make it very far, did they?";
	otherwise:
		say "You hold up what looks to be a small shovel or trowel. You grimace, thinking of the skeleton in the corner. Looks like that fellow tried to dig their way out and... well, they didn't make it very far, did they? [line break]";
	wait for any key;
	now seenShovel is true;
	move the shovel to the Trap Room;
	try taking the shovel;
	
[===SHOVEL===]
The shovel is an undescribed thing. 
Understand "small shovel", "shovel", "small trowel", "trowel" as the shovel.

Instead of taking the shovel:
	say "Nevertheless, you tuck the shovel into your belt.";
	now the player carries the shovel.
	
Instead of examining the shovel:
	if the player is carrying the shovel:
		now the description of the shovel is "The shovel is tucked tightly in your belt. Despite the rust and grime it still seems to be an effective tool.";
		continue the action;
	otherwise:
		if seenShovel is true:
			if roomDark is true:
				say "Though you can't see the shovel, you know it's out there somewhere.";
			otherwise:
				if player carries torch:
					say "The shovel lies abandoned on the floor, submerged in water but still visible by torchlight. It's rusty and grimy but still seems to be an effective tool.";
				otherwise:
					say "You can't see much without your trusty torch.";
		otherwise:
			say "You can't see any such thing.";
			
		
[===GLIMMER===]
The glimmer is an undescribed enterable container.
Understand "light", "sliver", "sliver of light", "source of light", "dim light", "glimmer of hope", "brick", "bricks", "tunnel", "opening", "small opening", "speck", "glimmer of light", "illuminant speck", "dirt", "stone", "dirt and stone" as glimmer.
The description of the glimmer is "In the pitch darkness, a glimmer of hope peeks through the folds of a few bricks in the wall. You reach up and scrape at the bricks with your fingers but you don't quite have the strength to pry apart the bricks.";

[ENTERING]
Instead of entering the glimmer in the trap room:
	if glimmerPried is false:
		say "The thin sliver of light peeks through narrow gaps in the bricks of the wall. There's no way you could fit through there!";
	else if glimmerDug is false:
		say "Even with the bricks removed, the opening is simply to small for you to fit through.";
	else:
		move the player to Golden Room;
[EXAMINING]
Instead of examining the glimmer in the trap room:
	if the glimmer is not in the trap room:
		say "There is no such thing.";
	otherwise:
		if roomFlooded is true:
			if glimmerPried is false:
				now the description of the glimmer is "In the hopeless pitch black abyss of water, a glimmer of hope peeks through the folds of a few bricks in the wall. You scrape at the bricks with your fingers but you don't quite have the strength to pry apart the bricks.";
			else if glimmerDug is false:
				now the description of the glimmer is "You have made the glimmer into a beacon of hope by prying away a few bricks. However, the narrow tunnel of dense earth isn't large enough for you to fit through and your fingers aren't capable of digging the tightly packed dirt and stone around the small opening.";
			else:
				now the description of the glimmer is "You have dug a hole large enough for you to fit through! Gorgeous, radiant light pours onto your face as you scramble towards the exit. You are ignorant of pain as you grab and pull and scrape your way towards freedom. All you see is radiant light and you're so close you can... almost--[line break]";
				try entering the glimmer;
		else:
			now the description of the glimmer is "In the pitch darkness, a glimmer of hope peeks through the folds of a few bricks in the wall. You reach up and scrape at the bricks with your fingers but you don't quite have the strength to pry apart the bricks.";
		continue the action;

[PRYING]
Instead of prying in the trap room:
	[NOT PRIED, NOT DUG]
	if glimmerPried is false:
		if the noun is the glimmer:
			if the second noun is the bone:
				say "You desperately shove the bone in the gap between the bricks where the glimmer shines. You brace yourself against the ceiling, grasping for purchase on the wall as you pull the bone to the side, trying to pry the bricks from the wall. You feel the bricks come loose suddenly and as the dust and debris clears you see you've made the hole larger, a beacon of light now streaming into the dark trap room.[line break][line break]";
				wait for any key;
				say "However, a narrow tunnel of tightly packed earth still stands between you and the light source. You claw desperately at the opening but your weak fingers are not strong enough to dig at such dense dirt and stone.";
				now glimmerPried is true;
			else if the second noun is the torch:
				say "You desperately shove your trusty torch in the gap between the bricks where the glimmer shines. You brace yourself against the ceiling, grasping for purchase on the wall as you pull the torch to the side, trying to pry the bricks from the wall. You feel the bricks come loose suddenly and as the dust and debris clears you see you've made the hole larger, a beacon of light now streaming into the dark trap room.[line break]";
				wait for any key;
				say "However, a narrow tunnel of tightly packed earth still stands between you and the light source. You claw desperately at the opening but your weak fingers are not strong enough to dig at such dense dirt and stone.";
				now glimmerPried is true;
			else if the second noun is the shovel:
				say "You desperately try to find good leverage to pry off the bricks with the shovel. Unfortunately, the shovel is a bit too short to effectively pry off the bricks.";
			else:
				say "You can't effectively pry with that.";
		otherwise:
			say "You can't pry that.";
	[PRIED NOT DUG]
	else if glimmerDug is false:
		if the noun is the glimmer:
			if the second noun is the shovel:
				say "You tear the shovel from your belt and start digging frantically at the tightly packed earth. It feels like an eternity but eventually the hole is large enough for you to fit through. Gorgeous, radiant light pours onto your face as you scramble towards the exit. You are ignorant of pain as you grab and pull and scrape your way towards freedom. All you see is blinding light and you're so close you can... almost--[line break]";
				now glimmerDug is true;
				try entering the glimmer;
			otherwise:
				say "You can't effectively dig with that.";
		otherwise:
			say "You can't dig that.";
	[DUG AND PRIED]
	else:
		say "You have dug a hole large enough for you to fit through! Gorgeous, radiant light pours onto your face as you scramble towards the exit. You are ignorant of pain as you grab and pull and scrape your way towards freedom. All you see is radiant light and you're so close you can... almost--[line break]";
		try entering the glimmer;

[===LOOKING IN TRAP ROOM===]
Instead of looking in Trap Room:
	[IN THE CHUTE]
	if wasInChute is true:
		now the description of the Trap Room is "For a moment, the shock to your body blinds you and scatters your thoughts. Then, after a few moments you regain your faculties and look around. [line break][line break]You see, in what you assume is the far corner of the room, a dim sliver of light. For a moment you think it's your [torch]... But it couldn't possibly! You're under water! It must be some sort of opening. It's clearly a sliver of light shining through a crack between two bricks.";
		now wasInChute is false;
	[NOT IN CHUTE]	
	otherwise:
		[NOT BEEN IN ROOM]
		if arrivedInRoom is false:
			now the description of the Trap Room is "[italic type] WHAM! [roman type]--you tumble out of the chute and skid to an uncomfortable stop. For a second you just lie there in the pitch darkness. Then-- [italic type]tink, tink... TINK![roman type] --a warm orange glow illuminates the mouth of the chute and then like a bullet from a gun, your [torch] comes bouncing out of the hole, skittering to a stop just a few feet away from you.";
			now arrivedInRoom is true;
		[BEEN IN ROOM]
		otherwise:
			[IS ROOM FILLING W WATER?]
			if waterFilling is true:
				[ROOM LIGHT?]
				if roomDark is false:
					[CHECK CARRYING TORCH]
					if player is carrying torch:
						now the description of the Trap Room is "You hold your torch aloft, illuminating the small room. The porous bricks that make up the [walls] and [floor] have a putrid sheen to them, looking to be perpetually moist. Forming a macabre pile in the far corner are the decayed remains of an adventurer, now nothing but a [skeleton]. A few feet away from the skeleton is a small [hole], mostly filled with water. [line break][line break]There does not immediately appear to be an exit. Just solid walls all around with only one exception: to the north and up about 7 feet is the chute from whence you came.";
					otherwise:
						now the description of the Trap Room is "You can't see much without your [torch]!";
					[CHECK WATER LEVEL]
					if waterLevel is less than 4:
						say "[line break]The water level continues to rise but thankfully you're still able to move freely.";
					else if waterLevel is less than 7:
						say "[line break]The water level continues to rise. You struggle to wade about.";
				[ROOM DARK?]
				else if roomDark is true:
					now the description of the Trap Room is "Now that the [torch] has been extinguished, you can't see anything but you can remember that there were some things nearby. You try to focus your mind and remember where everything is. There's the [skeleton]... The [chute]... Wasn't there a [hole]?[line break][line break] Hold on... At first you think its your imagination but you actually see a glimmer of light in the darkness. A dim, illuminant speck that calls to you hopefully. ";
			otherwise:
				now the description of the Trap Room is "You see your [torch] sputtering in the shallow puddles on the floor! Better go pick it up, you can't see much otherwise.";
	continue the action;
			
[===THINKING IN TRAP ROOM===]
Instead of thinking in Trap Room:
	if waterFilling is true:
		say "Oh Gods... The room is filling with water! It's hard to think straight when your life is on the line! Maybe look around? Pick stuff up? Put stuff down? Look what you've done: Now I'm panicking too!";
	otherwise:
		say "Damn... You can't believe that you got yourself separated from the party... [italic type]again[roman type]! Last time you were able to get yourself out of it though... Oh, who are you kidding. Last time they saved you. Maybe they'll rescue you again?";

[===TORCH===]
[EXAMINING]
Instead of examining torch in the Trap Room:
	if player is not carrying torch:
		if roomDark is true:
			say "Your trusty torch lies somewhere in the black abyss of the encroaching water. You think you remember where you dropped it so you'd probably be able to dive for it.";
		otherwise:		
			say "Your trusty torch lies on its side. The flames dance and sputter as they contact with the ground which seems to be covered in small puddles of water. It warms your heart that it followed you down here... but you can't help but feel a bit guilty: It is your fault that the torch is in this mess to begin with.";
	otherwise:
		say "The torch feels good in your hand. In spite of the dangerous situation that you're in... you're happy to have your trusty torch with you. ";

[TAKING]
Instead of taking torch in the Trap Room:
	if the player carries the torch:
		say "You are already carrying your trusty torch!";
	otherwise:
		now the player carries the torch;
		if droppedTorch is false:
			say "You wearily bend over, feeling the bruises from your bumpy travel down that accursed chute. You take the torch and hear a-- [italic type]CLICK![roman type] --followed by the sound of grinding gears and running water. You look down at your feet in horror and see that the puddles of water are expanding... The room is filling with water!";
			wait for any key;
			say "[line break]You quickly wave your torch about, trying to take in your surroundings. The porous bricks that make up the [walls] and [floor] have a putrid sheen to them, looking to be perpetually moist. Forming a macabre pile in the far corner there are the decayed remains of an adventurer, now nothing but a [skeleton]. A few feet away from the skeleton is a small [hole], mostly filled with water.";
			wait for any key;
			say "[line break]There does not immediately appear to be an exit. Just solid walls all around with only one exception: to the north and up about 7 feet is the chute from whence you came.";
			now waterFilling is true;
		otherwise:
			say "You pick up your trusty torch.";

[DROPPING]
Instead of dropping torch in the Trap Room:
	now the torch is in the Trap Room;
	if waterLevel is less than 3:
		say "You drop your trusty torch. It clatters to the ground, sputtering in the puddles at your feet.";
		now droppedTorch is true;
	else if waterLevel is greater than 2:
		say "You release your trusty torch, it hisses as it makes contact with the water, and then the room is plunged into pitch darkness.";
		now roomDark is true;
		now droppedTorch is true;

[=====================WATER LEVEL, ACTION ECONOMY, AND FILLING MECHANIC=====================]
Every turn when waterFilling is true and the player is in the Trap Room:
	[RAISE ACTION ECONOMY]
	now actionEconomy is actionEconomy + 1;
	[EXTINGUISH TORCH IF NOT ALREADY ONCE AT LEVEL 7]
	if waterLevel is greater than 7:
		if roomDark is false:
			say "As the water level begins to exceed your height, you accidentally dip the torch into the murky waters and-- [italic type]HISS...[roman type] --the room is plunged into pitch darkness as the torch is extinguished. [line break][line break]";
			now roomDark is true;
	[EXTINGUISH TORCH IF ON FLOOR AND AT LEVEL 2 OR HIGHER]
	else if waterLevel is greater than 1:
		if the player does not carry torch:
			if roomDark is false:
				say "You hear a resounding hiss as your torch is extinguished by the rising water level. You probably shouldn't have put that down... The room is plunged into pitch darkness. [line break][line break]";
				now roomDark is true;
	[CHECK WATER LEVEL]
	if waterLevel is 0:
		say "The water hasn't passed the soles of your boots yet. It's still quite low.";
	else if waterLevel is 1:
		say "The water has passed the soles of your boots... The level is certainly rising...";
	else if waterLevel is 2:
		say "Your boots are now fully submerged and, let's be honest, you're starting to panic.";
	else if waterLevel is 3:
		say "The water passes the midpoint of your shins. You're trying to take deep breaths.";
	else if waterLevel is 4:
		say "The water passes your knees. OK... You really gotta lock in here.";
	else if waterLevel is 5:
		say "The water passes your waist. Mobility is restricted and things are now even more serious than they were before.";
	else if waterLevel is 6:
		say "The water passes your chest. The cold grip of the water seizes your chest. It doesn't feel good.";
	else if waterLevel is 7:
		say "You are now treading water. Your thoughts are jumbled as you gasp for air.";
	else if waterLevel is 8:
		say "The top of your head presses against the ceiling. It feels hopeless and oppressive.";
	else if waterLevel is 9:
		say "You are forced underwater. Your mind skips around your whole history. Is this what they meant when they said your life would flash before your eyes? Sheer panic and scattered thoughts?";
		now roomFlooded is true;
	else if the waterLevel is greater than 9:
		[IF TWO ACTIONS TAKEN, ADVANCE TURN]
		if actionEconomy is greater than 0:
			[RESET ACTION ECONOMY]
			now actionEconomy is 0;
			if amountBreath is 3:
				say "You feel pain steadily growing within your lungs. But you still have some time.";
			else if amountBreath is 2:
				say "Your lungs scream for air.";
			else if amountBreath is 1:
				say "The icy water strangles you. You feel your thoughts scatter... You need air immediately or you'll die.";
			else if amountBreath is less than 1:
				end the story saying "The cold, dark water suffocates you. You feel your mind clawing at consciousness as you fight the desperate urge to take a deep breath in. You open your mouth but feel nothing but the frigid grasp of death slowly coiling its bony fingers around your chest... You hear a distant thudding. Has someone come to rescue you? Or is that the last... few beats... of your dying heart?";
			now amountBreath is amountBreath - 1;
	[RAISE WATER LEVEL]
	now the waterLevel is the waterLevel + 1;
	[BRING GLIMMER INTO ROOM]
	if roomDark is true:
		if hasSpawnedGlimmer is false:
			move glimmer to Trap Room;
			now hasSpawnedGlimmer is true;
			

[=====================TREASURE ROOM AND ENDING=====================]
The Golden Room is a room. 
The description of the Golden Room is "[if visited] You bask in the glory of the countless treasures all around you. Sconces radiating golden light encircle the room. The giant stone door seems to be your only exit. Next to the stone door is a single metal lever. [otherwise] You are surrounded by treasure: ornate chests, piles of gold coin, loose jewelry and gems... If your eyes could become dollar signs, it would be happening right now. Other than the immense riches, sconces crackling with arcane fire line the walls, providing the radiant gold light.  [line break][line break] You look frantically for an exit and your heart sinks... It looks as if the only exits are either back the way you came: [italic type]NO[roman type]. Or a behemoth stone door with no visible handle. Next to the stone door is a metal lever... please, let it be that easy."

Before looking in the Golden Room:
	say "[if visited][otherwise][italic type]GASP![roman type] --you emerge into a well lit, unflooded room, shoving aside a cracked tile to pour yourself onto the floor. You just lie there for a few minutes, staring at the golden ceiling and the sconces crackling with arcane fire. As you come to terms with still being alive you look around the room.";

[===TREASURE===]
The treasure is scenery in the Golden Room. 
The description of the treasure is "You are overwhelmed by the sheer amount of treasure in the room. It's so brilliant and golden that you have to narrow your eyes. There are countless coins, jewels, gems, and artifacts all around you."

The handfuls_of_treasure is a thing.
The printed name of handfuls_of_treasure is "lot of treasure".

Instead of taking the treasure:
	if the player carries the handfuls_of_treasure:
		say "You try to cram more gold and jewels into your pockets but for every piece of treasure you shove in, a piece of treasure falls to the floor. You're pretty much at max capacity. Props to you for going above and beyond in the greed category though. ";
	otherwise:
		say "You greedily shovel treasures into your pockets, as much as you can carry.";
		now the player carries the handfuls_of_treasure;

Instead of dropping handfuls_of_treasure:
	say "Woah, woah, woah. You almost died for this treasure! You're not dropping it!";

Instead of dropping the treasure:
	say "Woah, woah, woah. You almost died for this treasure! You're not dropping it!";
	
[===DOOR===]
The stone door is scenery in the Golden Room.
Understand "behemoth stone door", "behemoth door", "door" as stone door.
The description of the stone door is "The behemoth stone door is almost 10 feet tall, looming above you. Ornate patterns are carved into the door but otherwise it is quite plain."

[===LEVER===]
The lever is scenery in the Golden Room.
Understand "metal lever", "lever" as lever.
The description of the lever is "The small lever is embedded in the wall next to the stone door at about chest height. It is currently resting in the up position and looks ripe for pulling."

Instead of pulling the lever:
	say "You pull the lever and are greeted with the sweet symphony of grinding stone! You're free! Actually free!";
	end the story saying "Much to your surprise and theirs, the door opens and you are then face to face with your party. It seems as if they had been attempting to gain access to this treasure room. And as luck would have it, they happened to have an agent on the inside![line break][line break]Your party is so thrilled to have access to all of this treasure they forget to reprimand you for getting lost. And you're so thrilled to be alive and rich that you forget to be peeved that they left you behind and were looking to break into a treasure room instead of looking for you.[line break][line break]You feel the warmth and comfort of being reunited with your party. Unadulterated joy courses through you as you are congratulated with a series of shoulder and back pats. You make a silent promise to yourself to never get separated again.[line break][line break]Just another day in the dungeon. Dungeon delving. Oh, dungeon delving.";

[===RELEASE===]
Release along with an interpreter and cover art.

[===DEBUG===]
Test me with "n / e / take torch / x hole / search hole / x skeleton / take bone / wait / drop torch / wait / wait / wait / enter chute".
