primitives
number
	^ ($- asPParser optional , #digit asPParser) and , [ :context | 
		[ | stream retval |
			stream := context asPositionableStream.
		  	retval := (NumberParser on: stream) nextNumber.
			(context setPosition: stream position)
				returnValue: retval;
				yourself
		] on: Error do: [ :err | context failure: err messageText ] 
	] asPParser