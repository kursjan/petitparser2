grammar-messages
unaryExpression
	^ super unaryExpression map: [ :receiverNode :messageNodes | self build: receiverNode messages: messageNodes ]