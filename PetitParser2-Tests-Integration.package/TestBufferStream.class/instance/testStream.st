as yet unclassified
testStream
	"Test with stream that provides only atEnd and next:"

	parser := $a asParser2, $a asParser2.
	stream := MinimalStream on: 'aa'.
	
	self assert: (parser parse: 'aa') isPetit2Success.
	
"
	JK: to use with Mocketry?	
	[ :mockedStream |
		[ 
			self assert: (parser parse: (PP2BufferStream on: mockedStream)) isPetit2Success.		
		] should lenient satisfy: [ 
			(mockedStream atEnd willReturn: false) useArbitrarily.
			(mockedStream next willReturn: $a) useArbitrarily.
		]
	] runScenario.
"