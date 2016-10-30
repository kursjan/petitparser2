tests
testJavascript
	super testJavascript.
	
	self assert: result isKindOf: JavascriptElement.
	self assert: result code equals: 'alert(1+2)'