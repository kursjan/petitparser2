grammar-messages
cascadeExpression
	^ super cascadeExpression map: [ :receiverNode :messageNodes | self build: receiverNode cascade: messageNodes ]