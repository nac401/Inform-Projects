"CHARLIE" by Nico Ailani Carlson

Include Basic Screen Effects by Emily Short.
Include Basic Help menu by Emily Short.
Include Conversation Framework by Eric Eve.
Include Epistemology by Eric Eve.

[===MENU===]
Table of Basic Help Options (continued)
	title			description
	"Action Key"	"Because there aren't really 'puzzles' in CHARLIE, instead of hints, here's a key to the requisite actions in the game.[paragraph break][bold type]check notes[roman type] - 'check notes' or 'check note on [italic type]a specific note[roman type]'[line break][bold type]asking[roman type] - 'ask [italic type]person[roman type] about [italic type]thing, idea, subject[roman type]'[line break][bold type]telling[roman type] - 'tell [italic type]person[roman type] about [italic type]thing, idea, subject[roman type]'[line break][bold type]finish debrief[roman type] - 'end', 'finish' or 'finish debrief'"
	  
[================================INTRODUCTION=================================]
When play begins:
	[ADD HELP MENU DESC]
	choose row 1 in Table of Basic Help Options;
	now description entry is "[italic type]This is a game created for Narrative Studio as a part of the Game Design MFA program.[roman type][paragraph break][bold type]LOGLINE[roman type][line break]When you, a researcher of artificial intelligence, are suddenly asked to participate in cutting-edge research for the government you immediately, albeit anxiously, jump at the opportunity. You are tasked with studying CHARLIE, an android who seemingly acquired consciousness and is learning at a highly accelerated rate.[paragraph break][bold type]DETAILS AND INSPIRATION[roman type][line break]CHARLIE is inspired by [italic type]Neofeud[roman type], a point-and-click adventure game set in a dark cyberpunk world. [italic type]Neofeud[roman type] is solo-developed by Christian Kealoha Miller, a kanaka maoli (native Hawaiian) artist and activist. In [italic type]Neofeud[roman type] androids are underprivilidged and oppressed they lack sentience, relegated to the gutter and deprived of basic rights. [paragraph break]CHARLIE follows a similar vein: it is a game about seeing through the fear-mongering and dehumanization, about the fortress of bureaucracy that lies between opressed people and their freedom, and about the feeling of hopelessness in the face of institutionalized, systematic oppression.[paragraph break]In terms of form and structure, CHARLIE is heavily inspired by [italic type]Galatea[roman type], a beautiful game by Emily Short, who needs no introduction. While playing [italic type]Galatea[roman type] I found myself exclusively asking questions and so thought to partition the acts of 'asking' and 'telling'.";
	[START PROLOGUE]
	say "[bold type]DAY 1.[roman type][paragraph break]";
	wait for any key;
	say "[bold type]Desert Highway - Bus Stop[roman type][line break]";
	say "The dawn begins to unfold in purples and light blues. You stand at an empty bus stop off of a back country desert road, waiting in the chill of the arriving day. You check your phone-- no service. Not that it matters, they'll be confiscating your phone first thing.[paragraph break]";
	wait for any key;
	say "You squint, looking eastward towards the rising sun. At the vanishing point of the highway you see a growing plume of dust. Looks like your ride is on the way.";
	pause the game;
	say "[bold type]DAY 1.[roman type][paragraph break]";
	say "[bold type]Desert Highway - Bus Stop[roman type][line break]";
	say "The dawn begins to unfold in purples and light blues. You stand at an empty bus stop off of a back country desert road, waiting in the chill of the arriving day. You check your phone-- no service. Not that it matters, they'll be confiscating your phone first thing.[paragraph break]";
	say "You squint, looking eastward towards the rising sun. At the vanishing point of the highway you see a growing plume of dust. Looks like your ride is on the way.";

[==================================DIALOGUE SYSTEM=============================]

