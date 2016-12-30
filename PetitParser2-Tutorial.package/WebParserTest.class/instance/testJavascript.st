tests
testJavascript
	super testJavascript.
	
	self assert: result code equals: 'alert("hi there!")'
