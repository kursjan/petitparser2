tests - guards
testGuardStar
	| parser wrappedOne result |

	wrappedOne := $a asPParser wrapped trim flatten. 
	parser := wrappedOne star.
	parser optimize.
	parser enableDebug.

	result := self assert: parser parse: 'a' to: #('a') end: 1.
	self assert: result debugResult steps equals: 13.