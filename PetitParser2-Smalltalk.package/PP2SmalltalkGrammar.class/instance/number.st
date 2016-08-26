primitives
number
	^ ($- asParser2 optional , #digit asParser2) and , [ :context | 
		[ | stream retval |
			stream := context asPositionableStream.
		  	retval := (NumberParser on: stream) nextNumber.
			(context setPosition: stream position)
				retval: retval;
				yourself
		] on: Error do: [ :err | context failure: err messageText ] 
	] asParser2