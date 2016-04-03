tests
testPeek
	stream := PP2BufferStream on: (ReadStream on: 'foo'). 
	
	"no peek for the stream"
	
	"
	self assert: stream peek = $f.
	stream  next.
	self assert: stream peek = $o.
	stream  next.
	self assert: stream peek = $o.
	stream  next.
	self assert: stream peek = nil.
	"