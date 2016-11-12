tests
testJavascriptWithString
	super testJavascriptWithString.
	
	self assert: result isKindOf: PP2JavascriptElement.
	self assert: result code equals: 'alert("</script>")'