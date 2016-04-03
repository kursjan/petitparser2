tests
testCopyFromTo
	stream := PP2BufferStream on: (ReadStream on: 'bar').

	"
		((ReadStream on: 'bar') asPetit2Stream) copyFrom: 0 to: 2
	"

	self assert: (stream copyFrom: 0 to: 0) = 'b'.
	self assert: (stream copyFrom: 0 to: 2) = 'bar'.
