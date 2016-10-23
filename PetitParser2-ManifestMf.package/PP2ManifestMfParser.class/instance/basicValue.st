as yet unclassified
basicValue
	^ oneLinerBasicValue , ((newline , #space asPParser) , oneLinerBasicValue ==> #last) star
	
	==> [:token | 
		((OrderedCollection with: token first inspect) addAll: token second; yourself) asArray ]