streams
testPP2BufferStream
	| validator |
	validator := PP2BufferStreamValidator new.
	validator validateBlocking.
	
	self assert: validator report precision equals: 1.
	self assert: validator report recall equals: 1.