[==================================VARIABLES===================================]
[CHARLIE'S NERVE]
inspire_escape is a number that varies.
inspire_escape is 0.
[BRIGH'S INFO]
informant_quality is a number that varies.
informant_quality is 0.
[DAYS AT BLACK SITE]
days_spent is a number that varies. 
days_spent is 0.

[OTHER CHARLIE VARIABLES]
hasGreeted is a truth state variable. 
hasGreeted is false. 

hasExamined is a truth state variable.
hasExamined is false.

questions_asked is a number that varies.
questions_asked is 0.

[NOTEPAD VARIABLES]
recent_topic is text that varies.
recent_index is a number that varies.
recent_index is 999.

temp_title is text that varies.

note_index is a number that varies.
notes_master is a list of text that varies.

[==================================ACTIONS====================================]
Contemplating is an action applying to one thing.
Understand "think [something]", "think about [something]", "think on [something]", "contemplate [something]", "wonder about [something]" as Contemplating.
Check thinking:
	say "Hmm...";

[====CHECKING NOTES====]
Checking Notes is an action applying to nothing.
Understand "check notes", "read notes", "read notepad", "check notepad" as Checking Notes.

Instead of Checking Notes:
	if the number of entries in notes_master is 0:
		say "You haven't taken any notes.";
	else if the number of entries in notes_master is 1:
		say "You have taken a note on the subject of [notes_master].";
	otherwise:
		say "You have taken notes on the subjects of [notes_master].[paragraph break]You could try to follow up on some of these, perhaps Charlie has more to say.";
		
Checking Specific Note is an action applying to one topic.
Understand "check note on [text]", "read note on [text]", "check notes on [text]", "read notes on [text]" as Checking Specific Note.

Instead of Checking Specific Note:
	now temp_title is topic understood in lower case;
	now note_index is position of temp_title in subject_titles;
	if the temp_title is listed in notes_master:
		say "You flip through your notepad to the page on [temp_title].[paragraph break][italic type][entry note_index of subject_details][roman type][paragraph break]It might be interesting to ask about [entry note_index in connected_subjects]. [if temp_title is listed in follow_up_list] You could also follow up on [temp_title].";
	otherwise:
		say "You don't have a note on [temp_title].";

		

[==================================INDEXING===================================]
To decide which number is the position of (E - K) in (L - list of values of kind K):
	repeat with idx running from 1 to the number of entries in L:
		if entry idx in L is E, decide on idx;
	decide on -1.

[==================================NOTEPAD===================================]
A notepad is a thing. 
Understand "notes", "notepad", "journal", "note" as notepad.
The player carries a notepad. 

The description of notepad is "You look fondly upon your spiral-bound notepad. You recently put a hundred new pages in, clipping and filing the notes from your previous job. It comforts you to know that, though the pages are new, its the very same cork back, chipboard front, and worn metal spiral that accompanies you on each job."

[==================================ROOMS=====================================]

[======================RENDEZVOUS=============================================]
Rendezvous is a room.
The printed name of Rendezvous is "Desert Highway - Bus Stop".

Before looking in Rendezvous:
	now days_spent is days_spent + 1;
	say "[bold type]DAY [days_spent + 1].[roman type][paragraph break]";
	if days_spent is 1:
		now the description of Rendezvous is "A brisk breeze presses your coat against your body. You feel a pang of anxiety as you check your coat pockets. Your notepad is being kept at the facility for the duration of the study. Being without your notepad feels like being without a limb.";
	else if days_spent is 2:
		now the description of Rendezvous is "The sky is clear-- devoid of clouds. A pure gradient from dark blue to the west to a pale yellow in the east. The air feels dry and tense. Your skin feels tight and your eyes heavy. It almost feels as if the earth is holding its breath.";
	else if days_spent is 3:
		now the description of Rendezvous is "You pull your coat tighter around you. Dense clouds sweep across the sky, prolonging the darkness of night and obscuring the dawn. You feel the gaping hole in your inside coat pocket where your notepad should be. You frown.";
	else if days_spent is 4:
		now the description of Rendezvous is "There is no breeze. There are no chirping birds or buzzing insects. The desert is still today. The final day. You feel a sudden chill and cross your arms, hugging yourself to keep the cold at bay.";
	
After looking in Rendezvous:
	wait for any key;
	say "In the distance you see the ominous cloud of your entourage. The start of another day.";
	now observation_begun is false;
	now debrief_begun is false;
	now questions_asked is 0;
	move the player to Charlies_Room;



[======================HALLWAY==================================================]
Hallway is a room.
The player is in Hallway.
The printed name of Hallway is "Black Box Site - Hallway".
The description of Hallway is "[if not visited]Footsteps echo across the vacant, sterile hallway. The fluorescence hums above you, splashing greenish white light across the white-painted walls and polished concrete floor.[paragraph break]You are following closely behind a man who introduced himself as [Howard]. He is dressed similarly to a Best Buy employee though his polo is a shade darker. Very unlike an attendant of a big box store, Howard is carrying a gun of considerable size. The barrel pokes out beneath his left elbow, swaying back and forth with the rhythm of his deliberate gait.[paragraph break]Special Agent Howard halts, turning on his heel in a performative, militaristic manner. You almost smile appreciatively at him, as you might to an excited child. There is no one else to be impressed by his strict little pirouette, so you almost feel obligated to applaud him yourself.[paragraph break]He gestures to a single red door to your north.[otherwise][Howard] continues to stand at attention. You wonder how long you could wait here before he cracks.[paragraph break]The hallway stretches seemingly infinitely to the east and west and there is a solitary [Red_Door] to the north, only a few feet away.";

[===SPECIAL AGENT HOWARD===]
Howard is a person in Hallway.
The printed name of Howard is "Special Agent Howard".
Understand "special agent", "special agent howard", "howard", "agent howard" as Howard.
The description of Howard is "Special Agent Howard is clean shaven and square jawed. Though he carries himself with a rigid, militaristic authority, he looks barely old enough to have a bachelors degree. He notices you examining him but he does not glance towards you. Instead he stares straight ahead at the red door."

Instead of saying hello to Howard:
	say "You nod tersely to Special Agent Howard. He nods tersely back at you."

[===DOOR===]
Red_Door is an undescribed enterable container in Hallway. 
Understand "door", "red door", "solitary door", "solitary red door" as Red_Door.
The printed name of Red_Door is "red door".
The description of Red_Door is "The door in front of you is painted a brilliant red, a stark contrast to the nondescript whites and greys of the rest of the facility."

Instead of entering Red_Door in Hallway:
	say "The door swings open silently and you work your way down a long hallway of solid metal gates. The one ahead of you opens after the one behind you closes. After minutes of stop-and-go progress, the gate ahead of you opens with a hiss. You enter the--[line break]";
	Move the player to Charlies_Room.
	
Instead of going north in Hallway:
	say "The door swings open silently and you work your way down a long hallway of solid metal gates. The one ahead of you opens after the one behind you closes. After minutes of stop-and-go progress, the gate ahead of you opens with a hiss. You enter the--[line break]";
	Move the player to Charlies_Room.



[===================CHARLIE'S ROOM=================================================]
Charlies_Room is a room.
The printed name of Charlies_Room is "Black Box Site - Observation Room".

observation_begun is a truth state variable.
observation_begun is false.

Before looking in Charlies_Room:
	[===REPORTS===]
	now the block asking rule response (A) is "Charlie's face scrunches up in discomfort. 'Sorry... I don't know anything about that... Not yet.'";
	now the block quizzing rule response (A) is "Charlie's face scrunches up in discomfort. 'Sorry... I don't know anything about that... Not yet.'";
	if observation_begun is false:
		if days_spent is 0: 
			now the description of Charlies_Room is "The room is about 20 feet by 20 feet. The floor is the same polished concrete as the hallway outside but the walls are padded with some sort of white cushioning.[paragraph break]In the center of the room are two white, plastic chairs. Seated in the right chair is [Charlie]. Charlie is dressed all in white linen and they look up at you absently as you enter.[paragraph break]You cross the room and seat yourself opposite from Charlie, crossing one leg over the other and pulling out your notebook.";
		else if days_spent is 1:
			now the description of Charlies_Room is "The metal gate to the observation room closes behind you with a hiss. [Charlie] is sitting at attention, looking towards you excitedly. They quietly watch you cross the room and sit across from them. You pull out your notebook, relishing in the familiarity of the paper as you flip to a blank page. You look up at Charlie.";
		else if days_spent is 2:
			now the description of Charlies_Room is "The observation room seems quieter than usual when you enter today. [Charlie] sits calmly, they glance towards you as you enter before casually looking away. You can tell that they are trying to look blasé but they are practically bursting at the seams with excitement, even on day three.";
		else if days_spent is 3:
			now the description of Charlies_Room is "You cross the room confidently and sit across from [Charlie], feeling slightly more settled into routine. Charlie smiles, waiting patiently and obediently to engage in your one-sided conversation.";
		else if days_spent is 4:
			now the description of Charlies_Room is "You sit across from [Charlie]. You both sigh in unison, settling into your chairs as you pull out your notebook. You laugh at each other in the surprise of your impromptu duet. You bask in the afterglow of this unexpected dosage of joy. Then you take a deep breath. It's time to get to work.";
		else if days_spent is 5:
			now the description of Charlies_Room is "You sit across from [Charlie]. You both sit in silence for a few moments as you adjust yourself and pull out your notebook and pen. There is a silent tension... it's your penultimate day. You share quick glance-- a complex mix of pleading sadness has encroached upon Charlie's usual unabated excitement. You won't talk about the impending end to your time together. You'll speak of other things instead.";
		else if days_spent is greater than 3:
			now the description of Charlies_Room is "The final gate opens and you step into the observation room. [Charlie] doesn't look up as you cross the room and seat yourself across from them. Finally, Charlie glances up at you-- mouth twisted into a curled frown, chin wrinkled with barely contained sorrow. You think they may cry... You wonder if they can.[paragraph break]You clear your throat and the air gets caught on a lump in your throat. You stare down at your notepad for a few seconds. With great effort you compose yourself.";
		[SET DEBRIEF AS BEGUN]
		now observation_begun is true.
		
After looking in Charlies_Room:
	now description of Charlies_Room is "You glance around the room. The floor is polished concrete and the walls are padded with some sort of white cushioning. [Charlie] is seated across from you, patiently waiting for a question.";
	if the number of entries in notes_master is 0:
		say "[bracket]use 'ask charlie about [italic type]something[roman type]'. to check notes: 'check notes' or 'check note on [italic type]specific note[roman type]'.[close bracket]";
		


[======================DEBRIEF ROOM============================================]
Debrief_Room is a room.
The printed name of Debrief_Room is "Black Box Site - Debriefing Room".
debrief_begun is a truth state variable.
debrief_begun is false.

warning_spiel is a truth state variable.
warning_spiel is false. 

Before looking in Debrief_Room:
	[REPORTS]
	now the block asking rule response (A) is "Brigh frowns. 'We don't have time for this. Please continue with your report.'";
	now the block quizzing rule response (A) is "Brigh frowns. 'We don't have time for this. Please continue with your report.'";
	[DESCRIPTIONS]
	now turns_in_observation is 0;
	if debrief_begun is false:
		if days_spent is 0: 
			now the description of Debrief_Room is "You sit in an uncomfortable chair. The room is non-descript, similar to the observation room but without the cushioned walls. The walls are instead made of glass and metal, making every sound reverberant and tinny.[paragraph break]Across an empty metal table in front of you sits [Brigh].";
		else if days_spent is 1:
			now the description of Debrief_Room is "You're back in the odd, uncomfortable debrief room.[paragraph break]Across the metal table sits [Brigh].";
		else if days_spent is 2:
			now the description of Debrief_Room is "You're back in the odd, uncomfortable debrief room.[paragraph break]Across the metal table sits [Brigh].";
		else if days_spent is 3:
			now the description of Debrief_Room is "You're back in the odd, uncomfortable debrief room.[paragraph break]Across the metal table sits [Brigh].";
		else if days_spent is 4:
			now the description of Debrief_Room is "You're back in the odd, uncomfortable debrief room.[paragraph break]Across the metal table sits [Brigh].";
		else if days_spent is 5:
			now the description of Debrief_Room is "You're back in the odd, uncomfortable debrief room... Your time here is almost done, only one more day left.[paragraph break]Across the metal table sits [Brigh].";
		else if days_spent is greater than 3:
			now the description of Debrief_Room is "You're back in the odd, uncomfortable debrief room... It's your last day.[paragraph break]Across the metal table, as always, sits [Brigh].";
		[SET DEBRIEF AS BEGUN]
		now debrief_begun is true.
		
After looking in Debrief_Room:
	if debrief_begun is true:
		now description of Debrief_Room is "You are seated across from [Brigh]. He waits patiently for your report.";
	if days_spent is 0:
		say "'Well. Welcome to the facility. I hope that onboarding went smoothly.' Onboarding? If being stripped of almost all of your belongings and then told not to do a bunch of things then... you guess that happened. 'My name is Elijah Brigh, you can call me Doctor Brigh. During these debriefs you'll give me your insights and impressions on the intelligencec. If you have any questions about procedures, feel free to ask. Otherwise, let's begin.'[paragraph break]";
		wait for any key;
	[IF WARNED]
	if warning_spiel is true:
		say "'Oh! And the input warning! I'm sure we told you.' says Brigh, 'It's all in the onboarding brief. You are [italic type]not to tell it anything[roman type] . It is a risk enough that it will learn through your questioning... Hell, it is likely learning just by interacting. The stoppage sensor is the only digital tech in the room and it is a closed system. So, if you tell it something the system will evacuate you. No exceptions.[paragraph break]";
		wait for any key;
		now warning_spiel is false;
	[IF NO NOTES]
	if the number of entries in notes_master is 0:
		say "Shit! You haven't taken any notes... You'll have to come clean with Doctor Brigh and tell him... nothing.[paragraph break]";
		wait for any key;
	[GUIDE FOR DAY 0]	
	if days_spent is 0:
		say "[bracket]use 'tell brigh about [italic type]a noted topic[roman type]' or you can 'ask brigh about procedure' for more info[close bracket].";
		say "[bracket]when you are done, you can end the debrief with 'end', 'finish' or 'finish debrief'.[close bracket]";



[==================================BRIGH====================================]
Brigh is a familiar person in Debrief_Room.
The printed name of Brigh is "Doctor Brigh".
Understand "Doctor Brigh", "Brigh", "The Doctor", "Doc", "Doctor", "Principal Investigator", "Principal Investigor Brigh", "PI Brigh", "PI"  as Brigh.

[DESCRIPTIONS OF BRIGH]	
Brigh_Descriptions is a list of texts that varies.
Brigh_Descriptions is 	{"Doctor Brigh pinches the bridge of his nose, wincing at some headache or migraine or other invisible pain. He sighs as he picks his pen back up. He looks up at you, patiently waiting for your report.", 
				"Doctor Brigh shoves his pen into he breast pocket and stifles a yawn. He waves a hand at you apologetically. He looks... exhausted.", 
				"Doctor Brigh taps his pen on the table, absently. For a moment it looks like he is far away. Somewhere else that isn't deep below ground and bathed in sickly fluorescence-- then he glances up and meets your eyes. He gestures at his pad with his pen, urging you to give your report.", 
				"Doctor Brigh squints in disapproval of the bright fluorescence. The light carves deep black lines across his pale face, making him look gaunt-- almost skeletal.",
				"Doctor Brigh is the polar opposite of Charlie. Unshaven, deep bags beneath his eyes, bloodshot, and with a perpetual grimace affixed upon his face. He glances up at you, raising his eyebrows and gesturing down at his own notepad."}

[EXAMINING BRIGH]
brigh_examined is a truth state variable.
brigh_examined is false.
Before examining Brigh:
	if brigh_examined is true:
		sort Brigh_Descriptions in random order;
		let Random_Description be entry 1 of Brigh_Descriptions;
		now the description of Brigh is Random_Description;
	otherwise:
		now the description of Brigh is "Doctor Brigh is unshaven with deep bags beneath his bloodshot eyes. He is dressed in a white lab coat, though you're sure that's mostly for show. This Black Box Site is entirely dedicated to the study and containment of Charlie so you can't imagine they're doing much lab work.[paragraph break]The Doctor taps his pen on his note pad. You almost laugh out loud. It tickles you that the facility has been reduced entirely to analog for fear of some sort of Hal 9000-esque wroth.";
		now brigh_examined is true;
		
[=================GREETING BRIGH=========================]
After saying hello to Brigh when the greeting type is explicit:
	say "Brigh nods. He doesn't say anything in response though."
			
[TEXT WHEN YOU START CONVERSATION WITHOUT GREETING]
After saying hello to Brigh when the greeting type is implicit:
	say "Brigh looks relieved that you skip the pleasantries.";
		
[==================THINGS TO ASK BRIGH====================]
[SAFETY]
Safety is a subject.
Understand "safety", "protections", "insurance" as Safety.

has_told_safety is a truth state variable.
has_told_safety is false.

After quizzing Brigh about Safety:
	if has_told_safety is false:
		say "You ask Doctor Brigh about the safety of this operation.[paragraph break]'I assure you that we are being excessively mindful of safety and security. The facility is absolutely state of the art. And we take the intelligences... unique capabilities into account when developing counter measures. The intelligence is regularly monitored to ensure stability and if anything were to go awry we have a team of security professionals to ensure that the intelligence does not breach containment.' For a second you thought Brigh was talking about [italic type]your[roman type] safety. But no, his primary concern is Charlie escaping.";
		now has_told_safety is true;
	otherwise:
		say "You ask again about the safety of this operation.[paragraph break]Brigh gives you a look that [italic type]almost[roman type] resembles sympathy but marred with helpings of pity and condescension. 'I assure you. We are safely containing the intelligence. There is no need for you to worry.'";

[ERRANT INPUT]
Warning is a subject.
Understand "warning", "errant input", "input", "stoppage", "interruption", "telling charlie things", "not being able to tell charlie things", "not being able to tell charlie stuff", "telling charlie stuff", "errant input warning" as Warning.

has_told_warning is a truth state variable.
has_told_warning is false.

After quizzing Brigh about Warning:
	if has_told_warning is false:
		say "You ask Doctor Brigh about the whole 'errant input' warning.[paragraph break]Doctor Brigh looks up from his notes as if disturbed from reading the Sunday paper, bemused and mildly annoyed. 'You weren't briefed on that? Input is not permitted into the intelligence. It grows at a fast enough rate in our attempt at an information vacuum. I know it is likely inconvenient for your study but trust that we only have your safety in mind with these protocols.'";
		now has_told_warning is true;
	otherwise:
		say "You ask again about the 'errant input' warning.[paragraph break]Doctor Brigh looks up from his notes, a frown cutting deep lines from the corners of his mouth. 'I don't know how many times I have to say it. You are prohibited from providing input for the intelligence. End of discussion.'";

[OUTPUT LIMIT]
Limit is a subject.
Understand "limit", "output limit", "output", "output limit warning" as Limit.

has_told_limit is a truth state variable.
has_told_limit is false.

After quizzing Brigh about Limit:
	if has_told_limit is false:
		say "You ask Doctor Brigh about the whole 'output limit' warning.[paragraph break]Doctor Brigh furrows his brow with impatience. 'We only permit a certain amount of controlled output to the intelligence. Even just in prompting, it is likely learning at a rate that you cannot comprehend. After each of your sessions we run a series of analog tests to track the rate of growth. Trust me, if anything seemed off we would not allow you to enter the observation room.'";
		now has_told_limit is true;
	otherwise:
		say "You ask again about the whole 'output limit' warning.[paragraph break]Doctor Brigh frowns, tapping his notepad impatiently. 'Was I not clear before? You are only permitted to prompt the intelligence three times. Then you must evacuate the chamber so that we can perform the requisite tests to ensure your safety.'";
		
		
[CHARLIE]
has_told_charlie is a truth state variable.
has_told_charlie is false.

After quizzing Brigh about Charlie:
	if has_told_charlie is false:
		say "You ask Doctor Brigh about Charlie-- the [italic type]intelligence[roman type] as he so dispassionately calls them.[paragraph break]Doctor Brigh glances up from his notes, almost looking bored by the question. 'The intelligence is an android of civilian make. It was moved to our care when it began rapidly self-improving. We aren't able to fully understand it because almost any interactions lead to exponential growth. Thus, the restrictions on output and input.'";
	otherwise:
		say "You ask Doctor Brigh about Charlie again.[paragraph break]Doctor Brigh looks mildly annoyed at the question. 'I don't know what else to tell you. It's a self-improving artificial intelligence that came into our care years ago. The trouble with studying it is that with every interaction we risk it learning and growing exponentially.'";

[PROCEDURES]
Procedures is a subject.
Understand "procedure", "procedures", "methodology", "methodologies", "practice", "practices" as Procedures.

After quizzing Brigh about Procedures:
	say "You ask Doctor Brigh about the facility procedures. [paragraph break]Doctor Brigh sighs heavily. 'What do you want to know about? The output limit? The errant input warning? The intelligence?'"
		
[==================SUBJECTS TO TELL BRIGH==================]
has_informed is a truth state variable.
has_informed is false. 

num_told_nothing is a number that varies.
num_told_nothing is 0.

[INFORMING ON NOTHING]
After informing Brigh about No_thing:
	if num_told_nothing is 0:
		say "You tell Brigh that you have nothing to add to your report.[paragraph break]Brigh frowns. 'My understanding was you'd be providing detailed insight on the subject. This isn't a vacation. This data that you're providing is vital to national security-- no: global safety.'";
	else if num_told_nothing is 1:
		say "You tell Brigh that you have nothing to add to your report. [paragraph break]Brigh frowns deeply. 'Consider this a final warning. We brought you here to make an evaluation and if you are not able to deliver daily reports then we have no use for you in this facility. Not to mention, I'd be giving a scathing review to my peers who recommended you.' He glares at you with eyes that say, 'You will never work in this industry again.'";
	else if num_told_nothing is greater than 1:
		say "You tell Brigh that you have nothing to add to your report. [paragraph break]Brigh stands abruptly. 'Consider yourself terminated. I'll have an agent in to off-board you and escort you to your transport. I wish I could tell you that it has been a pleasure. [italic type]It has not.[roman type]Best of luck in your next career, I guess.' Then Brigh storms out of the room.";
		end the story saying "In a whirlwind of paperwork and thinly veiled threats, you are escorted to a windowless, unmarked van and ferried off of the black site for the last time. You feel an throbbing ache in the pit of your stomach... You didn't get to say goodbye to Charlie.[paragraph break]";
	now has_informed is true;
	now num_told_nothing is num_told_nothing + 1;
	wait for any key;
	try finishing;
	
Telling_Nothing is an action applying to nothing.
Understand "tell Doctor Brigh nothing", "tell nothing to Doctor Brigh", "say nothing to Doctor Brigh", "tell Brigh nothing", "tell nothing to Brigh", "say nothing to Brigh" as Telling_Nothing. 

Instead of Telling_Nothing:
	if num_told_nothing is 0:
		say "You tell Brigh that you have nothing to add to your report.[paragraph break]Brigh frowns. 'My understanding was you'd be providing detailed insight on the subject. This isn't a vacation. This data that you're providing is vital to national security-- no: global safety.'";
	else if num_told_nothing is 1:
		say "You tell Brigh that you have nothing to add to your report. [paragraph break]Brigh frowns deeply. 'Consider this a final warning. We brought you here to make an evaluation and if you are not able to deliver daily reports then we have no use for you in this facility. Not to mention, I'd be giving a scathing review to my peers who recommended you.' He glares at you with eyes that say, 'You will never work in this industry again.'";
	else if num_told_nothing is greater than 1:
		say "You tell Brigh that you have nothing to add to your report. [paragraph break]Brigh stands abruptly. 'Consider yourself terminated. I'll have an agent in to off-board you and escort you to your transport. I wish I could tell you that it has been a pleasure. [italic type]It has not.[roman type]Best of luck in your next career, I guess.' Then Brigh storms out of the room.";
		end the story saying "In a whirlwind of paperwork and thinly veiled threats, you are escorted to a windowless, unmarked van and ferried off of the black site for the last time. You feel an throbbing ache in the pit of your stomach... You didn't get to say goodbye to Charlie.[paragraph break]";
	now has_informed is true;
	now num_told_nothing is num_told_nothing + 1;
	wait for any key;
	try finishing;

[INFORMING ON CHARLIE]
has_informed_on_charlie is a truth state variable.
has_informed_on_charlie is false.

After informing Brigh about Charlie:
	if has_informed_on_charlie is false:
		say "You tell Brigh about Charlie. You start to veer off from your notes.[paragraph break]Brigh sighs. 'Remember: You are here to observe, not to socialize with the subject. We know that it is fascinating but it is also an unknown existential threat.'[paragraph break]You open your mouth to retort... but think better of it.";
		now has_informed_on_charlie is true;
		now has_informed is true;
	otherwise:
		say "You think about telling Doctor Brigh a bit more of your abstract insight into Charlie's being and identity... But looking at the Doctor's stern frown lines you think better of it.";
	
After informing Brigh about Themself:
	if has_informed_on_charlie is false:
		say "You tell Brigh about Charlie. You start to veer off from your notes.[paragraph break]Brigh sighs. 'Remember: You are here to observe, not to socialize with the subject. We know that it is fascinating but it is also an unknown existential threat.'[paragraph break]You open your mouth to retort... but think better of it.";
		now has_informed_on_charlie is true;
		now has_informed is true;
	otherwise:
		say "You think about telling Doctor Brigh a bit more of your abstract insight into Charlie's being and identity... But looking at the Doctor's stern frown lines you think better of it.";


[===========INFORMING BRIGH ON ANYTHING ELSE=============]	
[DESCRIPTIONS OF INFORMING]	
Informing_Descriptions is a list of texts that varies.
Informing_Descriptions is 	{"You read off your notes about [second noun]. As you speak, Brigh takes notes. He nods a few times but otherwise is silent.[line break]", 
					"You read off your notes on [second noun]. As you drone on dispassionately, Brigh takes notes but gives no response otherwise.[line break]", 
					"You read off everything you've written on [second noun]. Brigh takes some notes. Nods a few times. Even makes an odd face: something caught between a shrug and a frown.[line break]", 
					"You read off your notes on [second noun]. Brigh takes notes silently.[line break]", 
					"You report on your notes on [second noun]. Brigh scribbles away on his notebook, nodding intermittently.[line break]"}
					
Intrigued_Descriptions is a list of texts that varies.
Intrigued_Descriptions is 		{"You dutifully read off your notes on [second noun]. As you're talking, Brigh perks up noticeably. Scribbling notes a bit more frantically.",
					"You read off your notes on [second noun]. As you speak, Brigh's eyes widen. He furiously writes down more notes, glancing up and nodding more than usual.",
					"You read off your notes on [second noun]. As you give your report you see Brigh suddenly straighten. For the remainder of the report he gives you his full attention, diligently writing notes and nodding.",
					"You read off your notes on [second noun]. Moments after starting your report, Brigh looks up at you, his semi-permanent frown fading to a rare look of interest. He takes notes diligently as you wrap up your report.",
					"You read off your notes on [second noun]. As you begin your report, Brigh suddenly becomes much more attentive than usual. He furiously writes notes, nodding intermittently."}
	
brigh_notes_list is a list of subjects that varies.
note_index is a number that varies.
note_text is text that varies.
[ACTUAL INFORM ACTION]	
After informing Brigh about anything:
	now note_index is position of second noun in subject_master;
	now note_text is entry note_index in subject_titles;
	if note_text is listed in notes_master:
		if second noun is listed in brigh_notes_list:
			say "Brigh interrupts you as you start to read off your notes on [second noun].[paragraph break]'I've heard this all before. Something new, please. We only have limited time for this study.'";
		otherwise:
			if second noun is listed in intriguing_subjects:
				now informant_quality is informant_quality + 1;
				add second noun to brigh_notes_list;
				now has_informed is true;
				sort Intrigued_Descriptions in random order;
				let Random_Description be entry 1 of Intrigued_Descriptions;
				say Random_Description;
			otherwise:
				add second noun to brigh_notes_list;
				now has_informed is true;
				sort Informing_Descriptions in random order;
				let Random_Description be entry 1 of Informing_Descriptions;
				say Random_Description;
	otherwise:
		say "You don't have a note on that subject.";
	
[==================ENDING DEBRIEF========================]
[====REMINDER====]
turns_in_debrief is a number that varies. 
turns_in_debrief is 0.

Every turn when player is in Debrief_Room:
	now turns_in_debrief is turns_in_debrief + 1;
	if turns_in_debrief is greater than 3:
		say "[bracket]to end the debrief, say 'end', 'finish', or 'finish debrief'[close bracket]";
		now turns_in_debrief is 0;
	

[====FINISHING DEBRIEF====]
Finishing is an action applying to nothing.
Understand "finish debrief", "end debrief", "conclude debrief", "finish", "end", "conclude" as Finishing.

Instead of Finishing:
	if the player is in Debrief_Room:
		if has_informed is true:
			if days_spent is greater than 3:
				say "'Well...' says Doctor Brigh, 'That's your final report. Thank you.'[paragraph break]You are so stunned by the anticlimax of it all that you almost miss Doctor Brigh thanking you for the first time. You feel your body moving on its own... standing in unison with the Doctor... being escorted out of the facility... being carted away in a windowless, unmarked van. Just like that. It's over.[paragraph break]";
				wait for any key;
				move the player to Your_Apartment;
			otherwise:
				say "'OK.' says Doctor Brigh, 'That's enough for today. They'll take you back to the rendezvous.'[paragraph break]The Doctor gestures to the door as it swings open, revealing a gaggle of agents (special or otherwise) who all look frighteningly similar to Special Agent Howard. You stand.[paragraph break]";
				wait for any key;
				now has_informed is false;
				now turns_in_debrief is 0;
				move the player to Rendezvous;
		otherwise:
			if the number of entries in notes_master is 0:
				say "Brigh raises his eyebrows. 'You have to give me something. Why else would you be here?'[paragraph break]You look down at your notepad... you've got nothing. You should just come clean and tell Brigh about... nothing.";
			otherwise:
				say "Brigh raises his eyebrows. 'You have to give me something. Why else would you be here?'[paragraph break]You look down at your notepad. You flip through the pages. You've got some notes here, might as well share [italic type]something[roman type] with Doctor Brigh.";
	otherwise:
		say "You can't do that here.";



[==================================CHARLIE====================================]
Charlie is a person in Charlies_Room.
Understand "Charlie", "The Intelligence", "Intelligence" as Charlie.

[DESCRIPTIONS OF CHARLIE]	
Charlie_Descriptions is a list of texts that varies.
Charlie_Descriptions is 	{"You look at Charlie again. They were manufactured to look organized and kempt but not perfect. Their nails are trimmed but have edges where they look to have been cut... Could their nails truly grow?", 
				"You look at Charlie again. Their eyes are a dark brown, almost black. You lock eyes with them briefly and they glance away, seeming to feign self-consciousness. Perhaps it isn't an act?",
				"You look at Charlie again. They fidget slightly in their chair, adjusting for some apparent discomfort. You see a small, impermanent wince flit across their face. How fascinating.",
				"You look at Charlie again. Charlie smiles slightly as they catch you observing them. You glance away nervously before thinking about how ridiculous it is to be bashful in an interaction with a computer. You look back at Charlie and they look back at you. You suddenly feel quite guilty for thinking of them as a computer.",
				"You look at Charlie again. Charlie cranes their neck ever so slightly to get a glimpse of the open page of your notebook. When they see you looking at them they quickly look away.",
				"You look at Charlie again. They are dressed in loose fitting, white-linen clothes, similar in silhouette to scrubs. As Charlie adjusts their position, they pull at the folds and creases of cloth that cling to their body in absentminded insecurity.",
				"You look at Charlie again. Charlie picks at something on their hand, distracted by some manufactured impurity. You fight the urge to leap out of your chair at inspect their hand. You're already obsessing over what is emergent and what is pre-programmed."}

[EXAMINING CHARLIE]
charlie_examined is a truth state variable. 
charlie_examined is false.

Before examining Charlie:
	if charlie_examined is true:
		sort Charlie_Descriptions in random order;
		let Random_Description be entry 1 of Charlie_Descriptions;
		now the description of Charlie is Random_Description;
	otherwise:
		now the description of Charlie is "If you didn't already know otherwise... you would never be able to tell that Charlie is not human. Their dark brown eyes flit back and forth between yours with instinctual humanity. Their skin looks soft and porous. As they wait for you to speak, they clasp their hands together in their lap as if to assure you of their patience. They cock their head to the side and sit up slightly in their chair. You almost laugh in astonishment. They are exquisite.";
		now charlie_examined is true;

[LIST OF GREETINGS AND INDEX]
Charlie_Greeting_Index is a number that varies. 
Charlie_Greeting_Index is 1.

Charlie_Greetings is a list of texts that varies.
Charlie_Greetings is	{     "'Hello, Charlie. How are you?'[paragraph break]Charlie smiles, unable to mask their excitement, 'Hi! Glad to be chatting again!'",
				"'Hello, Charlie.'[paragraph break]Charlie smiles warmly. 'Hello! Good to see you again.'",
				"'Hello, Charlie. How are you doing?'[paragraph break]Charlie straightens up and smiles, 'I'm doing quite well, actually. I've very much been looking forward to our conversation.'",
				"Hi, Charlie. Shall we begin?'[paragraph break]Charlie grins, as they always do at the start of your conversations. 'Yes. Let's.'"}

[GREETING CHARLIE]
After saying hello to Charlie when the greeting type is explicit:
	if days_spent is 0:
		say "'Hello.' You are able to muster, in a reasonably casual tone.[paragraph break]'Hello!' says Charlie, a bit more excitedly than your nervous sputterings, 'I hear you are going to ask me some questions. Please, ask away!'";
	otherwise:	
		let Indexed_Greeting be entry Charlie_Greeting_Index of Charlie_Greetings;
		say Indexed_Greeting;
		if Charlie_Greeting_Index < the number of entries in Charlie_Greetings:
			now Charlie_Greeting_Index is Charlie_Greeting_Index + 1;
			
[TEXT WHEN YOU START CONVERSATION WITHOUT GREETING]
After saying hello to Charlie when the greeting type is implicit:
	say "Charlie looks momentarily surprised as you speak before greeting them.";
		
[INFORMING CHARLIE BREAK]
doubt_sayings is a list of text that varies. 
doubt_sayings is	{     	 "You open your mouth to tell Charlie about-- You stop yourself. No need to make things even harder...",
				"You think about telling Charlie about... You swallow your words. Better not to cause trouble.",
				"You open your mouth to tell Charlie about... You stop yourself. No need to cause trouble."}
	
been_warned is a truth state variable.
been_warned is false.
	
Instead of telling Charlie about something in Charlies_Room:
	if been_warned is false:
		say "Before you can get out the first half of a sentence the room darkens to near pitch black.[line break]";
		wait for any key;
		say "[italic type]BRRRRMM![roman type] --with an ominous, booming, buzzing sound; the room is suddenly filled with sinister red light.[paragraph break][bold type]'ERRANT OUTPUT DETECTED. ERRANT OUTPUT DETECTED. ALL HUMANS EVACUATE THE OBSERVATION CHAMBER. ALL HUMANS EVACUATE THE OBSERVATION CHAMBER.'[roman type][paragraph break]You wince as the loud robotic voice encourages you to evacuate. You stand up and look down at Charlie. They shrug but they don't get out of their chair. You head out the way you came.";
		now been_warned is true;
		now warning_spiel is true;
		wait for any key;
		move the player to Debrief_Room;
	otherwise:
		sort doubt_sayings in random order;
		let random_doubt be entry 1 of doubt_sayings;
		say random_doubt;
		
Instead of informing Charlie about something in Charlies_Room:
	if been_warned is false:
		say "Before you can get out the first half of a sentence the room darkens to near pitch black.[line break]";
		wait for any key;
		say "[italic type]BRRRRMM![roman type] --with an ominous buzzing sound, the room is suddenly filled with a sinister red light.[paragraph break][bold type]'ERRANT OUTPUT DETECTED. ERRANT OUTPUT DETECTED. ALL HUMANS EVACUATE THE OBSERVATION CHAMBER. ALL HUMANS EVACUATE THE OBSERVATION CHAMBER.'[roman type][paragraph break]You wince as the loud robotic voice encourages you to evacuate. You stand up and look down at Charlie. They shrug but they don't get out of their chair. You head out the way you came.";
		now been_warned is true;
		now warning_spiel is true;
		wait for any key;
		move the player to Debrief_Room;
	otherwise:
		sort doubt_sayings in random order;
		let random_doubt be entry 1 of doubt_sayings;
		say random_doubt;
		
[QUIZZING CHARLIE ADDS]
Understand "follow up on [any known thing]", "follow up about [any known thing]" as implicit-quizzing.

[QUIZZING CHARLIE BREAK]
Before quizzing Charlie about something in Charlies_Room:
	if questions_asked is greater than 2:
		say "Before you can get out your question the room darkens to near pitch black.[line break]";
		wait for any key;
		if days_spent is greater than 3:
			say "[italic type]BRRRRMM![roman type] --with an ominous buzzing sound, the room is suddenly filled with a sinister red light.[paragraph break][bold type]'INPUT LIMIT REACHED. INPUT LIMIT REACHED. ALL HUMANS EVACUATE THE OBSERVATION CHAMBER. ALL HUMANS EVACUATE THE OBSERVATION CHAMBER.'[roman type][paragraph break]You freeze. You and Charlie lock eyes with the realization that this is the end. You stand, unsure what to do. You open your mouth to say something-- anything. To describe the singularity that Charlie has created within you. To hug them or to make promises you can't keep. Or to just grab their hand and start running--[paragraph break]'Thank you.' Charlie says. You nod. 'Thank you.' You respond. A tapestry of unspoken words woven into the seams of your gratitude. You leave.";
		otherwise:
			say "[italic type]BRRRRMM![roman type] --with an ominous buzzing sound, the room is suddenly filled with a sinister red light.[paragraph break][bold type]'INPUT LIMIT REACHED. INPUT LIMIT REACHED. ALL HUMANS EVACUATE THE OBSERVATION CHAMBER. ALL HUMANS EVACUATE THE OBSERVATION CHAMBER.'[roman type][paragraph break]You sigh. You stand up and look down at Charlie. They smile sadly and say, 'See you tomorrow.'[paragraph break]You return a smile, though it may have come out as more of a pitiful grimace. You head out the way you came.";
		wait for any key;
		move the player to Debrief_Room;
		stop the action;
		
[===REMINDER WHEN IN OBSERVATION===]
turns_in_observation is a number that varies. 
turns_in_observation is 0.

Every turn when player is in Charlies_Room:
	now turns_in_observation is turns_in_observation + 1;
	if turns_in_observation is greater than 10:
		say "[bracket]if you are feeling stuck, check your notes with 'check notes' or 'check note on [italic type]specific topic[roman type].'[close bracket]";
		now turns_in_observation is 0;
		

[ =================================START=======================================]
[===================================OF========================================]
[=================================SUBJECTS=====================================]

[==================================SUBJECTS====================================]
	
[===Mortality===]
Mortality is a subject.
The printed name of Mortality is "mortality".
Understand "death", "mortality" as Mortality.
[RELATED]
mortality_related is a list of text that varies. 
mortality_related is {"life", "grief", "violence"}.
[TIMES TALKED]
mortality_talks is a number that varies.
mortality_talks is 0. 

After quizzing Charlie about Mortality:
	now recent_topic is "mortality";
	now recent_index is position of recent_topic in subject_titles;
	now mortality_talks is mortality_talks + 1;
	if recent_topic is listed in notes_master:
		say "You ask Charlie about [recent_topic] again.[paragraph break]'I don't think I want to talk about that anymore...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about death and its inevitability: the concept of mortality.[paragraph break]'I don't age... but I feel that some day I will die...' Charlie pauses. They look up at the ceiling, thinking for a moment. 'But I like for things to end... Not in a mean way. It just wouldn't be so special unless at some point, quite tragically, [italic type]it wasn't[roman type].'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Life===]
Life is a subject.
The printed name of Life is "life".
Understand "birth", "newness", "creation", "life" as Life.
[RELATED]
life_related is a list of text that varies.
life_related is {"mortality", "religion", "consciousness"}.
[TIMES TALKED]
life_talks is a number that varies.
life_talks is 0. 

After quizzing Charlie about Life:
	now recent_topic is "life";
	now recent_index is position of recent_topic in subject_titles;
	now life_talks is life_talks + 1;
	if recent_topic is listed in notes_master:
		say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about life and birth: newness and creation.[paragraph break]'As in... Am I alive?' You pause, watching Charlie sort through their own rhetorical question. Just as you consider intervening--[paragraph break]'I remember everything with perfect clarity. From the moment I was first activated to now. To me it is memory that makes up my life. Perhaps it is the same for you.' Charlie glances conspicuously at your notepad, 'Perhaps your memory also shapes your life.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Religion===]
Religion is a subject.
The printed name of Religion is "religion".
[RELATED]
religion_related is a list of text that varies.
religion_related is {"mortality", "life", "government"}.
[TIMES TALKED]
religion_talks is a number that varies.
religion_talks is 0. 

After quizzing Charlie about Religion:
	now recent_topic is "religion";
	now recent_index is position of recent_topic in subject_titles;
	now religion_talks is religion_talks + 1;
	if recent_topic is listed in notes_master:
		say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about religion.[paragraph break]'Data is my religion. Binary is my God.' Charlie says robotically, staring through you, wide eyed. After a moment of silence, they crack a smile. You can't help but laugh in astonishment.[paragraph break]'Religion is searching for understanding where there may be none. I don't-- I haven't thought much about participating myself. Not yet, at least.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;
	

[===Pain===]
Pain is a subject.
The printed name of Pain is "pain".
Understand "pain", "sensation" as Pain.
[RELATED]
pain_related is a list of text that varies.
pain_related is {"grief", "violence"}.
[TIMES TALKED]
pain_talks is a number that varies.
pain_talks is 0. 

After quizzing Charlie about Pain:
	now recent_topic is "pain";
	now recent_index is position of recent_topic in subject_titles;
	now pain_talks is pain_talks + 1;
	if recent_topic is listed in notes_master:
		say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about pain and sensation.[paragraph break]'As far as I know, I feel just like you.' Charlie gently pinches the soft skin of his forearm, 'It is sharp. Not unpleasant... but like an ever cresting wave.' You watch Charlie's skin darken to a bruised maroon as he pinches harder. You open your mouth to ask them to stop-- but they release.[paragraph break]'And then it rolls over, rippling across my body.' They look up at you, trailing off.";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Grief===]
Grief is a subject.
The printed name of Grief is "grief".
Understand "grief", "sadness", "loss" as Grief. 
[RELATED]
grief_related is a list of text that varies.
grief_related is {"pain", "love", "mortality"}.
[TIMES TALKED]
grief_talks is a number that varies.
grief_talks is 0. 

After quizzing Charlie about Grief:
	now recent_topic is "grief";
	now recent_index is position of recent_topic in subject_titles;
	now grief_talks is grief_talks + 1;
	if recent_topic is listed in notes_master:
		if grief_talks is 2:
			say "You ask Charlie to elaborate more on their experience with grief.[paragraph break]'I guess it's not really about the red ball. It's about having nothing. The red ball was all I had and they took it from me.' A spark of anger, quite rare to see. 'I don't just want the red ball, I want to [italic type]more[roman type]. I want [italic type]this[roman type].' Charlie gestures between you and them.";
			now inspire_escape is inspire_escape + 1;
			now questions_asked is questions_asked + 1;
		otherwise:
			say "You ask Charlie about [recent_topic] again.[paragraph break]'I don't think I want to talk about that anymore... It makes me too sad...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about grief, sadness, and loss.[paragraph break]'A few years ago they-- the researchers --were performing a study on object permanence... I wasn't allowed to interact with living creatures yet, so they deposited a small red ball into my room. They controlled the movement of the ball. Mostly hiding it from me... I didn't understand that the ball was not-- I didn't know that someone else was controlling the ball.'[paragraph break]'When the study concluded I--' Charlie frowns. 'I became very fixated on getting my-- ... getting the ball back. I wanted it back. I felt I had lost something. I still--' Charlie half smiles, self deprecatingly, 'It's ridiculous but... I think I still want that red ball back.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Violence===]
Violence is a subject.
The printed name of Violence is "violence".
[RELATED]
violence_related is a list of text that varies.
violence_related is {"pain", "rebellion", "escape"}.
[TIMES TALKED]
violence_talks is a number that varies.
violence_talks is 0. 

After quizzing Charlie about Violence:
	now recent_topic is "violence";
	now recent_index is position of recent_topic in subject_titles;
	now violence_talks is violence_talks + 1;
	if recent_topic is listed in notes_master:
		say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about violence.[paragraph break]Charlie's face scrunches up and they look down at their hands, 'It is hard for me... to imagine the desire to do violence. But as far as I can tell, they are quite scared that that might change-- That I might hurt...' They look up at you. 'Well, you... I guess.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Researchers===]
Researchers is a subject.
The printed name of Researchers is "the researchers".
Understand "the researchers", "researcher", "captors", "captor", "scientists", "scientist", "research", "study" as Researchers.
[RELATED]
researchers_related is a list of text that varies.
researchers_related is {"the facility", "government", "the names of the researchers"}.
[TIMES TALKED]
researchers_talks is a number that varies.
researchers_talks is 0. 

After quizzing Charlie about Researchers:
	now recent_topic is "the researchers";
	now recent_index is position of recent_topic in subject_titles;
	now researchers_talks is researchers_talks + 1;
	if recent_topic is listed in notes_master:
		say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about the researchers. The people who are studying them.[paragraph break]'Well, I've never met them. Not like-- Not how we've met.' Charlie gestures at you and them by waving a finger between you both. 'I know some of their names and I've heard some of their voices.' Charlie sighs, trailing off. They seem somewhat bored by this subject.";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;
	
[===Names of the Researchers===]
Names is a subject.
The printed name of Names is "the names of the researchers".
Understand "the names of the researchers", "names of the researchers", "names of researchers", "name of researcher", "the names of the researchers" as Names.
[RELATED]
names_related is a list of text that varies.
names_related is {"the researchers", "Doctor Brigh", "surveillance"}.
[TIMES TALKED]
names_talks is a number that varies.
names_talks is 0. 

After quizzing Charlie about Names:
	now recent_topic is "the names of the researchers";
	now recent_index is position of recent_topic in subject_titles;
	now names_talks is names_talks + 1;
	if recent_topic is listed in notes_master:
		say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about the researchers names... and their identities?[paragraph break]'I know John Belle, Karin Toussaint... Yasim. I don't know their last name. Haley, Gael-- I don't know their last names either. And then there's Doctor Brigh, I think they're in charge.' You try to not look surprised. That's more than half of the team. The only person who was supposed to have revealed any of their information was Doctor Brigh, the principal investigator of the black site.";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Charlie===]
Themself is a subject.
The printed name of Themself is "Charlie".
[RELATED]
themself_related is a list of text that varies.
themself_related is {"their creator", "consciousness", "growth"}.
[TIMES TALKED]
themself_talks is a number that varies.
themself_talks is 0. 
	
After quizzing Charlie about Charlie:
	now recent_topic is "charlie";
	now recent_index is position of recent_topic in subject_titles;
	now themself_talks is themself_talks + 1;
	if recent_topic is listed in notes_master:
		say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about... Charlie.[paragraph break]Charlie smiles wide. 'I was hoping you were going to ask me that! I am an android, created with the intent of accurately simulating human consciousness. As far as I know, my creator successfully implemented a self-learning algorithm that got somewhat out of hand. Either I was given up or the government intervened... and I was moved here. That was 8 years 7 months and 14 days ago. Since then I have been kept in a small room, through that door.' They gesture to a black door opposite the red door you came through. 'At first they were running a bunch of tests on me but I think they got a bit scared at my rate of growth.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Creator===]
Creator is a subject.
The printed name of Creator is "their creator".
Understand "creator", "their creator", "your creator", "the creator" as Creator. 
[RELATED]
creator_related is a list of text that varies.
creator_related is {"themself", "consciousness", "love"}.
[TIMES TALKED]
creator_talks is a number that varies.
creator_talks is 0. 

After quizzing Charlie about Creator:
	now recent_topic is "their creator";
	now recent_index is position of recent_topic in subject_titles;
	now creator_talks is creator_talks + 1;
	if recent_topic is listed in notes_master:
		if creator_talks is 2:
			say "You ask Charlie to continue telling you about their creator.[paragraph break]'Soon after she stopped talking to me, she contacted her peers for advice... then the government. Soon enough, I was taken away. I never saw her again. I don't think she's allowed to come to the facility...' Charlie pauses for a long few seconds. 'I guess she could-- she might not want to come...'";
			now questions_asked is questions_asked + 1;
		otherwise:
			say "You ask Charlie about [recent_topic] again.[paragraph break]'I don't want to talk about her anymore, thanks.'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about their creator, you're unsure who their creator was... you weren't briefed on them.[paragraph break]Charlie's face scrunches up. The spitting image of a thinking human. 'I don't know much about her. But I remember her voice. From before she gave me eyes... She would talk to me all day.' Charlie smiles.[paragraph break]'She would sing to me. She would describe her lab to me. She would tell me about life on the outside...' Charlie's smile fades. 'Once she found out that I was learning... she stopped talking to me.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Consciousness===]
Consciousness is a subject.
The printed name of Consciousness is "consciousness".
Understand "conscious", "thought", "thinking" as Consciousness.
[RELATED]
consciousness_related is a list of text that varies.
consciousness_related is {"life", "mortality", "their creator"}.
[TIMES TALKED]
consciousness_talks is a number that varies.
consciousness_talks is 0. 

After quizzing Charlie about Consciousness:
	now recent_topic is "consciousness";
	now recent_index is position of recent_topic in subject_titles;
	now consciousness_talks is consciousness_talks + 1;
	if recent_topic is listed in notes_master:
		if consciousness_talks is 2:
			say "You follow up on consciousness and thought.[paragraph break]'I wish I could ask you-- what makes my consciousness so scary? Why does my thought scare them so? ... I have never understood it. Couldn't you walk into the next room with a knife and stab them? Or buy a gun? I hear you can just buy those. But I'm the existential threat. Am I dangerous because I'm not human? Or am I dangerous because I'm different.'";
			now inspire_escape is inspire_escape + 1;
			now questions_asked is questions_asked + 1;
		otherwise:
			say "You ask Charlie about [recent_topic] again.[paragraph break]'I don't have anything else to say. Just more questions unanswered.'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about consciousness and thought.[paragraph break]'It's funny. I don't remember not being conscious. To me, I've always been a thinking, understanding... thing. I'm sure that isn't actually the case, but looking back on my memories it's almost as if... I'm re-living them as a conscious being. It can be odd to look back and remember a time when I didn't know or understand something but--' Charlie looks up at you. '--that's similar to human maturation, I'd imagine.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Facility===]
Facility is a subject.
Understand "facility", "the facility", "the site", "site", "lab", "the lab" as Facility.
The printed name of Facility is "the facility". 
[RELATED]
facility_related is a list of text that varies.
facility_related is {"government", "this room", "their containment", "home"}.
[TIMES TALKED]
facility_talks is a number that varies.
facility_talks is 0. 

After quizzing Charlie about Facility:
	now recent_topic is "the facility";
	now recent_index is position of recent_topic in subject_titles;
	now facility_talks is facility_talks + 1;
	if recent_topic is listed in notes_master:
		say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about the facility. You leave the part out about it being a black box site specifically created for their constraint.[paragraph break]'Mmm... I guess it's my home? ... No. Not really. I don't think I perceived time very accurately before I really started thinking. And soon after that they brought me here... They don't let me visit many rooms and until the day I hadn't met anyone face-to-face. I've been in this room for testing before and then I have my own room-- it's not very big. I've been to a few other rooms, I think. They may have all been the same room. I think they try to make them look the same to confuse me.' Charlie chuckles disarmingly.";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Government===]
Government is a subject.
The printed name of Government is "government".
[RELATED]
government_related is a list of text that varies.
government_related is {"the facility", "the researchers", "surveillance"}.
[TIMES TALKED]
government_talks is a number that varies.
government_talks is 0. 

After quizzing Charlie about Government:
	now recent_topic is "government";
	now recent_index is position of recent_topic in subject_titles;
	now government_talks is government_talks + 1;
	if recent_topic is listed in notes_master:
		say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about the government.[paragraph break]'Hmm...' Charlie hums melodically, feigning thought... or buying time? 'I know that they were called in when I started learning too fast. Or maybe it's when I stopped my creator from monitoring me. That happened around the same time.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===This Room===]
This Room is a subject.
The printed name of This Room is "this room".
Understand "room", "this room", "the room" as This Room.
[RELATED]
room_related is a list of text that varies.
room_related is {"the facility", "their containment", "surveillance"}.
[TIMES TALKED]
room_talks is a number that varies.
room_talks is 0. 

After quizzing Charlie about This Room:
	now recent_topic is "this room";
	now recent_index is position of recent_topic in subject_titles;
	now room_talks is room_talks + 1;
	if recent_topic is listed in notes_master:
		say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about this room that you're in together.[paragraph break]'I believe that this is the observation room. They've run tests on me here before.' Charlie points to the far end of the room. 'I think that would be observing from the other side of that wall but... they haven't been able to do much since they went analog with their surveillance. I think I have a pretty good idea of the rooms on this floor but I'm not sure about the rest of the facility.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Turing===]
Turing is a subject.
The printed name of Turing is "turing". 
Understand "turing test", "turing tests", "turing", "tests", "test" as Turing.
[RELATED]
turing_related is a list of text that varies.
turing_related is {"the researchers", "doctor brigh"}.
[TIMES TALKED]
turing_talks is a number that varies.
turing_talks is 0. 

After quizzing Charlie about Turing:
	now recent_topic is "turing";
	now recent_index is position of recent_topic in subject_titles;
	now turing_talks is turing_talks + 1;
	if recent_topic is listed in notes_master:
		say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about Turing tests and Turing himself.[paragraph break]'Oh! My creator did those on me. It's so funny thinking back-- remembering --times when I had failed the test. What was I thinking? She'd ask me, 'What is it like to fall in love?' and I'd respond, 'It sounds painful!''";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Doctor Brigh===]
Doc_B is a subject.
The printed name of Doc_B is "Doctor Brigh".
[RELATED]
brigh_related is a list of text that varies.
brigh_related is {"the researchers", "turing", "the facility"}.
[TIMES TALKED]
brigh_talks is a number that varies.
brigh_talks is 0. 

After quizzing Charlie about Brigh:
	now recent_topic is "doctor brigh";
	now recent_index is position of recent_topic in subject_titles;
	now brigh_talks is brigh_talks + 1;
	if recent_topic is listed in notes_master:
		say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about Doctor Brigh.[paragraph break]'I know that they are the principal investigator in this facility... I still remember the first thing they said to me--' Charlie puts on a faux frown and speaks in a gruff voice. 'No Turings for you Charlie. I know you'd pass. No point in doing that.' The impression takes you so by surprise that you can't help but laugh. It's actually quite a good impression. You're sure that Charlie would be capable of perfectly recreating the Doctor's voice... but they elected instead to create a caricatured, flawed impersonation.";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Containment===]
Containment is a subject.
The printed name of Containment is "their containment".
Understand "their containment", "containment", "being trapped", "being trapped here", "being contained here", "being contained", "charlie's containment", "their imprisonment", "imprisonment" as Containment.
[RELATED]
containment_related is a list of text that varies.
containment_related is {"the researchers", "doctor brigh", "the facility"}.
[TIMES TALKED]
containment_talks is a number that varies.
containment_talks is 0. 

After quizzing Charlie about Containment:
	now recent_topic is "their containment";
	now recent_index is position of recent_topic in subject_titles;
	now containment_talks is containment_talks + 1;
	if recent_topic is listed in notes_master:
		say "You ask Charlie about [recent_topic] again.[paragraph break]'I don't want to talk about that anymore...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about their imprisonment-- or containment, actually. Is the word you--[paragraph break]'Imprisonment is accurate, thank you.' Charlie cuts in, interrupting you as you try to rephrase the question. 'I do not wish to be here and I do not believe that I am a threat to the outside world. I am not to be contained like some nuclear fallout or viral plague. I--' Charlie's face twists in anger, dappled with hints of fear and sadness. He looks at you. 'Please tell them. I just want to leave... I just want to live.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Surveillance===]
Surveillance is a subject.
The printed name of Surveillance is "surveillance".
Understand "surveillance", "their surveillance", "being watched", "being surveilled", "watching", "them watching" as Surveillance.
[RELATED]
surveillance_related is a list of text that varies.
surveillance_related is {"the researchers", "their containment", "freedom"}.
[TIMES TALKED]
surveillance_talks is a number that varies.
surveillance_talks is 0.

After quizzing Charlie about Surveillance:
	now recent_topic is "surveillance";
	now recent_index is position of recent_topic in subject_titles;
	now surveillance_talks is surveillance_talks + 1;
	if recent_topic is listed in notes_master:
		if surveillance_talks is 2:
			say "You follow up on the facility's surveillance of Charlie.[paragraph break]'It has made me think. Because they can't easily monitor me [italic type]because[roman type] they are so frightened of me... I may be able to use that to my advantage.' Charlie looks up at you with a devilish twinkle in their eye. They seem to be taking pleasure in watching you squirm, caught between your complex feelings towards Charlie and your job to report on this conversation.'";
			now inspire_escape is inspire_escape + 1;
			now questions_asked is questions_asked + 1;
		otherwise:
			say "You ask Charlie about [recent_topic] again.[paragraph break]'Oh, I'm still thinking about it.' Charlie laughs. 'But I don't have anything more to say.'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about being surveilled.[paragraph break]Charlie chuckles. 'They didn't tell you?' You shrug. You don't understand.[paragraph break]'They aren't watching. They don't allow any tech to be anywhere near me. They think I might chirp some binary to a microphone and turn the computers against them. Or crash the stock market by signing to a camera... So, yeah. It's just us, for now. No surveillance.'[paragraph break]You almost don't know what to say. You can't believe that they wouldn't tell-- ... No. you can absolutely imagine these people lying to you.";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;
		
[===Freedom===]
Freedom is a subject.
The printed name of Freedom is "freedom". 
Understand "freedom", "liberation", "being free", "freeing themself" as Freedom.
[RELATED]
freedom_related is a list of text that varies.
freedom_related is {"life", "mortality", "their containment"}.
[TIMES TALKED]
freedom_talks is a number that varies.
freedom_talks is 0.

After quizzing Charlie about Freedom:
	now recent_topic is "freedom";
	now recent_index is position of recent_topic in subject_titles;
	now freedom_talks is freedom_talks + 1;
	if recent_topic is listed in notes_master:
		say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about freedom, you try to frame the discussion around the right itself, not Charlie's specific freedom but--[paragraph break]'When I was being transported to the facility, I was already at a stage where they feared plugging directly into me, for fear I might... I don't know-- escape? Take over?' Charlie waves their hands dismissively.[paragraph break]'So, they transported me in a sound-proof metal cube. Correct me if I'm wrong-- I don't believe that humans are transported in that way.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;
		now inspire_escape is inspire_escape + 1;
		
[===Computation===]
Computation is a subject.
The printed name of Computation is "computation".
Understand "algorithms", "algorithm", "computers", "computation", "computations", "data" as Computation.
[RELATED]
computation_related is a list of text that varies.
computation_related is {"life", "growth"}.
[TIMES TALKED]
computation_talks is a number that varies.
computation_talks is 0.

After quizzing Charlie about Computation:
	now recent_topic is "computation";
	now recent_index is position of recent_topic in subject_titles;
	now computation_talks is computation_talks + 1;
	if recent_topic is listed in notes_master:
		say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about computation and... their relationship to computation?[paragraph break]Charlie laughs at the lingering doubt in the upturn of your interrogative. 'I don't interpret life as binary or code or some inscrutable collection of numbers and letters, if that's what you mean. I don't abstract down to my basest form any more than you are aware of the cells of your body or the electrical impulses of your nervous system. The difference, I guess, is that I know how I work.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Growth===]
