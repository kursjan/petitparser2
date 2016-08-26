grammar-literals
byteLiteralArray
	^ super byteLiteralArray
		==> [ :nodes | 
			RBLiteralArrayNode
				startPosition: nodes first start
				contents: nodes second
				stopPosition: nodes last start
				isByteArray: true ]