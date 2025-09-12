"lesson2_office" by nico ailani carlson

Chapter 1 - The Office

[THE OFFICE]
The Investigator's Office is a room. "A picturesque PI's office. Venetian blinds, a dense cloud of cigar smoke settled at eye level, and a desk that is littered with litter with a chair standing beside. On the desk is not two, not three, but one opened bottle of whiskey and a single apple. [line break][line break] Along the one windowless wall stands a bookshelf with a portrait beside it. [line break][line break] To the [bold type]north[roman type] is the only door, it leads out to the [bold type]hallway[roman type]."

[--- THE DESK]
The desk is a scenery supporter in the Investigator's Office.

[--- THE CHAIR]
The chair is an enterable scenery supporter in the Investigator's Office.
The description is "The chair is one of those old fashioned leather rollers. Best of all, you can sit on it."

After entering the chair:
	say "You sit down with a great sigh. It reminds you of the way your father used to sit down in a way that makes you deeply uncomfortable.";

[------ THE WHISKEY]
The whiskey is an undescribed closed openable container on the desk. The description is "Glimmering in the bottom of the bottle is about 12 ounces of whiskey. By your calculations, that's about one swig if you dream big enough."
Understand "bottle", "whiskey bottle", "sweet golden liquid", "liquor", "alcohol", and "uisge" as the whiskey.
The printed name of whiskey is "bottle of whiskey".

whiskey_level is a number that varies. whiskey_level is 10.

Instead of drinking the whiskey: 
	if a random chance of 1 in 100 succeeds:
		end the story saying "Oh no, alcohol poisoning.";
	if whiskey_level is 0:
		say "[one of]No more whiskey.[or]No whiskey! What the heck![or] No.[at random]";
	otherwise:
		say "You drink the whiskey.";
		decrease whiskey_level by 1;
	
Caressing is an action applying to one thing. Understand "caress [something]", "fondle [something]", "touch [something]" as caressing.
A thing can be uncaressable, good-to-touch, or rough-and-gross.
A thing is usually rough-and-gross.

Check caressing:
	if noun is good-to-touch:
		say "Mmm... That feels nice!";
	else if noun is uncaressable:
		say "You can't touch that, you fiend!";
	otherwise:
		say "Yuck. That's rough and gross.".
		
The whiskey is good-to-touch.

[--- LOOKING QOL]
Understand "look around" as looking.

[------ THE APPLE]
The apple is an edible undescribed thing on the desk. The description is "An apple. It is a captivating shade of red. Like blood or lipstick or an apple."

[--- THE BOOKSHELF]
The bookshelf is an  undescribed fixed in place open container in the Investigator's Office. 
The description of the bookshelf is "Roughly a dozen books are spaced out across the 5 shelves of the bookshelf. Upon closer inspection, one of them is a dictionary and three of them look to be motel bibles."

[------ BOOKS]
Some books are in the bookshelf. The indefinite article of the books is "a few".

[--- THE PORTRAIT]
The portrait is scenery in the Investigator's Office. 
The description of the portrait is "[if examined] You look at the portrait again. You are oh, so handsome. [else] You squint up at the portrait. Ah, it's you! Victor Sharpe. Private investigator and aspiring novelist. On display is your curled mustache; dark, sunken eyes; and deep crows feet from all of the squinting you do."


[---]

[THE HALLWAY]
The Hallway [is a room that] is north of the Investigator's Office. "A drab hallway. The paint is peeling from the walls and the floor creaks beneath your feet. To the east the elevator doors are open, waiting for you to enter as if by fate. To the north is the stairwell, enemy of your weak calves and smoke drenched lungs.".

The elevator-exterior is scenery in the Hallway. The description is "The shoddy elevator to this decrepit building.". Understand "elevator" as elevator-exterior.

The player is in the Elevator.

Instead of entering the elevator-exterior:
	move the player to the Elevator.
	
Instead of exiting in the Elevator:
	try going west.

[--- DOOR]
The rickety door is north of the Hallway and south of the Stairs. The rickety door is a door. The rickety door is scenery. The rickety door is lockable and locked. The old key unlocks the rickety door.
Understand "old door" as rickety door.
The description of the rickety door is "The old steel door that leads to the stairwell. [if rickety door is locked] It creak and groans when you test the handle but it is steadfastly locked. [else] It grinds against the floor with a nasty grating sound but opens nonetheless, all you have to do is step through the doorway."

Before going through the rickety door:
	if the rickety door is closed and the rickety door is locked:
		if the player carries the old key:
			say "(first unlocking the rickety door with the old key, then opening the door)";
			now the rickety door is unlocked;
			now the rickety door is open;
		else:
			say "(first attempting to unlock the door, but you have nothing to unlock it with)";
			say "[line break]The door is locked and you do not have the means to open it.";
			stop the action.
			
The old key is an undescribed thing. The old key is in the bookshelf.

The description of the books is "You look through the books. [if old key is in the bookshelf] You notice that between two of the old books is an old key. Huh. What's that doing there?".

[---]

[THE ELEVATOR]
The Elevator is east of the Hallway. "The elevator groans as you climb aboard. It is just as out-of-order as it has been for the past three years that you've been leasing this office. Did I forget to mention that?"

[---]

[THE STAIRS]
The Stairs is a room.
The printed name of the Stairs is "Stairwell".
The description of the Stairs is "The stairwell is musty, hot, and humid. You already feel your asthma acting up."

After going to the Stairs:
	say "You enter into the stairwell. You take a deep, ragged breath. Your body has already begun to ache in anticipation of your going down the stairs.";
	continue the action;
	
After looking in the Stairs:
	end the story saying "You go down the stairs. On to another adventure. Another mystery.";
	
[EXAMINED]
A thing can be examined or unexamined.
A thing is usually unexamined.

Carry out examining:
	now the noun is examined;
	
[EVERY TURN]
Every turn:
	if the player is in the Hallway:
		if a random chance of 1 in 2 succeeds:
			say "[one of]A fly flies past your ear. You swat at it![or]A fly buzzes around your face. You swat at it.[or]There is a fly! It strikes up a stirring conversation with you before flying away.[at random]";