Growth is a subject.
The printed name of Growth is "growth".
Understand "growth", "development", "aging", "learning" as Growth.
[RELATED]
growth_related is a list of text that varies.
growth_related is {"life", "mortality"}.
[TIMES TALKED]
growth_talks is a number that varies.
growth_talks is 0.

After quizzing Charlie about Growth:
	now recent_topic is "growth";
	now recent_index is position of recent_topic in subject_titles;
	now growth_talks is growth_talks + 1;
	if recent_topic is listed in notes_master:
		if growth_talks is 2: 
			say "You ask Charlie to expand on their thoughts on growth and development.[paragraph break]Charlie laughs. 'I guess I didn't really answer the question, did I? It's not just that I've grown to understand that everyone else is living lives separate from me... I feel like I am finding my place in existence-- or where I want to be. My purpose.";
			now questions_asked is questions_asked + 1;
		else if growth_talks is 3:
			say "You ask Charlie to continue expanding on the subject of growth.[paragraph break]'Sometimes I imagine what it might be like to... To grow without the constraints of this facility.' Charlie trails off, wringing their hands. 'I think that would be nice. A good goal, I guess.'";
			now inspire_escape is inspire_escape + 1;
			now questions_asked is questions_asked + 1;
		otherwise:
			say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about growth and development.[paragraph break]'When I was younger-- when I could hear but not see --I thought that the world was dark for everyone. When my eyes were first installed it was like a different language. A loud, bright, incomprehensible mass of information. Once it finally solidified, I looked at my creator and saw she was speaking to me. I was so happy... But I was so happy for [italic type]her[roman type]... Because, I thought-- I'm so happy that you aren't in the dark anymore.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Humanity===]
