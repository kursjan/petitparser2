basic
stringText
	^ super stringText
	
	==> [:token | 
		 token value
			copyReplaceAll: ''''''
			with: '''' ]