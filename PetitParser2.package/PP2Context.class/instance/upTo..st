stream mimicry
upTo: character
	| start |
	start := position + 1.
	position := stream indexOf: character startingAt: start.

	^ stream copyFrom: start to: position