test
testWrappedSequence
	| parser |

	parser := (($a asPParser , $b asPParser ) wrapped , $c asPParser).
	self assert: parser parse: 'abc' to: #(#($a $b) $c)