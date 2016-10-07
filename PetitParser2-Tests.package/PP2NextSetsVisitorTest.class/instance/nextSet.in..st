accessing
nextSet: node in: root
	visitor visit: root.
	^ nextSet := visitor nextSets at: node