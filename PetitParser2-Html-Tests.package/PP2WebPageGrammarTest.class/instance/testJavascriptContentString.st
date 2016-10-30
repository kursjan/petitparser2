tests - javascript
testJavascriptContentString
	self parse: 'alert("foobar")' rule: #jsContent.
	self parse: 'alert("</script>")' rule: #jsContent	