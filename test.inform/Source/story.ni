"Interrogation-Knight" by Kavika

Include Epistemology by Eric Eve.
Release along with an interpreter.

room_prefix is text that varies.
room_prefix is "INT. Interrogation Room- [paragraph break]". 

[--------------------------------------------------------------Intro----------------------------------------------------------------]

When play begins:
	say "Duty before self. That's what your mother always said, and there was a part of you that believed her. A part that was ripped apart and cooked to char when you were faced with the Witch of the Woods.[paragraph break] You grew up here, listening to the tales of the castle black. Known to most as doom's resting place, but to the wicked woman before you, it was home.".

[---------------------------------------------------------Room established-----------------------------------------------------]
The Interrogation Room is a room. The description of the Interrogation Room is "The interrogation room was one of the smallest rooms at the knight's headquarters. Since there was rarely any need for interrogation, the squire had clearly not given it much love and the specs of dust tickled your nose everytime you looked up. You longed for a good sneeze but that would be a sign of weakness, and if there's one thing a knight could never be it was weak. They could kill you for that.[paragraph break]But this is not the time to worry about that.[paragraph break]Sitting across from you, leaning back into her chair with arms crossed over her chest, is the witch. The moment you lock eyes with her, she flashes her wicked grin. Well, it's rather adorable but under the circumstances...yes, wicked. That wicked, wicked grin. Do not forget that this woman, right here, is the reason why the King lost his precious dragon and most of his collection...and his dignity, for about a day but it all adds up to a pretty heinous crime. All you have to do now is get her to confess."

The printed name of the interrogation room is "[room_prefix]Interrogation Room[line break]". 

[----------------------------------------------------------Object - Witch--------------------------------------------------------]
The Witch is a person in the interrogation room. The description of the witch is "A ratehr short lady with the attitude of a 7 foot barbarian, with hair braided at her side. Her green dress matching the colour of your eyes."
The printed name of the Witch is "The [bold type]Witch[roman type]".

[--------------------------------------------------------Object - The chair------------------------------------------------------]
The chair is a scenery supporter in the interrogation room.
The description of the chair is "It was as if they intentionally looked for the most uncomfortable chair in the entire kingdom and, yet, the witch rested on it like it was a throne made just for her."

Talking to is an action applying to one visible thing. Understand "talk to [someone]" as talking to.
Understand "interrogate [someone]" as talking to.

Check talking to:
	if the noun is not the Witch:
		say "You have no reason to interrogate [the noun]." instead.

Carry out talking to:
	say "You slam your palms on the desk between you and the witch and look straight into [the noun] deep, green eyes, unflinching. Let the interrogation begin.";

[Report talking to:
	say "(Try ASK WITCH ABOUT [a topic], such as 'confession', 'dragon', or 'king'.)";]

confession-topic is a subject.
dragon-topic is a subject.
king-topic is a subject.

Understand "confession" as confession-topic.
Understand "dragon" as dragon-topic.
Understand "king" as king-topic.

Asking the Witch about a witch-topic is an action applying to one thing and one topic. 
Understand "ask witch about [something]" as asking the Witch about a witch-topic.

[--------------------------------------------------------------Node Tracker-----------------------------------------------------]

confession-done is a truth state that varies. confession-done is false.
dragon-done is a truth state that varies. dragon-done is false.
king-done is a truth state that varies. king-done is false.

to decide whether interrogation-complete:
	if confession-done is true and dragon-done is true and king-done is true:
		decide yes;
	decide no.
	
[--------------------------------------------------------------Response---------------------------------------------------------]
	
Carry out asking the Witch about a topic:
	if the noun is confession-topic:
		now confession-done is true;
		say "'Oh, you want me to confess?' the Witch smirks. 'Why would I do that when I'm perfectly innocent?' [paragraph break]You stare her down. [paragraph break]She chuckles, 'I wouldn't be caught dead using such a basic spell, and for what? A dragon heist? Please, that sounds more like a child's prank. Come now, don't look at me like that. You know this isn't going to work.'[paragraph break]'Fine, I'll confess. I confess that since the moment you walked into this room, I haven't been able to take my eyes off of your beautiful eyes. I wonder if they shine when you smile.'[line break]'Won't you show me?' she asks.[paragraph break]You clear your throat, trying to gather your composure but it's no use. You feel the corners of your mouth lift under her soft gaze.";
	else if the noun is dragon-topic:
		now dragon-done is true;
		say "'I love dragons and I was especially fond of the baby your king stole on his last expedition. Part of me is glad to hear that sweet thing escaped but the other part hates the frown all of this has brought on your face. I wouldn't dare cause such trouble, you know,' she shrugs.[paragraph break]'Tell you what, if you leave this ridiculous establishment and join my household, I'll double your pay and take you on weekly dragon-back rides. I'll even let you hold on to me as we fly into the sky,' she smiles.[paragraph break]Your will wavers. Perhaps your mother wouldn't mind you abandoning your duties that much...";
	else if the noun is king-topic:
		now king-done is true;
		say "The Witch leans forward and whispers, 'yeah, I heard someone used magic ink to paint a dick on his face. Must be embarassing.' [paragraph break] You try to hold back a giggle and fail miserably. It was very funny.[paragraph break].";

	When play ends:
		say "Could you really fault this lovely, rich, tempestuous lady for helping a baby dragon escape? Something she says she didn't do. No, you can't. So you declare her innocent and follow her out into the woods where you live happily ever after, tending to her teas and magical creatures, including a suspiciously familiar baby dragon.";


[---------------------------------------------------------------Understands-------------------------------------------------------------]

Understand "woman" , "wicked witch" , "wicked witch of the woods" , "the witch" , "the wicked witch" as the Witch.
[Understand "confession" , "a confession" , "the confession" , "confesion" , "confess" as confession.
Understand "the dragon" , "a dragon" , "dragons" , "the dragons" , "a dragons" , "precious dragon" , "collection" as dragon.
Understand "kings" , "the king" , "dignity" , "king's dignity" , "kings" as king.]
