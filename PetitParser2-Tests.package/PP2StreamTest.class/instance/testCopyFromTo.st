tests - context interface
testCopyFromTo
	stream := PP2Stream on: 'bar'.

	"
		((ReadStream on: 'bar') asPetit2Stream) copyFrom: 0 to: 2
	"

	self assert: (stream copyFrom: 1 to: 1) = 'b'.
	self assert: (stream copyFrom: 1 to: 3) = 'bar'.
