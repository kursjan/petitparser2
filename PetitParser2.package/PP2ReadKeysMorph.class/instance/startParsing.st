initialize
startParsing
	parser := 
		(('petit' asPParser ==> [ :literal | 
				outputStream nextPutAll: '<<<!!!You wrote my name!!!>>>' ]) / 
		  #any asPParser
		) star. 
	
	[ 	
		Transcript crShow: 'parsing'. 
		parser parse: keyStream. 
		Transcript crShow: 'parsing finished' 
	] fork.