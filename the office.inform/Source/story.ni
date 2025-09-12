"the office" by nico ailani carlson

Chapter 1 - The Office

[VARIABLES ----]
room_prefix is text that varies. 
room_prefix is "INT. Decrepit Building - ".

[ROOM - THE OFFICE]
The office is a room. "A picturesque PI's office. Venetian blinds, a dense cloud of cigar smoke settled at eye level, and a desk that is littered with litter with a chair standing beside.[if visited] You've been here before."
The printed name of the office is "[room_prefix]The Investigator's Office".


[OBJECT - THE DESK]
The desk is a scenery supporter in the office.  The description of the desk is "[if unexamined]Wow! What a beautiful and ornate desk! [else]It's a desk.".

[OBJECT - THE CHAIR]
The chair is an enterable supporter in the office.
The description is "The chair is one of those old fashioned leather rollers. Best of all, you can sit on it."

[OBJECT - WHISKEY]
The whiskey is an closed openable container on the desk.
The description of the whiskey is "Glimmering in the bottom of the bottle is about 12 ounces of whiskey. By your calculations, that's about one swig if you dream big enough."
The printed name of whiskey is "bottle of whiskey".
Understand "bottle", "bottle of whiskey" as whiskey.

[OBJECT - APPLE]
The apple is an edible thing on the desk. The description is "An apple. It is a captivating shade of red. Like blood or lipstick... or an apple."

[BOOKSHELF AND BOOKS]
The bookshelf is a open fixed in place container in the office.
Some books are a fixed in place thing.
Some books are in the bookshelf. The indefinite article of the books is "a few".

[THE HALLWAY]
The Hallway is north of the office.

[THE ELEVATOR]
The Elevator is east of the Hallway.

[THE STAIRS]
The Stairs is north of the Hallway.
The printed name of the Stairs is "Stairwell".

Before going to the Stairs:
	say "Oh! I'm about to go to the stairs!";
	
Instead of going to the Stairs:
	say "I'm not going to the stairs! I'm doing this instead!";
	continue the action.

After going to the Stairs:
	say "I've gone to the stairs!";
	
The whiskey can be full, half, or empty.
The whiskey is full.

A thing can be examined or unexamined.
A thing is usually unexamined.

Carry out examining:
	now the noun is examined;

Before drinking the whiskey:
	if the whiskey is empty:
		say "Oh no! It's empty!";
	say "Yum!";
	now the whiskey is empty;
	


