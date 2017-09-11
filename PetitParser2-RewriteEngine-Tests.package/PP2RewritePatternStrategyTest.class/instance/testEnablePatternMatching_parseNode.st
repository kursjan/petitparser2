initialization
testEnablePatternMatching_parseNode
	| patternMatchingStrategy |

	patternMatchingStrategy := createParseNodeStrategy patternMatching.
	
	self assert: patternMatchingStrategy patternMatching == patternMatchingStrategy.
	self assert: patternMatchingStrategy isKindOf: PP2PatternStrategy.
	self assert: patternMatchingStrategy strategy == createParseNodeStrategy.