initialize
startParsing
	parser := 
		(('petit' asParser2 ==> [ :literal | Transcript crShow: 'you wrote my name!' ]) / 
		  #any asParser2
		) star. 
	
	[ parser parse: keyStream. Transcript crShow: 'parsing finished' ] fork.