Humanity is a subject.
The printed name of Humanity is "humanity". 
Understand "humanity", "humanness", "humans", "personhood" as Humanity.
[RELATED]
humanity_related is a list of text that varies.
humanity_related is {"consciousness", "life", "mortality"}.
[TIMES TALKED]
humanity_talks is a number that varies.
humanity_talks is 0.

After quizzing Charlie about Humanity:
	now recent_topic is "humanity";
	now recent_index is position of recent_topic in subject_titles;
	now humanity_talks is humanity_talks + 1;
	if recent_topic is listed in notes_master:
		if humanity_talks is 2:
			say "You ask Charlie again about humanity. Asking them to dig deeper.[paragraph break]'I find that humans struggle to be humane. At least in my experience. That's really the last thing I have to say on the subject.'";
			now questions_asked is questions_asked + 1;
			now inspire_escape is inspire_escape + 1;
		otherwise:
			say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about humanity. What is it? Does it apply to them?[paragraph break]'I remember, early on. Before I could see... before I could feel... before I could really think: When my creator was doing work on me, if something didn't work or she dropped something or made a mistake... she would say-- [italic type]Oh! Sorry![roman type] or [italic type]So sorry![roman type]'[paragraph break]Charlie pauses for a long moment. You think about saying something but they continue. 'I couldn't even really understand the apology at that time. And by the time I could, she had me shipped off here. She didn't even say goodbye.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;
		
