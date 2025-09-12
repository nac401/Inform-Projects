"Runaway Heist" by Chatworth_G_Petey

The story headline is "A short pulp train-heist".
The story description is "You’ve stolen a mystical artifact from a speeding train. Now the train is out of control—and if you can’t stop it, you’ll never escape with your prize." 

[I think this is default and so it is redundant?]
Use full-length room descriptions.

When play begins:
	say "The artifact is in your hands. The train roars through the night. The job’s gone wrong—the engineer’s dead, the locomotive is out of control, and the artifact won’t mean much if you crash and burn.".

The Moving Train is a region. The Baggage Car, the Passenger Car, the Dining Car, the Locomotive, and the Caboose are in the Moving Train.

The Baggage Car is a room. "Dim light. Crates rattle and clatter as the train barrels forward. The only comfort: the [artifact], clutched in your grip. A door leads forward to the Passenger Car. Behind you, the Caboose sways precariously."

The Passenger Car is north of the Baggage Car. "Rows of torn seats, luggage spilling everywhere. Sparks flicker overhead. The Dining Car is forward."

The Dining Car is north of the Passenger Car. "Shards of glass crunch beneath your boots. A door ahead leads to the Locomotive."

The Locomotive is north of the Dining Car. "Steel walls, gauges shattered, levers jammed. The engineer lies slumped, gone. The only hope is to somehow stop the train."

The Caboose is south of the Baggage Car. "The caboose rattles dangerously. You could leap from here—if only the train weren’t moving so fast."

[---]

The artifact is carried by the player. The description of the artifact is "A crystalline idol that glows faintly with its own inner storm. Worth a fortune, if you live."

[---]

The brake lever is in the Locomotive. The description of the brake lever is "A heavy steel lever, stuck halfway down. It looks like the only way to stop the train." Understand "brakes" or "stop" or "handle" as the brake lever.

[a conditional bit of vocab! we'll learn about this!]
The brake lever can be jammed or freed. The brake lever is jammed.

[some insteads! we'll learn about those]
Instead of pulling the brake lever when the brake lever is jammed:
	say "You strain, but the lever won’t budge. Something’s caught in the gears."

[notice the lack of "The description of the..." here, what does that change when playing?]
The broken panel is an container in the Locomotive. "A maintenance panel hangs open, exposing sparking wires and a nest of gears." The broken panel is open and fixed in place.
[the answer: ]
[the "description" is only printed when the player examines something and overwrites the default description]
[the "initial appearance" (with no preface) is text that appears in a separate paragraph. It will continue to show up until the object is "handled" (picked up by player)]

[because of the nuance described above, can we guess when the description below is printed?]
The piece of metal is in the broken panel. 
The description is "A bent piece of metal is jammed in the gears.".

Instead of taking the piece of metal:
	say "You yank the metal free—it screeches out of the gear teeth.";
	now the piece of metal is carried by the player;
	now the brake lever is freed.

Instead of pulling the brake lever when the brake lever is freed:
	say "With a wrenching pull, the brake lever slams down. The wheels scream, the train screeches to a halt. The artifact hums in your arms—the heist is complete.";
	end the story saying "You’ve stopped the train. Now all that remains is the escape—and the world you’ve left behind."

[---]

[note here about turn count, decreasing a number that should be increasing, and so on]
Every turn when the brake lever is jammed and the player is not in the Caboose:
	say "You have [10 - turn count] turns remaining!";
	if the turn count is 10:
		end the story saying "The train derails in a blaze of steel and fire, taking you and the artifact with it.".


