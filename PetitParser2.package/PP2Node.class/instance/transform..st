transforming
transform: aBlock
	^ self transform: aBlock suchThat: [ :node | true ]