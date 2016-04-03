as yet unclassified
testChoice
	| parser |
	parser := $a asParser2 // $b asParser2.
	
	self assert: parser parse: 'a'.
	self assert: parser parse: 'b'.
	self assert: parser fail: 'c'.