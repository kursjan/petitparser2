initialization
testEnablePatternMatching
	| patternMatchingStrategy |

	patternMatchingStrategy := strategy patternMatching.
	
	self assert: patternMatchingStrategy == strategy.
	self assert: patternMatchingStrategy isKindOf: strategy class.