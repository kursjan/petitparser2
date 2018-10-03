Extension { #name : #PP2Node }

{ #category : #'*PetitParser2-RewriteEngine' }
PP2Node >> enablePatternMatching [
	self allNodesDo: [ :child | child strategy: child strategy patternMatching ]
]

{ #category : #'*PetitParser2-RewriteEngine' }
PP2Node >> parseNode [
	^ PP2CreateParseNode on: self
]

{ #category : #'*PetitParser2-RewriteEngine' }
PP2Node >> parseNode: aClass [
	^ (PP2CreateParseNode on: self)
		nodeClass: aClass;
		yourself
]

{ #category : #'*PetitParser2-RewriteEngine' }
PP2Node >> parseToken [
	^ PP2CreateTokenNode on: self
]
