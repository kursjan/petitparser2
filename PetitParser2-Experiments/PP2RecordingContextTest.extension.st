Extension { #name : #PP2RecordingContextTest }

{ #category : #'*PetitParser2-Experiments-Reparsing' }
PP2RecordingContextTest >> testFurthestPosition [
	| context parser |
	context := 'a' asReparsableContext.
	parser := $a asPParser.
	parser parseWithContext: context.
	
	self assert: context furthestPosition equals: 1.
]

{ #category : #'*PetitParser2-Experiments-Reparsing' }
PP2RecordingContextTest >> testFurthestPositionBactrack [
	| parser context |
	parser := 'a' asPParser star, 'b' asPParser.
	context := parser parseWithContext: 'aaaac' asReparsableContext.

	self assert: context furthestPosition equals: 5.
]

{ #category : #'*PetitParser2-Experiments-Reparsing' }
PP2RecordingContextTest >> testFurthestPositionLiteralChoice [
	| context parser |
	context := 'a' asReparsableContext.
	parser := 'aaa' asPParser / 'a' asPParser.
	parser parseWithContext: context.
	
	self assert: context furthestPosition equals: 3.
]
