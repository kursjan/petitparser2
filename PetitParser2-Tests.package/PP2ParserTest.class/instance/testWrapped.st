test - parsing
testWrapped
	| parser |
	parser := $a asParser2 wrapped.
	
	self assert: parser parse: 'a' to: $a.
	self assert: parser fail: 'b'.
	
	parser := (($a asParser2 , $b asParser2 ) wrapped , $c asParser2).
	self assert: parser parse: 'abc' to: #(#($a $b) $c)