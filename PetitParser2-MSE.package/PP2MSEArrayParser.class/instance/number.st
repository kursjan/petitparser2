values
number
	^ super number
	
	==> [ :token | (token value copyReplaceAll: 'E' with: 'e') asNumber ]