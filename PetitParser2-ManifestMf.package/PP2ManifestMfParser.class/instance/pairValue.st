as yet unclassified
pairValue
	^ oneLinerBasicValue , ((valueSeparator , oneLinerBasicValue) ==> [:token | token last] ) star
	
	==> [:token | 
		((OrderedCollection with: token first) addAll: token last; yourself) asArray ]