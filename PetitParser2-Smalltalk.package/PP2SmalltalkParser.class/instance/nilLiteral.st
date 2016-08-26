grammar-literals
nilLiteral
	^ super nilLiteral
		==> [ :token | 
			(RBLiteralValueNode 
				value: nil 
				start: token start 
				stop: token stop)
				comments: token comments;
				yourself ]