grammar-literals
symbolLiteralArray
	^ super symbolLiteralArray
		==> [ :token | 
			(RBLiteralValueNode 
				value: (self buildString: token value) asSymbol 
				start: token start 
				stop: token stop)
				comments: token comments;
				yourself ]