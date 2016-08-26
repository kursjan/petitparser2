grammar-messages
unaryMessage
	^ unaryToken ==> [ :node | 
		Array 
			with: (Array with: node)
			with: Array new ]