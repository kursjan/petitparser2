token
identifierToken
	^ (super identifierToken
		==> [ :token | 
			(RBIdentifierToken value: token value start: token start)
				comments: token comments;
				yourself ])
		forbidCache;
		yourself