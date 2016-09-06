private
assert: aNode format: aString
	aNode isCollection
		ifFalse: [ ^ self assert: (Array with: aNode) format: (Array with: aString) ].
	self assert: aNode size equals: aString size.
	aNode with: aString do: [ :node :string | self assert: (BIConfigurableFormatter format: node) equals: string ]