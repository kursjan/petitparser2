support
visitUnguarded: node
	^ self visit: node guardedWith: anythingClassification 