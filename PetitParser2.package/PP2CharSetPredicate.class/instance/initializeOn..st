initialization
initializeOn: aBlock
	block := aBlock.
	classification := Array new: 255.
	1 to: classification size do: [ :index |
		classification at: index put: (block
			value: (Character codePoint: index)) ]