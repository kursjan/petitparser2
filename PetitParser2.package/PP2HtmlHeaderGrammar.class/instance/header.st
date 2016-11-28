rules
header
	^ '<head>' asPParser, #any asPParser starLazy, '</head>' asPParser
	
	map: [ :_begin :_content :_end |
		(_content inject: (WriteStream on: '') into: [ :stream :char | stream nextPut: char. stream ]) 			contents
	]
