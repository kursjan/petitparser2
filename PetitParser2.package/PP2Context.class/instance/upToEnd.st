stream mimicry
upToEnd
	| start |
	start := position.
	
	[ stream atEnd: position ] whileFalse: [ position := position + 1 ].
	^ stream copyFrom: start + 1 to: position