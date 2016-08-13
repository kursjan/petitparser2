tests - context interface
testAtEnd
	"
		TODO JK: change the indexing of to start from 1?
	"
	stream := PP2Stream on: ''. 
	self assert: (stream atEnd: 0).
	self assert: (stream atEnd: 1).


	stream := PP2Stream on: 'f'. 
	self assert: (stream atEnd: 0) not.
	self assert: (stream atEnd: 1).
	self assert: (stream atEnd: 2).
