values
integerReference 
	^ super integerReference

	==> [:token | Array with: 'ref' with: token "(token at: 3) asNumber" ]