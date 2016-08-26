grammar-literals
trueLiteral
	^ super trueLiteral
		==> [ :token | 
			(RBLiteralValueNode value: true start: token start stop: token stop)
				comments: token comments;
				yourself ]