initialize
startParsing
	parser := 
		(('petit' asParser2 ==> [ :literal | 
				outputStream nextPutAll: '<<<!!!You wrote my name!!!>>>' ]) / 
		  #any asParser2
		) star. 
	
	[ 	
		Transcript crShow: 'parsing'. 
		parser parse: keyStream. 
		Transcript crShow: 'parsing finished' 
	] fork.