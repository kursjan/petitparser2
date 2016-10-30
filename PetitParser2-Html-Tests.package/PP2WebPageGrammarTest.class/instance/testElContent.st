tests - element
testElContent
	self parse: '' rule: #elContent.
	self parse: 'foobar' rule: #elContent.
	self parse: '<script type="text/javascript">eh</script>' rule: #elContent.