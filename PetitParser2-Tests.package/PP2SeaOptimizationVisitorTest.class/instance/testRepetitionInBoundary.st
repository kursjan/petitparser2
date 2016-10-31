tests
testRepetitionInBoundary
	sea := $a asPParser sea.
	parser := sea, $b asPParser plus.
	
	self visit: parser.
	self assert: sea beforeWater boundaryElements noneSatisfy: [ :e | e isRepeating ].	
	self assert: sea afterWater boundaryElements noneSatisfy: [ :e | e isRepeating ].