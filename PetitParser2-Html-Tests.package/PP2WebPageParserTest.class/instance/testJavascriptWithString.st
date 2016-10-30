tests
testJavascriptWithString
	super testJavascriptWithString.
	
	self assert: result isKindOf: JavascriptElement.
	self assert: result code equals: 'alert("</script>")'