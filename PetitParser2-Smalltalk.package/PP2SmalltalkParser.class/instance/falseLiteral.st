grammar-literals
falseLiteral
	^ super falseLiteral
		==> [ :token | 
			(RBLiteralValueNode 
				value: false 
				start: token start 
				stop: token stop)
				comments: token comments;
				yourself ]