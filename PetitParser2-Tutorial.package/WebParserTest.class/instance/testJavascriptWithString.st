tests
testJavascriptWithString
	super testJavascriptWithString.
	
	self assert: result code equals: 'alert(''</script>'')'
