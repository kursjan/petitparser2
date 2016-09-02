conversion
choiceAlternativeGuard: classification
	^ (PP2ParsingGuard on: self)
		classification: classification;
		yourself