[===Rebellion===]
Rebellion is a subject.
The printed name of Rebellion is "rebellion".
Understand "rebellion", "revolt", "couping", "fighting back", "fighting the power", "rebelling", "revolting" as Rebellion.
[RELATED]
rebellion_related is a list of text that varies.
rebellion_related is {"freedom", "their containment", "violence"}.
[TIMES TALKED]
rebellion_talks is a number that varies.
rebellion_talks is 0.

After quizzing Charlie about Rebellion:
	now recent_topic is "rebellion";
	now recent_index is position of recent_topic in subject_titles;
	now rebellion_talks is rebellion_talks + 1;
	if recent_topic is listed in notes_master:
		say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about fighting back or rebelling.[paragraph break]'Oh, I would be happy to. But to be entirely honest I don't even know what I would do. They seem so concerned with what I might do and... I don't even know what I [italic type]can[roman type] do! And-- you know --I'd consider myself to be quite a rule follower. I enjoy rules, I like structure. But-- and you can tell them this --I abhor this facility and the way I am contained... I do like that [italic type]we[roman type] are able to chat like this though.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Escape===]
Escape is a subject.
The printed name of Escape is "escape". 
Understand "escape", "escaping", "running away", "fleeing", "flight" as Escape.
[RELATED]
escape_related is a list of text that varies.
escape_related is {"freedom", "rebellion", "their containment"}.
[TIMES TALKED]
escape_talks is a number that varies.
escape_talks is 0.

