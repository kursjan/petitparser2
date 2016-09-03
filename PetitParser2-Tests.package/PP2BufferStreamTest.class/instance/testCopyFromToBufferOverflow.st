tests - context interface
testCopyFromToBufferOverflow
	| stream |

	stream := self streamOn: 'bar' bufferSize:2.

	self assert: (stream copyFrom: 2 to: 3) equals: 'ar'