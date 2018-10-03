Extension { #name : #PP2CreateParseNodeStrategy }

{ #category : #'*PetitParser2-RewriteEngine' }
PP2CreateParseNodeStrategy >> patternMatching [
	^ PP2PatternStrategy on: self
]
