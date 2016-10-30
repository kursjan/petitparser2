tests
testRawText
	super testRawText.
	
	self assert: result isKindOf: HtmlText.
	self assert: result text equals: 'foobar'.