initialization
reset: newContext
	(root ~= newContext parser) ifTrue: [  
		self updateForRoot: newContext parser
	]