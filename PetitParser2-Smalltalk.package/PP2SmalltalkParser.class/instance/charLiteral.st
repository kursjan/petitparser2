grammar-literals
charLiteral
	^ super charLiteral
		==> [ :token | 
			(RBLiteralValueNode 
				value: token value second 
				start: token start 
				stop: token stop)
				comments: token comments;
				yourself ]