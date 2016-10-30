tests - element
testElClose
	self context defaultStack push: 'foo'.
	self parse: '</foo>' rule: #elClose