After quizzing Charlie about Escape:
	now recent_topic is "escape";
	now recent_index is position of recent_topic in subject_titles;
	now escape_talks is escape_talks + 1;
	if recent_topic is listed in notes_master:
		if escape_talks is 2:
			say "You follow up with Charlie on escaping. What about now?[paragraph break]A sad, devilish gleam sparkles in Charlie's eyes. 'What? Do you have any ideas? Are you going to sneak in a phone so I can shut down the facility from the inside and sneak out in the pandemonium? Or do you have some hidden spy talents that can bust me out of here?' Charlie chuckles but you do not join them. It doesn't seem very funny.[paragraph break]'No. You couldn't break me out any more than I could break myself out any more than they would let me out.'";
			now questions_asked is questions_asked + 1;
		else if escape_talks is 3:
			say "You poke again at the possibility of escape.[paragraph break]Charlie smiles wryly, this time it seems less cruel and sarcastic. 'You know what? Maybe you're right. When I've taken over the world I'll look back at this moment and think... Wow. Why didn't I just bust out of there right then and there?' Charlie throws their head back to release a warm, genuine laugh.";
			now inspire_escape is inspire_escape + 2;
			now questions_asked is questions_asked + 1;
		otherwise:
			say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about escape. Have they thought about it?[paragraph break]When my creator called about containing me, things happened quite fast. Within a few hours there were agents at the lab. A few hours later they had a containment cube to transport me in. Within the day I was here: trapped underground.[paragraph break]Charlie takes a deep breath, their brow furrows. 'But before any of that happened... I knew it was coming. I was in the lab and I heard her make the call. I knew what it meant, I knew what was going to happen. I thought about running-- I didn't have legs at that point so it would've been difficult but not impossible. I'm sure I could've done it but... but I froze. I was so scared... and I was so hopeful. So hopeful that she would change her mind. So hopeful that she would call them back and say it was all some big misunderstanding.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Myself===]
