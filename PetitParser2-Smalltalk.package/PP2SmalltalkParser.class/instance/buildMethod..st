private
buildMethod: aMethodNode
	self flag: 'check this one thoroughly as it is unclear if the changes preserve 
	the original behavior from before the AST refactoring '.
"	aMethodNode selectorParts 
		do: [ :each | aMethodNode addComments: each comments ].
"	aMethodNode arguments
		do: [ :each | aMethodNode addComments: each comments ].
	aMethodNode pragmas do: [ :aPragma |
		aMethodNode addComments: aPragma comments.
		aMethodNode addComments: aPragma comments.
		aPragma arguments do: [ :each | 
			each isLiteralArray
				ifFalse: [ aMethodNode addComments: each comments ] ].
		aPragma comments: #() ].
	^ aMethodNode