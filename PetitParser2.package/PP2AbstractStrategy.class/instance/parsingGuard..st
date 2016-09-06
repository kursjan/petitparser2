conversion
parsingGuard: classification
	^ (PP2ParsingGuard on: self)
		classification: classification;
		retval: (PP2Failure message: 'Early failure, no first set character found')
		yourself