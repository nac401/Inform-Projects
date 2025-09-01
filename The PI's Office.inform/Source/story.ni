"The PI" by nico ailani carlson

Chapter 1 - The Office

[----------------------------------------------------------- LESSON 1 -----------------------------------------------------------]

[THE OFFICE]
[your first room! congratulations!]
The Investigator's Office is a room. "A picturesque PI's office. Venetian blinds, a dense cloud of cigar smoke settled at eye level, and a desk that is littered with litter with a chair standing beside. On the desk is not two, not three, but one opened bottle of whiskey and a single apple. [if visited] Oh! And there's a door to the north that leads to a hallway."

[--- THE DESK]
[supporter: an object that can support other objects]
[scenery: a non-interactable decoration in the room]
[notice how scenery is not mentioned or described by the parser like non-scenery objects are]
The desk is a scenery supporter in the Investigator's Office.

[--- THE CHAIR]
[enterable: that's right. you can enter this one]
The chair is an enterable supporter in the Investigator's Office.
The description is "The chair is one of those old fashioned leather rollers. Best of all, you can sit on it."

[after: this keyword is used to trigger events after specific actions]
After entering the chair:
	say "You sit down with a great sigh. It reminds you of the way your father used to sit down in a way that makes you deeply uncomfortable.";
	[notice the syntax within these conditionals, they are not full sentences but a continuation]

[------ THE WHISKEY]
[undescribed: something with this trait is not detailed by the parser, which leaves it up to you!]
The whiskey is an [undescribed] closed openable container on the desk. The description is "Glimmering in the bottom of the bottle is about 12 ounces of whiskey. By your calculations, that's about one swig if you dream big enough."
[understanding: synonyms and references to objects]
Understand "bottle", "whiskey bottle", "sweet golden liquid", "liquor", "alcohol", and "uisge" as the whiskey.
[printed names: what inform will call your object]
The printed name of whiskey is "bottle of whiskey".

[you can also understand actions to allow for synonyms]
Understand "look around" as looking.

[------ THE APPLE]
The apple is an edible thing on the desk. The description is "An apple. It is a captivating shade of red. Like blood or lipstick or an apple."

[--- THE BOOKSHELF]
[fixed in place: something that is-- you guessed it --fixed in place (not moveable or takeable)]
[we haven't declared anything as fixed in place so... what is fixed in place by default? Is this bookshelf?]
The bookshelf is an open container in the Investigator's Office. [The bookshelf is fixed in place.]
The description of the bookshelf is "Roughly a dozen books are spaced out across the 5 shelves of the bookshelf. Upon closer inspection, one of them is a dictionary and three of them look to be motel bibles."

[------ BOOKS]
Some books are in the bookshelf. The indefinite article of the books is "a few".

[--- THE PORTRAIT]
[how will the player know that this object is examinable?]
The portrait is scenery in the Investigator's Office. 
The description is "You squint up at the portrait. Ah, it's you! Victor Sharpe. Private investigator and aspiring novelist. On display is your curled mustache; dark, sunken eyes; and deep crows feet from all of the squinting you do.".

[THE HALLWAY]
[notice this difference in syntax and what changes when we include the comment below]
The Hallway [is a room that] is north of the Investigator's Office. "A drab hallway. The paint is peeling from the walls and the floor creaks beneath your feet. To the east the elevator doors are open, waiting for you to enter as if by fate. To the north is the stairwell, enemy of your weak calves and smoke drenched lungs.".
[the answer: that the connection between rooms does not go both ways!]

[---]

[THE ELEVATOR]
The Elevator is east of the Hallway. "The elevator groans as you climb aboard. It is just as out-of-order as it has been for the past three years that you've been leasing this office. Did I forget to mention that?"

[---]

[THE STAIRS]
The Stairs is north of the Hallway.
The printed name of the Stairs is "Stairwell".

[this overwrites the typical behavior that is triggered after going to a room]
After going to the Stairs:
	say "You enter into the stairwell. You take a deep, ragged breath. Your body has already begun to ache in anticipation of your going down the stairs.";
	[continue the action;]
	end the story saying "You go down the stairs. On to another adventure. Another mystery.";
[try swapping "continue the action" above with the "end the story...", notice what changes]
[the answer: 'After going to' takes place before the room or description is printed.]

[----------------------------------------------------------- LESSON 2 -----------------------------------------------------------]
[
[------ THE WHISKEY, IN THE OFFICE]
[instead: example #1, using it to define a "new action"]
Instead of drinking the whiskey:
	if whiskey is closed:
		say "You gnaw for a few seconds, absentmindedly at the closed cap on the whiskey bottle. You may have missed a critical step here.";
	else:
		say "You drink the whiskey. And just as you drew it up, you drink the remaining whiskey (half of the bottle) in one swig.";

[creating an examinable bit of scenery that points to another room]
The elevator-exterior is scenery in the Hallway. The description is "The shoddy elevator to this decrepit building. It's doors are open, waiting for you to enter." Understand "elevator" as elevator-exterior.

[instead: example #2, using it to facilitate player action]		
Instead of entering the elevator-exterior:
	try going east;
	
[THE HALLWAY, REVISED]
The Hallway is north of the Investigator's Office. "A drab hallway. The paint is peeling from the walls and the floor creaks beneath your feet. To the east the elevator doors are open, waiting for you to enter as if by fate. To the north is an old, rickety door that you know leads to the stairwell, enemy of your weak calves and smoke drenched lungs.".
	
[THE STAIRS, REVISED]
The Stairs is a room. The printed name of the Stairs is "Stairwell". 

[------ OLD KEY]
The old key is an undescribed thing. The old key is in the bookshelf.

[------ BOOKS, REVISED]
The description of books is "You absentmindedly caress the spines of the dusty books, as people do when they see books. You notice that between two of the worn motel bibles there is an old key. Huh. What's that doing there?";

[--- LOCKED DOOR]
The rickety door is north of the Hallway and south of the Stairs. The rickety door is a door. The rickety door is scenery. The rickety door is lockable and locked. The old key unlocks the rickety door.
Understand "door", "old door" as rickety door.
The description of the rickety door is "The old steel door that leads to the stairwell. [if rickety door is locked] It creaks and groans when you test the handle but is steadfastly locked. [else] It grinds against the floor with a nasty grating sound but opens nonetheless, all you have to do is step through the doorway."

[before: happens before you perform the action]
Before going through the rickety door:
	if the rickety door is closed and the rickety door is locked:
		if the player carries the old key:
			say "(first unlocking the rickety door with the old key, then opening the door)";
			now the rickety door is unlocked;
			now the rickety door is open;
		else:
			say "(first attempting to unlock the door, but you have nothing to unlock it with)";
			say "[line break]The door is locked and you do not have the means to open it.";
			stop the action;


[VARIABLES]
Withdrawal_Amount is a number that varies. 

[EVERY TURN, THIS HAPPENS]
Every turn:
	if the player is in the hallway:
		if a random chance of 1 in 2 succeeds:
			say "[one of]A fly flies past your ear. You swat at it but it moves too fast.[or]A fly buzzes around your face. You swat at it but you move too slowly.[at random]";
	Increase Withdrawal_Amount by 1;
	if Withdrawal_Amount is greater than 5:
		end the story saying "Your head splits open. Your thirst for liquor dominating your senses. You cannot go on."
		
[CONDITIONAL VOCABULARY]
A thing can be examined or unexamined.
A thing is usually unexamined.

[carry out: think of it as a "during" insert of an action]
Carry out examining:
	now the noun is examined;
[alongside 'carry out' we also have 'check' (before) and 'report' (after)]
[try out check and report to see how they change the results]

The description of the portrait is "[if examined] You look at the portrait again. You are oh so handsome. [else] You squint up at the portrait. Ah, it's you! Victor Sharpe. Private investigator and aspiring novelist. On display is your curled mustache; dark, sunken eyes; and deep crows feet from all of the squinting you do."

[CARESSING]
[caressing is an action taking 1 noun: I caress something]
[there are two other types of actions in Inform7: intransitive and actions taking 2 nouns]
[intransitive: an action that doesn't have an object (e.g. waiting, sleeping, praying)]
[2 nouns: an action that uses something on/in/to something else (e.g. putting something in something, using something on something, digging something with something]
Caressing is an action applying to one thing. Understand "caress [something]" as caressing.
A thing can be good-to-touch or rough-and-gross.
A thing is usually rough-and-gross.

[when breaking down an action, we refer to the [something] from before as "the noun"]
[in the case of a 2 noun action, we refer to the first noun and second noun]
Check caressing: 
	if the noun is good-to-touch:
		say "Mmm... That feels nice.";
		decrease Withdrawal_Amount by 3;
	else:
		say "Yuck. That's rough and gross.";
		
The whiskey is good-to-touch.]

Chapter 2 - The Crime Scene

Chapter 3 - The Interrogation