grammar-blocks
blockBody
	^ super blockBody
		==> [ :nodes | 
			| result |
			result := RBBlockNode arguments: nodes first first body: nodes last.
			nodes first last ifNotNil: [ result bar: nodes first last start ].
			result ]