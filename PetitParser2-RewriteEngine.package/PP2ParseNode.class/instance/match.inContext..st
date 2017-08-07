matching
match: parseNode inContext: aDictionary
	^ parseNode isParseNode and: [ self children = parseNode children ]