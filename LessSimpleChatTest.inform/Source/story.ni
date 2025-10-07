"Less Simple Chat" by Victor Gijsbers

Include Simple Chat by Mark Tilford.

Talking to is an action applying to one visible thing.

Understand "talk to [someone]" as talking to.
Report talking to: say "You have nothing to say.".

When play begins:
	forbid exiting on zero.

Living room is a room. Harry is a man in Living Room.

Finnegans Wake is a thing. Harry carries Finnegans Wake.

Chat-hello-Harry, chat-book, chat-I-want-it, chat-I-do-not-want-it, chat-fire, chat-goodbye and chat-again are chat nodes. 

Chat-book is sc-once. [We can choose this option only once.] Chat-fire is sc-shown-once. [We must choose it immediately or we can never choose it again.] Chat-again is sc-inactive. [This is only shown once it has been activated.] 

Instead of talking to Harry: run a conversation from chat-hello-harry.

Report giving text for chat-hello-harry: instead say "Harry looks up as you approach him.".
Carry out finding responses to chat-hello-harry: link to chat-book; link to chat-fire; link to chat-again; link to chat-goodbye.

Report giving link to chat-book: instead say "'What was that book you told me about?' ".
Report giving text for chat-book: instead say "'It's by some guy called Finnegan Wake, and I think it's in Irish or something. Do you want it?'".
Carry out finding responses to chat-book: link to chat-I-want-it; link to chat-I-do-not-want-it.

Report giving link to chat-I-want-it: instead say "'Sure.' ".
Report giving text for chat-I-want-it: move Finnegans Wake to player; instead say "Harry hands the book to you.".
Carry out finding responses to chat-I-want-it: try finding responses to chat-hello-harry instead.

Report giving link to chat-I-do-not-want-it: instead say "'No, thanks.' ".
Report giving text for chat-I-do-not-want-it: instead say "Harry sighs. 'I'm never going to get rid of it.'".
Carry out finding responses to chat-I-do-not-want-it: try finding responses to chat-hello-harry instead.

Report giving link to chat-fire: instead say "'Run! Fire!' ".
Report giving text for chat-fire: instead say "'We are only pixels on a two-dimensional screen. There is nowhere to run to.' Harry's words shatter the fourth wall.".
Carry out finding responses to chat-fire: try finding responses to chat-hello-harry instead

Report giving link to chat-again: instead say "'Didn't we have this conversation before?' ".
Report giving text for chat-again: instead say "'The world is one big circle, and we are doomed to repeat ourselves.'".
Carry out finding responses to chat-again: try finding responses to chat-hello-harry instead.

Report giving link to chat-goodbye: instead say "'See you later, Harry.' ".
Report giving text for chat-goodbye: activate chat-again; instead say "'Later!'".

Test me with "talk to harry / 1 / 1 / 1 / i / talk to harry / 1 / 4 / 2".
