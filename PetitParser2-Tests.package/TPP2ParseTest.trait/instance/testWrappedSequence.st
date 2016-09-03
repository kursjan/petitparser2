test
testWrappedSequence
	| parser |

	parser := (($a asParser2 , $b asParser2 ) wrapped , $c asParser2).
	self assert: parser parse: 'abc' to: #(#($a $b) $c)