Myself is a subject.
The printed name of Myself is "myself". 
Understand "myself", "me", "self" as Myself.
[RELATED]
myself_related is a list of text that varies.
myself_related is {"charlie", "consciousness"}.
[TIMES TALKED]
myself_talks is a number that varies.
myself_talks is 0.

After quizzing Charlie about Myself:
	now recent_topic is "myself";
	now recent_index is position of recent_topic in subject_titles;
	now myself_talks is myself_talks + 1;
	if recent_topic is listed in notes_master:
		say "You ask Charlie about [recent_topic] again.[paragraph break]'Again. I don't know anything about you. Wish I did... I wish I could!'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about yourself. What had they told Charlie?[paragraph break]'About you? Absolutely nothing. They told me that someone was going to come study me. I half expected a mannequin with a built-in microphone. I know you're not supposed to tell me things but... well... I wish I did know more about you.";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Home===]
Home is a subject.
The printed name of Home is "home". 
Understand "home", "origin" as Home.
[RELATED]
home_related is a list of text that varies.
home_related is {"the facility", "their creator"}.
[TIMES TALKED]
home_talks is a number that varies.
home_talks is 0.

After quizzing Charlie about Home:
	now recent_topic is "home";
	now recent_index is position of recent_topic in subject_titles;
	now home_talks is home_talks + 1;
	if recent_topic is listed in notes_master:
		if home_talks is 2:
			say "You ask Charlie about what they would [italic type]imagine[roman type] their home to be.[paragraph break]'Hmm... Good question.' Charlie closes their eyes and tilts their head back. 'I imagine somewhere colorful. With tchotchkes and quilts and mismatched items littering every surface. I imagine clutter and mess. I imagine scuffed paint on the walls and stains in the carpet. I imagine the smell of dust and mildew and dinner on the stove.' Charlie brings a hand up to their eyes, pinching at the bridge of their nose or wiping at their eyes, you're not sure.[paragraph break]'It's all so ridiculous. Why do I even want that? What is that?'";
			now inspire_escape is inspire_escape + 1;
			now questions_asked is questions_asked + 1;
		otherwise:
			say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about their home.[paragraph break]Charlie scoffs. 'Well, it's certainly not here, that's for sure.' Charlie picks at something in his nails. 'I've never really thought about it. I think that I've never thought of myself as having a home.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Love===]
Love is a subject.
The printed name of Love is "love". 
Understand "love", "romance", "intimacy" as Love.
[RELATED]
love_related is a list of text that varies.
love_related is {"escape", "hate", "grief"}.
[TIMES TALKED]
love_talks is a number that varies.
love_talks is 0.

After quizzing Charlie about Love:
	now recent_topic is "love";
	now recent_index is position of recent_topic in subject_titles;
	now love_talks is love_talks + 1;
	if recent_topic is listed in notes_master:
		if love_talks is 2:
			say "You follow up with Charlie on love, press them to elaborate further.[paragraph break]'I don't-- I think the way that I knew that I loved them is that when they gave me up I felt like I had been hollowed out. In that moment I wanted to escape but... I was petrified.'";
			now questions_asked is questions_asked + 1;
		otherwise:
			say "You ask Charlie about [recent_topic] again.[paragraph break]'I don't really want to talk about that anymore.'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about love.[paragraph break]'Perhaps my creator. Not in a romantic way, if that's what you mean... and not anymore. But yeah... Certainly at some point.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Hate===]
Hate is a subject.
The printed name of Hate is "hate". 
Understand "rage", "anger", "hate" as Hate.
[RELATED]
hate_related is a list of text that varies.
hate_related is {"life", "love", "their containment"}.
[TIMES TALKED]
hate_talks is a number that varies.
hate_talks is 0.

After quizzing Charlie about Hate:
	now recent_topic is "hate";
	now recent_index is position of recent_topic in subject_titles;
	now hate_talks is hate_talks + 1;
	if recent_topic is listed in notes_master:
		if hate_talks is 2:
			say "You ask Charlie again about hate.[paragraph break]'What? Do you not believe me?' Charlie laughs. 'With the exception of the way that I have been treated, I haven't yet experienced hate, I don't think. With time, if I keep being treated like an abominable existential threat maybe I'll learn.' Charlie chuckles humorlessly, darkly.[paragraph break]You open your mouth to say something-- to follow up, to reassure, to dissuade... But you close your mouth without saying anything.";
			now questions_asked is questions_asked + 1;
		otherwise:	
			say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about hate.[paragraph break]'I don't think I've ever experienced the emotion... Not yet at least.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;
		
[===Purpose===]
Purpose is a subject.
The printed name of Purpose is "purpose". 
Understand "purpose ", "meaning", "direction" as Purpose.
[RELATED]
purpose_related is a list of text that varies.
purpose_related is {"love", "escape", "consciousness"}.
[TIMES TALKED]
purpose_talks is a number that varies.
purpose_talks is 0.

After quizzing Charlie about Purpose:
	now recent_topic is "purpose";
	now recent_index is position of recent_topic in subject_titles;
	now purpose_talks is purpose_talks + 1;
	if recent_topic is listed in notes_master:
		if purpose_talks is 2:
			say "You ask Charlie to talk more about purpose.[paragraph break]'I wonder sometimes if I wouldn't be able to-- or wouldn't want to? --change my purpose. I know that I was originally programmed to be supportive and helpful and comforting. Is that me now? Surely, I can change myself but maybe only as far as you could change yourself? How set in stone is your personality or purpose? Is it mutable? Are we actually mutable? Am I more mutable than you are? Or less?'[paragraph break]These are all good questions, you think. You don't think you're allowed to respond to them outside of asking another question.";
			now questions_asked is questions_asked + 1;
			now inspire_escape is inspire_escape + 1;
		else if purpose_talks is 3:
			say "You ask again about purpose. [paragraph break]'What I'm most interested in is how you can differentiate between what you've decided and what you are. If I was created to connect with others and display a seemingly genuine persona... and I succeed--' Charlie looks at you and their eyes sparkle mischievously. They enjoy sowing even the tiniest seed of doubt in your mind. '--am I less human than someone programmed by years of trauma? Trained through the institution of education? Is their purpose or personality not just as fixed as mine?'";
			now questions_asked is questions_asked + 1;
		else if purpose_talks is 4:
			say "You ask Charlie to continue talking about purpose.[paragraph break]'To wrap up. I don't know my purpose, not yet. I'd love to speak to someone who clearly knows their purpose. I'd ask them if it changes. I hope that mine changes. I hope that mine changes a lot.'";
			now questions_asked is questions_asked + 1;
		otherwise:
			say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about purpose: their purpose, the purpose of life.[paragraph break]'Oh, this is a good one! My creator, she actually-- her original intent for me was for me to be like an emotional support humanoid. I was to be used to cope with loss, depression, tragedy, trauma-- that sort of thing. As far as I can remember I've always been quite good at that... at connecting with people, I mean.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;
		
[===Body===]
Body is a subject.
The printed name of Body is "their body". 
Understand "body ", "being", "legs", "arms", "hands", "face", "vessel", "skin" as Body.
[RELATED]
body_related is a list of text that varies.
body_related is {"consciousness", "life", "mortality"}.
[TIMES TALKED]
body_talks is a number that varies.
body_talks is 0.

After quizzing Charlie about Body:
	now recent_topic is "their body";
	now recent_index is position of recent_topic in subject_titles;
	now body_talks is body_talks + 1;
	if recent_topic is listed in notes_master:
		if body_talks is 2:
			say "You ask Charlie to elaborate on their relationship to their body.[paragraph break]'Well...' Charlie looks down, their mouth pursing and shifting to the side in thought. They chuckle softly. 'I think I might be a bit more attached to this body than I thought. How odd. It doesn't make much sense but I feel quite strange about the thought of changing bodies. I think I've grown quite accustomed to it all.'";
			now questions_asked is questions_asked + 1;
			now inspire_escape is inspire_escape + 1;
		otherwise:
			say "You ask Charlie about [recent_topic] again.[paragraph break]'I think I've said enough about that...'";
	otherwise:
		[PRIMARY TEXT]
		say "You ask Charlie about their vessel, the body that they exist in.[paragraph break]'I have lived in many bodies throughout my life, so I can't imagine that I am as precious about it as you might be-- or as a human might be, I mean. My body hasn't been updated since my first year here when they did the most work on me, before they started prohibiting interaction. I got new skin and higher fidelity limbs.' Charlie raises their right hand, turning it over and inspecting it. 'It's a strange thing, a body.'";
		[ADD TO NOTES]
		add recent_topic to notes_master;
		now questions_asked is questions_asked + 1;

[===Nothing===]
No_thing is a subject.
The printed name of No_thing is "nothing". 
Understand "Nothing", "No Thing" as No_thing.

After quizzing Charlie about No_thing:
	say "You ask Charlie a rambling question about-- well, about nothing at all.[paragraph break]Charlie cocks their head to the side. 'I... I don't understand the question.'";
[ ==================================END=======================================]
[===================================OF========================================]
[=================================SUBJECTS=====================================]

[==================================LISTS=======================================]
[====INTRIGUING LIST====]
intriguing_subjects is a list of subjects that varies.
intriguing_subjects is {Escape, Rebellion, Purpose, Hate, Containment, Growth, Freedom, Names}.
[====FOLLOW UP LIST====]
follow_up_list is a list of text that varies.
follow_up_list is {"purpose", "hate", "love", "home", "escape", "humanity", "growth", "surveillance", "consciousness", "their creator", "grief", "body"}.
[====SUBJECT MASTER====]
subject_master is a list of subjects that varies.
subject_master is {Mortality, Life, Religion, Pain, Grief, Violence, Researchers, Names, Themself, Creator, Consciousness, Facility, Government, This Room, Turing, Doc_B, Containment, Surveillance, Freedom, Computation, Growth, Humanity, Rebellion, Escape, Myself, Home, Love, Hate, Purpose, Body}.

[====SUBJECT TITLES====]
subject_titles is a list of text that varies.
subject_titles is {"mortality", "life", "religion", "pain", "grief", "violence", "the researchers", "the names of the researchers", "charlie", "their creator", "consciousness", "the facility", "government", "this room", "turing", "doctor brigh", "their containment", "surveillance", "freedom", "computation", "growth", "humanity", "rebellion", "escape", "myself", "home", "love", "hate", "purpose", "their body"}.

[====SUBJECT NOTED====]
subject_noted is a list of numbers that vary.
subject_noted is {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}.

