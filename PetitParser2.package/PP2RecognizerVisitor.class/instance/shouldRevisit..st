accessing
shouldRevisit: node
	^ ((self parentsFor: node) includes: self parent) not