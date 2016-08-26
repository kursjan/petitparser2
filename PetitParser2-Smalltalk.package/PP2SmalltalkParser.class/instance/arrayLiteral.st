grammar-literals
arrayLiteral
	^ super arrayLiteral
		==> [ :nodes | 
			RBLiteralArrayNode
				startPosition: nodes first start
				contents: nodes second
				stopPosition: nodes last start
				isByteArray: false ]