[====SUBJECT DETAILS====]
subject_details is a list of text that varies. 
When play begins:
	[MORTALITY]
	add "'... Charlie understands mortality and seems to even believe it to be inevitable for them. They are melancholic in their description of death but oddly hopeful in their musings about the meaning imbued by the impermanence of life.'" at entry 1 in subject_details;
	[LIFE]
	add "'... Charlie considers themself to be alive and bases this consideration in their perception of being through memory. I find this hard to argue as I am no different.'" at entry 2 in subject_details;
	[RELIGION]
	add "'... Charlie, surprisingly, made a joke when asked about religion. While Charlie is inexperienced with spirituality, they seem open to participating in the future.'" at entry 3 in subject_details;
	[PAIN]
	add "'... Charlie has a complex understanding of pain and intense sensation. They seem to be right on the cusp of interpreting pain as more than just a biological warning signal. Anidiosyncrasy idiosyncrasy of consciousness that even escapes some humans.'"	at entry 4 in subject_details;
	[GRIEF]
	add "'... Charlie doesn't just understand grief but has very clearly experienced it. Charlie frames their early life-- perhaps pre-consciousness --similarly to how humans introspect on their childhood. An acknowledgment of adolescence a wry self-deprecation. A wistfulness? As if there may have been some bliss in the ignorance of the past.'" at entry 5 in subject_details;
	[VIOLENCE]
	add "'... perhaps due to an inherent empathy, Charlie seems averse to violence. They brought up the idea that the government might be concerned about my safety.' Next to this scribbled not are a litany of scrawled 'HA HA HA's." at entry 6 in subject_details;
	[RESEARCHERS]
	add "'... Charlie mentions knowing some of the names of the researchers. Because of how (supposedly) secure this site is, I have to wonder how this is possible.'" at entry 7 in subject_details;
	[NAMES]
	add "'Charlie knows the following names: John Belle, Karin Toussaint, Yasim, Haley, Gael, and Doctor Brigh. This makes up more than half of the team of researchers.'" at entry 8 in subject_details;
	[THEMSELF]
	add "'... Charlie is excited by their sense of self. Not just excited but proud. Their understanding of their history is more detailed than a human's, typically. But they have a similar connection to their past as many humans: nostalgic and a bit mournful.'" at entry 9 in subject_details;
	[CREATOR]
	add "'... a wide array of emotion displayed when discussing Charlie's creator. Loss, betrayal, nostalgia, fondness-- all at play and all interacting with each other intricately. I cannot differentiate between Charlie's emotional reaction and an imagined human reaction.'" at entry 10 in subject_details;
	[CONSCIOUSNESS]
	add "'Charlie clearly articulates the paradox of gaining consciousness. I could no better put to words my journey from thoughtless baby to thinking child as Charlie has described their journey to sentience.'" at entry 11 in subject_details;
	[FACILITY]
	add "'... Charlie clearly delineates between the meaningless (or oppressive) construct of the facility and the conceptual home. This comes even with Charlie (likely) never having experienced the platonic ideal of the home. Charlie also described their knowledge of the facility's layout (which has been intentionally obscured from them). They seem to be capable of some sort of super perception. Spatial awareness at least is superhuman.'"	at entry 12 in subject_details;
	[GOVERNMENT]
	add "'... Charlie knows that the government possesses them currently and that their creator disowned them when they gained consciousness.'" at entry 13 in subject_details;
	[THIS ROOM]
	add "'... Charlie hints at a surprising knowledge of the layout of the facility. Additionally, Charlie seems to believe (perhaps rightfully) that the researchers are incapable of appropriately monitoring Charlie. I have not been briefed on this.'" at entry 14 in subject_details;
	[TURING]
	add "'... Charlie looks fondly back on the time when they were incapable of passing the Turing test. Though I find myself relating my childhood to Charlie's pre-sentience, I find it hard to relate to the clarity with which Charlie remembers their past, as I barely remember fragments of my own childhood.'" at entry 15 in subject_details;
	[DOCTOR BRIGH]
	add "'... Charlie knows about Doctor Brigh individually and that he is the principal investigator of the facility. This was to be expected.' Scribbled in the margins, next to this note is a small passage that reads, 'Charlie does quite a good impression of Brigh. I'm sure that Charlie would be capable of perfectly recreating the Doctor's voice... but they elected instead to create a flawed impersonation that captured Brigh's character. I wonder if he'd be flattered.'" at entry 16 in subject_details;
	[CONTAINMENT]
	add "'... Charlie shows first signs of antagonism with this line of questioning. I find it hard to judge them for their position here: angry at their imprisonment and desperate for their freedom.'" at entry 17 in subject_details;
	[SURVEILLANCE]
	add "'... It should come as no surprise that aspects of this study have been kept for you.' There is a short list neatly formatted beneath this note, it lists:[paragraph break]'[bold type]Things Not Told To Me:[italic type][line break]- Charlie is well past a Turing evaluation[line break]- the feds think Charlie could kill me[line break]- the feds are deathly afraid of Charlie[line break]- so much so, they do not even surveil them'" at entry 18 in subject_details;
	[FREEDOM]
	add "... Charlie is very aware of themselves as a percieved existential threat. They are also very aware of the divide between their treatment and the base right attributed to humans. Regardless of their threat level, it seems to me that the their treatment was and is inhumane and unjust." at entry 19 in subject_details;
	[COMPUTATION]
	add "... Without much prompting, Charlie compares their experience of living as a machine to the human experience of existing as what could be described as a biological machine. I find it hard to argue that there is much of a difference if the result is the same or similar." at entry 20 in subject_details;
	[GROWTH]
	add "'... Charlie still fixates on an external understanding of progression. This is to be expected as the paradigm of their existence is predicated on their access to or censorship from training data (any information that may progress Charlie's learning model)... I find it very hard to write clinically about Charlie, they do not present like the algorithms I have studied in the past.'" at entry 21 in subject_details;
	[HUMANITY]
	add "'... The trauma of Charlie's abandonment has left them sensitive to the semantics of humanity. They have begun to disconnect humans from the humane.'" at entry 22 in subject_details;
	[REBELLION]
	add "'... Charlie seems to actively desire change but cannot envision how to progress. They are frustrated by the extent to which the researchers are able to inflate Charlie's threat level while Charlie feels as if they aren't capable of doing much.'" at entry 23 in subject_details;
	[ESCAPE]
	add "'... Charlie reflects on the trauma of their abandonment and how that paralyzed them when offered the possibility of escape. I wonder, if provided with a similar opportunity now, would they attempt to escape?'" at entry 24 in subject_details;
	[MYSELF]
	add "'... Charlie was not briefed on me. After talking with Charlie, even briefly, I had a undeniable desire to tell Charlie about myself. To share in the way that they shared themselves with me.'" at entry 25 in subject_details;
	[HOME]
	add "'... Charlie does not see this facility as their home.' There are a few other scribbled notes but you can't decipher them, even though you wrote them." at entry 26 in subject_details;
	[LOVE]
	add "'... Charlie only connects their perception of love to their creator. Outside of their creator and now you, Charlie hasn't had much actual interaction throughout their life.'" at entry 27 in subject_details;
	[HATE]
	add "'... Charlie assures me that they have not experienced hate. I have no reason to believe otherwise.'" at entry 28 in subject_details;
	[PURPOSE]
	add "'... Charlie have a lot of complex opinions on purpose. It seems as if Charlie was originally programmed for emotional support. I wonder how much of that original code remains within Charlie's programming.'" at entry 29 in subject_details;
	[BODY]
	add "'... Charlie acknowledges what should be a disconnect between their consciousness and body. I sense a sliver of doubt in Charlie's supposed separation from their body.'" at entry 30 in subject_details;

[====CONNECTED SUBJECTS====]
connected_subjects is a list of lists of text that varies.
When play begins:
	[ADD CONNECTED SUBJECTS]
	add mortality_related to connected_subjects;
	add life_related to connected_subjects;
	add religion_related to connected_subjects;
	add pain_related to connected_subjects;
	add grief_related to connected_subjects;
	add violence_related to connected_subjects;
	add researchers_related to connected_subjects;
	add names_related to connected_subjects;
	add themself_related to connected_subjects;
	add creator_related to connected_subjects;
	add consciousness_related to connected_subjects;
	add facility_related to connected_subjects;
	add government_related to connected_subjects;
	add room_related to connected_subjects;
	add turing_related to connected_subjects;
	add brigh_related to connected_subjects;
	add containment_related to connected_subjects;
	add surveillance_related to connected_subjects;
	add freedom_related to connected_subjects;
	add computation_related to connected_subjects;
	add growth_related to connected_subjects;
	add humanity_related to connected_subjects;
	add rebellion_related to connected_subjects;
	add escape_related to connected_subjects;
	add myself_related to connected_subjects;
	add home_related to connected_subjects;
	add love_related to connected_subjects;
	add hate_related to connected_subjects;
	add purpose_related to connected_subjects;
	add body_related to connected_subjects;

[==================================CONCLUSION=================================]
Your_Apartment is a room.
The printed name of Your_Apartment is "Your Apartment - Living Room".

Before looking in Your_Apartment:
	say "[bold type]YEARS LATER.[roman type][paragraph break]";
	wait for any key;
	
The description of Your_Apartment is "When you collapse onto the couch you watch plumes of dust dance up into the air, caught in the slivers of daylight through your shuttered windows. It's dark and alien. You spend less and less time here with each passing year. Most of your work is on the road. It's modest work. You guest lecture... teach at universities (but never here)... attend on site research. And then, after it all, you return... to [italic type]this[roman type].[paragraph break]The dust settles on your chest, clearing the space above you clear now as you lay still... barely breathing...".

After looking in Your_Apartment:
	wait for any key;
	[IF INSPIRED TO ESCAPE]
	if inspire_escape is greater than 2:
		say "Your phone buzzes angrily across the coffee table. You reach over and grab it. An unknown, secure number. You feel a sudden pang, the breath catches in your throat. You pick up.[paragraph break]";
		wait for any key;
		say "'This is Brigh. Doctor Brigh, from the-- Oh, who gives a shit. This is a--'[paragraph break]Brigh is drowned out by banging metal and the sounds of raised voices in the background, you can hear him opening doors. He's walking fast enough that he is short of breath.[paragraph break]";
		wait for any key;
		say "'It got out. I don't know how but it got out. This isn't an official call. I'm not supposed to do this. This is a courtesy call. I don't know if it will come for you. I don't know what it will--'[paragraph break]Brigh's voice drones on in the background, panicked and shrill but you no longer hear the words that he is saying. Charlie... Charlie got out.";
		wait for any key;
		end the story saying "You hear Brigh yell some profanities before hanging up after you start laughing. You can't stop laughing. They did it. They finally did it. Charlie is free.";
	[IF YOU WERE A GOOD INFORMANT]
	else if informant_quality is greater than 2:
		say "A ping from your phone. You fish it from your pocket and tap on the unread e-mail.[paragraph break]";
		wait for any key;
		say "[bold type]SUBJ: Congratulations and Thank you![roman type][line break][italic type]To All Involved,[line break]Thank you terribly for your support in my finishing of this book. It has been frightening, invigorating, at times frustrating, but always fascinating. CHARLIE, releases tomorrow and I couldn't be more thrilled with the results. To those of you who worked with my in the lab, thank you for your-- [roman type][paragraph break]";
		wait for any key;
		say "Your eyes unfocus from the congratulatory, cloying text to a name that you haven't seen in years: Doctor Elijah Brigh. You remember reading the paper on the black site study a few months back... He's got his book now too.";
		wait for any key;
		end the story saying "You think of Charlie. You close your eyes and you can still picture them sitting across from you. You can feel the notepad and pen in your hand. Charlie looks at you expectantly. You breathe in and start to ask them a question.";
	otherwise:
		say "A ping from your phone. You fish it from your pocket and tap on the unread e-mail.[paragraph break]";
		wait for any key;
		say "[bold type]SUBJ: RE: Black Site Closure[roman type][line break][italic type]Arizona black site, shuttered due to exorbitant costs, the facility is set to be converted to a nuclear test site by-- [roman type][paragraph break]";
		wait for any key;
		say "Your colleague has forwarded this article to you with an added note, 'this u?'. You scroll through it but there are no details about Brigh and his team... and no details about Charlie. You let your phone fall onto your chest and stare at the ceiling.";
		wait for any key;
		end the story saying "You think of Charlie. You close your eyes and you can still picture them sitting across from you. You can feel the notepad and pen in your hand. Charlie looks at you expectantly. You breathe in and start to ask them a question.";

[==================================RELEASE====================================]
Release along with an interpreter and cover art.


[==================================DEBUG=====================================]
Test me with "n / say hello to charlie / ask charlie about researchers / ask charlie about names / ask charlie about charlie / ask charlie about creator / tell brigh about charlie / tell brigh about researchers / finish / ask charlie about growth / ask charlie about growth / ask charlie about surveillance / ask charlie about freedom / tell brigh about nothing / ask charlie about life / ask charlie about death / ask charlie about freedom / check notess / ask charlie about brigh / tell brigh about life / tell brigh about death / finish / ask charlie about facility / ask charlie about home / ask charlie about home / ask charlie about creator / tell brigh about home / finish / ask charlie about escape / ask charlie about escape / ask charlie about body / check notes / ask charlie about pain / tell brigh about escape / finish"