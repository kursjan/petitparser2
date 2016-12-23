pillar-support
testResultFor: selector in: class
	"
		self new testResultFor: #testText in: WebGrammarTest
	"
	^ (class run: selector) passed isEmpty ifFalse: [ '[PASS]' ] ifTrue: [ '[FAIL]' ]
