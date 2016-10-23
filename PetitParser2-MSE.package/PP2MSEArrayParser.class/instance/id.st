accessing
id
	^ super id
	
	==> [:token | Array with: 'id' with: (token at: 3) value asNumber ]