tests - javascript
testJsDoubleQuoteStringJavascript
	self parse: '"Hello World!"' rule: #jsDoubleQuoteString	.
	self parse: '"</script>"' rule: #jsDoubleQuoteString