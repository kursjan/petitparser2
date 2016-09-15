building
compose
	"self open"
	self title: self defaultTitle.
	self tabulator with: [ :tabulator | 
		tabulator 
			column: #classes;
			column: #parser span: 3.
		tabulator transmit to: #classes; andShow: [:a | 
			self classesIn: a ]. 
		tabulator transmit to: #parser; from: #classes; andShow: [:a | 
			a custom: PP2ParserBrowser new noTitle ]
	]