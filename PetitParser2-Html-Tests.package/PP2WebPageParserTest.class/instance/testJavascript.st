tests
testJavascript
	super testJavascript.
	
	self assert: result isKindOf: PP2JavascriptElement.
	self assert: result code equals: 'alert(1+2)'