Extension { #name : #PP2CreateToken }

{ #category : #'*PetitParser2-RewriteEngine' }
PP2CreateToken >> patternMatching [
	^ PP2PatternStrategy on: self
]
