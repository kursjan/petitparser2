as yet unclassified
testJavascriptContentString
	self parse: 'alert("foobar")' rule: #jsContent.
	self parse: 'alert("</script>")' rule: #jsContent	