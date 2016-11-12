tests
testRawText
	super testRawText.
	
	self assert: result isKindOf: PP2HtmlText.
	self assert: result text equals: 'foobar'.