as yet unclassified
allElements
	| result |
	result := OrderedCollection new.
	self allElementsDo: [ :parser | result addLast: parser ].
	^ result