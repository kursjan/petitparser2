grammar-literals
byteLiteral
	^ super byteLiteral
		==> [ :nodes | 
			RBLiteralArrayNode
				startPosition: nodes first start
				contents: nodes second
				stopPosition: nodes last start
				isByteArray: true ]