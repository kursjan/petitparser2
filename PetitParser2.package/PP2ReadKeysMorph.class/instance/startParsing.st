initialize
startParsing
	parser := 
		(('petit' asPParser ==> [ :literal | 
				GrowlMorph openWithLabel: '"petit" detected' contents: '' ]) / 
		  #any asPParser
		) star. 
	
	[ 	
		Transcript crShow: 'parsing'. 
		parser parse: keyStream. 
		Transcript crShow: 'parsing finished' 
	] fork.