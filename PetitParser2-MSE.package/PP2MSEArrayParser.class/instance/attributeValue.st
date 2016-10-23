accessing
attributeValue
	^ super attributeValue
	
	==> [ :tokens | 
		    (tokens size > 1 or: [ tokens isEmpty ]) 	
				ifTrue: [ tokens asArray ] 
				ifFalse: [ tokens first ]]