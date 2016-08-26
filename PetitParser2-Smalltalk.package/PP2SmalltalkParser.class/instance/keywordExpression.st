grammar-messages
keywordExpression
	^ super keywordExpression map: [ :receiveNode :messageNode | self build: receiveNode messages: (Array with: messageNode) ]