stream mimicry
upToEnd
	| start end |
	end := start := position + 1.
	
	[ stream atEnd: end ] whileFalse: [ end := end + 1 ].
	^ (self setPosition: end)
		retval: (stream copyFrom: start to: end);
		yourself.