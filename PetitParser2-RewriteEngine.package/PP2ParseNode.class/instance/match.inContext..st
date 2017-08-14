matching
match: parseNode inContext: aDictionary
	^ parseNode isParseNode
		and: [ self children size = parseNode children size
				and: [ self children
						with: parseNode children
						do: [ :first :second | 
							(first match: second inContext: aDictionary)
								ifFalse: [ ^ false ] ].
					true ] ]