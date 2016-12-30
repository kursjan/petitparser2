tests
testJavascriptWithString
	self parse: '<script>alert(''</script>'')</script>' rule: #javascript
