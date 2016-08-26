token
unaryToken
	^ super unaryToken
		==> [ :token | 
			(RBIdentifierToken value: token value start: token start)
				comments: token comments;
				yourself ]