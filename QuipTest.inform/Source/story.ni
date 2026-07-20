"QuipTest" by nico ailani carlson

The story headline is "An Interactive Revisiting of the phtalkoo.h Test".

Include Quip-Based Conversation by Michael Martin.

Use no scoring and no deprecated features.

Chapter 1 - The Setup

When play begins, say "Joe Schmoe is yor frend!"

Joe Schmoe's Place is a room.  "You are in Joe Schmoe's place."

Joe Schmoe is a man in Joe Schmoe's Place.  The description is "This is Joe. It's yor frend!"  The litany of Joe Schmoe is the Table of Joe Comments.

The greeting of yourself is selftalk.

Casting Xyzzy is an action applying to nothing.  Understand "xyzzy" as casting xyzzy.  Carry out casting xyzzy: deliver the xyzzy quip; run a conversation on the Table of Magic Followups.

Chapter 2 - The Script

Section 1 - The Text

Table of Quip Texts (continued)
quip		quiptext
selftalk		"Talking to yourself is not particularly fun."
who-am-i		"'My name is Joe Schmoe and Inform hates me.'"
why-hate		"'I tried to compile a game and it gave me 40 Problem messages.'"
yay-inform		"'Thanks so much! You're the greatest!'"
hate-you		"'I hate you!'[paragraph break] Joe kills you."
hate-pedants		"'I hate pedants!'[paragraph break] Joe kills you."
yay-monkeys		"'Of course I like monkeys.'"
yay-you		"'Now we can be friends!'"
say-nothing		"You decide not to say anything after all."
ehn-apes		"'Apes are OK, I guess.'"
ehn-lemurs		"'I don't really have an opinion on lemurs.'"
xyzzy		"What's the other magic word?"

Table of Joe Comments
prompt		response		enabled
"Who are you?"		who-am-i		1
"Why does Inform hate you?"		why-hate		0
"You probably just left out a semi-colon."	yay-inform			0
"I don't care."		hate-you		0
"Ha, ha. Inform hates you."		hate-you		0
"Do you like a monkey?"		yay-monkeys		1
"Only crazy people like monkeys."		hate-you		0
"No, I said 'a monkey', not 'monkeys'."		hate-pedants		0
"I like monkeys too."		yay-you		0
"Say nothing"		say-nothing		1

Table of Quip Followups (continued)
quip		option			result
yay-monkeys		"What about apes?"			ehn-apes
yay-monkeys		"What about lemurs?"			ehn-lemurs

Table of Magic Followups
prompt 			response			enabled
"PLUGH"			yay-you			1
"There are at least two; which one?"		hate-pedants			1

Section 2 - Dialogue affects itself

After quipping when the current quip is who-am-i:
	enable the why-hate quip;
	enable the hate-you quip.

After quipping when the current quip is why-hate:
	disable the hate-you quip;
	enable the hate-you quip;
	enable the yay-inform quip.

After quipping when the current quip is yay-monkeys:
	enable the hate-you quip;
	enable the hate-pedants quip;
	enable the yay-you quip.

After quipping when the current quip is say-nothing:
	enable the say-nothing quip;
	terminate the conversation.

Section 3 - Dialogue affects the game

After quipping when the current quip is hate-you: end the story saying "You have died".
After quipping when the current quip is hate-pedants: end the story saying "You have died".
After quipping when the current quip is yay-inform: end the story finally saying "You have won".
After quipping when the current quip is yay-you: end the story finally saying "You have won".

Section 4 - Tests

test me with "talk to me / x joe / talk to joe / 1 / x me / 1 / repeat / 3 / x me / 1 / 1".
test xyzzy with "xyzzy / 1".
