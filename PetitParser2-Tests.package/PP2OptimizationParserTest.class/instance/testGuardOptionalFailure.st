tests - guards
testGuardOptionalFailure
	|  wrappedOne parser result |

	wrappedOne := $a asPParser wrapped trim flatten.
	parser := wrappedOne optional.
	parser optimize.
	parser enableDebug.

	result := self assert: parser parse: 'c' to: nil end: 0.
	self assert: result debugResult steps equals: 2