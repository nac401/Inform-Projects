"Lesson5_10925" by nico ailani carlson

Include Simple Chat by Mark Tilford

[THE PUB]
The Pub is a room. "The pub is cramped but empty. You are the sole proprietor sitting at the bar though there are a few other patrons milling about in the booths.[paragraph break][barkeep] polishes a stein and glowers."

[TALKING TO]
Talking to is an action applying to one visible thing.

Understand "talk to [someone]" as talking to.
Report talking to: say "You have nothing to say.".

[- a person]
The Barkeep is a person in the Pub.
The printed name of Barkeep is "The [bold type]barkeep[roman type]".

hello-barkeep is a chat node.
Report giving text for hello-barkeep:
	instead say "The barkeep grunts, acknowledging you but otherwise continuing his studious work of polishing."
Carry out finding responses to hello-barkeep:
	link to have-a-drink.

Instead of talking to barkeep:
	run a conversation from hello-barkeep.
	
[have a drink node]
have-a-drink is a chat node.
Report giving link to have-a-drink: instead say "'I'll have a drink.'".
Report giving text for have-a-drink: instead say "'Whaddaya want'?".
Carry out finding responses to have-a-drink: link to have-beer; link to have-whiskey.


[have beer/whiskey nodes]
have-beer, have-whiskey are chat nodes.

The whiskey is a thing. The beer is a thing.

Report giving link to have-whiskey: instead say "'Whiskey.'".
Report giving link to have-beer: instead say "'Beer.'".

drink-response is text that varies. drink-response is "'Mmhm.'[paragraph break]And with perfect ease, the barkeep slides your drink across the bar. What service.".

Report giving text for have-whiskey:
	now the player has the whiskey;
	instead say "[drink-response]".
	
Report giving text for have-beer: 
	now the player has the beer;
	instead say "[drink-response]".
	
[creating some area around the pub]
Outside Pub is south of the Pub.
11th-5th is east of Outside Pub.
11th-Broadway is east of 11th-5th.
11th-4th is east of 11th-Broadway.
11th-3rd is east of 11th-4th.

[making three different types of moving NPCs]
The Wanderer is a person in 11th-3rd.
The Stranger is a person in 11th-3rd.
The Follower is a person in the Pub.

Every turn:
	[wanderer]
	let dir be a random direction;
	try Wanderer going dir;
	[stranger]
	if the location of Stranger is not the Pub:
		let way be the best route from the location of Stranger to the Pub;
		try Stranger going way;
	[follower]
	if the location of Follower is not the location of the player:
		let way be the best route from the location of Follower to the location of player;
		try Follower going way;
		

The initial appearance of the Follower is "[follower-description]".

To say follower-description:
	if the player is in the Pub:
		say "In the far corner of the Pub is a sketchy figure. You think they might be eyeing you.";
	else:
		say "You see a familiar sketchy figure... They might be following you.";
		
The describe room gone into rule response (F) is "Someone arrives".

After the Follower going:
	if the room gone to is the location of the player:
		say "The follower follows you.";
		continue the action;


