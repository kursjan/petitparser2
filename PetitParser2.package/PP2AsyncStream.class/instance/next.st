minimal interface
next
	| delay |
	delay := Delay forMilliseconds: 50.
	
	[ queue isEmpty] whileTrue: [ delay wait  ].
	^  queue removeFirst