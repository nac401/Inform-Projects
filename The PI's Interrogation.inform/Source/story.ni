"The PI's Interrogation" by nico ailani carlson

Chapter 2 - The Interrogation 

[------------------------------ LESSON 3 ------------------------------]

The Interrogation Room is a room. "[if visited] It's an old, musty room with a few broken brooms in the corner. The perfect interrogation room. Perry, your interrogatee, sits in front of you, looking scared. [else] Yes, this is actually an old storage closet in an abandoned warehouse but to you, it is an interrogation room. Sitting in front of you is Perry, your prime suspect in the case. Perry is 'innocent', according to Perry. Sure, Perry. Isn't everyone?"

[PERRY]	
A person can be scared, angry, or neutral.
A person is usually neutral.
Perry is a man in the Interrogation room. 
The description of Perry is "[if neutral]Perry stares up at you, a strange, peaceful look on his face.[else if scared]Perry winces away from you, obviously frightened.[else if angry]Perry stares up at you defiantly, his jaw firmly set.".

Instead of talking to Perry:
	if Perry is scared:
		say "'I'm sorry! I don't know anything! I swear!'";
	else if Perry is angry:
		say "'You know what? You can go eat dirt!'";
	else if Perry is neutral:
		say "'I don't know... It was just bad luck. I wasn't there for any particular reason!'";

[THE TALK ACTION]
Talking to is an action applying to one visible thing.
Understand "talk to [someone]" as talking to.
Check talking to:
	say "[the noun] doesn't reply.".
		

[RANDOMLY CHANGING PERRY'S EMOTIONS]
Every turn: 
	if a random chance of 1 in 2 succeeds:
		now Perry is neutral;
	else if a random chance of 1 in 3 succeeds:
		now Perry is scared;
	else if a random chance of 1 in 4 succeeds: 
		now Perry is angry;