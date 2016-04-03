tests
testUncheckedNext
	stream := PP2BufferStream on: (ReadStream on: 'foo'). 
	
	self assert: stream uncheckedNext = $f.
	self assert: stream uncheckedNext = $o.
	self assert: stream uncheckedNext = $o.
	self should: [ stream uncheckedNext ] raise: Exception.