Extension { #name : #SmaCCRewriteRuleFileParser }

{ #category : #'*PetitParser2-RewriteEngine' }
SmaCCRewriteRuleFileParser >> lookupClass: aSmaCCToken [
	| string block |
	string := aSmaCCToken value.
	block := [ :each | 
	each name asString = string
		ifTrue: [ ^ each ] ].
	SmaCCParseNode withAllSubclasses do: block.
	SmaCCParser allSubclassesDo: block.
	
	PP2ParseNode withAllSubclassesDo: block.
	PP2CompositeNode allSubclassesDo: block.
	^ nil
]
