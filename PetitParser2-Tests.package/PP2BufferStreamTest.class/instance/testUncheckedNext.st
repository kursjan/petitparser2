tests
testUncheckedNext
	| stream |
	stream := self streamOn: 'foo'. 
	
	self assert: stream uncheckedNext = $f.
	self assert: stream uncheckedNext = $o.
	self assert: stream uncheckedNext = $o.
	self should: [ stream uncheckedNext ] raise: Exception.