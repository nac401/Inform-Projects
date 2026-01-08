"The PI's Conversation" by nico ailani carlson

Include Simple Chat by Mark Tilford

Chapter 3 - The Conversation

[------------------------------ LESSON 5 ------------------------------]

[THE PUB]
The Pub is a room. "The pub is cramped but empty. You are the sole proprietor sitting at the bar though there are a few other patrons milling about in the booths.[paragraph break][barkeep] polishes a stein and glowers."

[TALKING TO]
Talking to is an action applying to one visible thing.

Understand "talk to [someone]" as talking to.
Report talking to: say "You have nothing to say.".

[CHAT WITH BARKEEP]

[each conversation requires 3 things: ]
[- a person]
The Barkeep is a person in the Pub.
The printed name of Barkeep is "The [bold type]barkeep[roman type]".
[- a chat node (ideally more than one)]
hello-barkeep is a chat node.
Report giving text for hello-barkeep: instead say "The barkeep grunts, acknowledging you but otherwise continuing his studious work of polishing."
Carry out finding responses to hello-barkeep: link to have-a-drink.
[- and an introduction]
Instead of talking to barkeep: run a conversation from hello-barkeep.

[each chat node can have 3 things: ]
[- a definition ]
have-a-drink is a chat node.
[- link text (the text that is printed when the node can be triggered)]
Report giving link to have-a-drink: instead say "'I'll have a drink.' ".
[- given text (the text that is printed when the node is triggered)]
Report giving text for have-a-drink: instead say "'Whaddaya want?'".
Carry out finding responses to have-a-drink: link to have-beer; link to have-whiskey.
[- responses (nodes that are available after the node is triggered)]

[can batch node creation]
have-you-heard, what-your-name are chat nodes.

have-beer, have-whiskey are chat nodes.
[take note of the space after the ' and before the ", that is so that it doesn't new line]
Report giving link to have-whiskey: instead say "'Whiskey.' ".
Report giving link to have-beer: instead say "'Lager.' ".

[establish items]
The whiskey is a thing. The beer is a thing.

[a slightly more readable, same response, that does things other than just talk]
drink-response is text that varies. drink-response is "'Mmhm.'[paragraph break]And with perfect ease, the barkeep slides your drink across the bar. What service.".
[note that the "instead say" occurs LAST. if first it will overwrite following actions]
[give text and whiskey]
Report giving text for have-whiskey: 
	now the player has the whiskey;
	instead say "[drink-response]".
[give text and beer]
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
	[the wanderer wanders]
	let dir be a random direction;
	try Wanderer going dir;
	[the stranger goes to the pub]
	if the location of Stranger is not the Pub:
		let way be the best route from the location of Stranger to the pub;
		try Stranger going way;
	[the follower follows]
	if the location of Follower is not the location of the player:
		let way be the best route from the location of Follower to the location of player;
		try Follower going way;

The initial appearance of the Follower is "[follower-description]".
To say follower-description:
	if the player is in the Pub:
		say "In the far corner of the pub is a figure in a trench coat. You think they might be eyeing you.";
	else:
		say "You see a familiar figure in a trench coat... They might be following you.";
		
[OVERWRITE DEFAULT TEXT]
[this is a valid way to change all rule responses for moving]
[keep in mind there are rule responses from A - S]
[The describe room gone into rule response (F) is "Someone arrives".]

[also valid is to just overwrite the rule per NPC]	
After the Follower going when the room gone to is the location of the player:
	say "The follower follows you.".