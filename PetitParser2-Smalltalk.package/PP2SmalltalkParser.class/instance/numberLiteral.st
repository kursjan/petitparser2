grammar-literals
numberLiteral
	^ super numberLiteral
		==> [ :token | 
			(RBLiteralValueNode
				value: (Number readFrom: token value)
				start: token start
				stop: token stop
				source: token value)
				comments: token comments;
				yourself ]