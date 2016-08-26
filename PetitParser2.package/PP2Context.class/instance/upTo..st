stream mimicry
upTo: character
	| start end |

	start := position + 1.
	end := stream indexOf: character startingAt: start.

	^ (self setPosition: end)
		retval: (stream copyFrom: start to: end);
		yourself