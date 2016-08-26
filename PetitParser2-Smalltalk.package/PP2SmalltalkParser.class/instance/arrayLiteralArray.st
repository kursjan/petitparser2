grammar-literals
arrayLiteralArray
	^ super arrayLiteralArray
		==> [ :nodes | 
			RBLiteralArrayNode
				startPosition: nodes first start
				contents: nodes second
				stopPosition: nodes last start
				isByteArray: false ]