utility
loremIpsum: size
	"Return a mostly random multi-paragraph filler string of the specified size.
	The result is pure ASCII, uses CR for newlines and no dots and newlines."
	
	"
	PPValidatorSources new loremIpsum: 2048
	"
	
	| words out |
	words := (self loremIpsum findTokens: ' ') collect: #asLowercase.
	(out := LimitedWriteStream on: (String new: size withAll: Character space))
		setLimit: size - 2 
		limitBlock: [ 
			^ out originalContents 
				at: size put: Character cr; 
				yourself ].
	[ 
		out << self loremIpsum; cr; cr.
		5 atRandom timesRepeat: [
			15 atRandom timesRepeat: [
	 			out << words atRandom capitalized.
				20 atRandom timesRepeat: [ out space; << words atRandom ].
				out space ].
			out cr; cr ] ] repeat