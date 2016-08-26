grammar-messages
binaryExpression
	^ super binaryExpression map: [ :receiverNode :messageNodes | self build: receiverNode messages: messageNodes ]