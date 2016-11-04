tests - guards
testGuardOptional
	|  wrappedOne parser result |

	wrappedOne := $a asPParser wrapped trim flatten.
	parser := wrappedOne optional.
	parser optimize.
	parser enableDebug.

	result := self assert: parser parse: 'a' to: 'a' end: 1.
	self assert: result debugResult steps equals: 8