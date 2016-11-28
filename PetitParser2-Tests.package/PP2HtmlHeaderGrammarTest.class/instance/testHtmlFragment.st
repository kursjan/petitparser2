tests
testHtmlFragment
	self parse: '<html><head>foobar</head></html>' rule: #htmlFragment to: 'foobar' end: 25