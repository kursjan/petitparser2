as yet unclassified
pairs
	^ pair , (newline , pair ==> [:token | token second ]) star, newline star
	
	==> [:token | 
		((OrderedCollection with: token first) addAll: token second; yourself) asArray ]