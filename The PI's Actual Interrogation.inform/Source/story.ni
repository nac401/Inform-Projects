"The PI's Actual Interrogation" by nico ailani carlson

Include Conversation Framework by Eric Eve.
Include Epistemology by Eric Eve.

Chapter 2 - The Interrogation 

[------------------------------ LESSON 4 ------------------------------]

The Interrogation Room is a room. "[if visited] It's an old, musty room with a few broken brooms in the corner. The perfect interrogation room. Perry, your interrogatee, sits in front of you, looking scared. [else]Yes, this is actually an old storage closet in an abandoned warehouse but to you, it is an interrogation room. Sitting in front of you is Perry, your prime suspect in the case. Perry is 'innocent', according to Perry. Sure, Perry. Isn't everyone?"

[PERRY AND PEOPLE]	
Perry is a man in the Interrogation room. 
The description of Perry is "Perry stares up at you with a fairly even mix of anger and fear.".

[GREETING]
[printed text takes place in the AFTER of saying hello]
[so in order to manipulate the text we just have to overwrite the after]
After saying hello to Perry:
	if the greeting type is implicit:
		say "You skip the pleasantries.";
	else if the greeting type is explicit:
		say "You nod to Perry, giving a grunt that somewhat resembles 'hello'. Perry looks up at you, dumbfounded.";
	
[CRIME SCENE]
[a subject since rooms aren't a part of epistemology]
[subjects can be familiar or unfamiliar, they are usually familiar]
The Crime Scene is a subject.
Understand "murder site", "site", "parking  lot", "lot", "parking", "parking garage", "parking structure", "garage" as Crime Scene.

After quizzing Perry about Crime Scene:
	say "You ask Perry about the crime scene, the old parking garage on 11th and 8th.[paragraph break]'What? Like what's going on over there? I know someone was killed there a few days ago. Is that what this is about? Who are you? What am I doing here?!'[paragraph break]You'll ask the questions here Perry. Watch it.";
	
[MURDER WEAPON]
[a thing can be quizzed or told about but remember: it must be known]
Murder Weapon is a [familiar] thing.
Understand "knife", "dagger", "blade", "shiv" as Murder Weapon.

After quizzing Perry about Murder Weapon:
	if the second noun is seen:
		say "You ask Perry about the murder weapon, the beat up old knife that was found at the scene, covered in blood.[paragraph break]'Murder weapon? Knife? I swear to God, Man. I don't know what you're talking about. Are you some kind of cop? Don't I have rights?[paragraph break]Not as a criminal in the US of A, old boy. [italic type]And that's actually true. Modern slavery is a real thing-- right now, in the US prison industrial complex.[roman type]";
	else:
		say "You ask Perry about the murder weapon, though you have no idea what or where it is.[paragraph break]'Murder weapon? What are you talking about? What are you, some kind of cop? Don't I have rights?[paragraph break]Not as a criminal in the US of A, old boy. [italic type]And that's actually true. Modern slavery exists in the US prison industrial complex.[roman type]";
		
[EVIDENCE]
[things can also be seen and unseen]
The Evidence is an familiar unseen thing.
		
After informing Perry about Evidence:
	if the second noun is unseen:
		say "You make up some hairbrained story about evidence... It's not very convincing.[paragraph break]'I don't know what to tell you, Man. I don't know what you're talking about! I wasn't there! I swear!'";
	else:
		say "You ask Perry about the footage that places him at the scene of the crime, only seconds after the murder is estimated to have taken place.[paragraph break]Perry looks up at you and grins maniacally, 'Oh, we've only just begun Inspector.'";
		end the story saying "The lights cut out! There is a brief commotion and then when the lights flicker back on... you are alone.";

[CHANGING RULE RESPONSES]	
The block asking rule response (A) is "You don't know about that, what's the point of asking?".

The block quizzing rule response (A) is "You don't know about that, what's the point of asking?".
	