Class {
	#name : #PP2JsonParser,
	#superclass : #PP2JsonGrammar,
	#category : #'PetitParser2-JSON'
}

{ #category : #grammar }
PP2JsonParser >> array [
	^ super array ==> [ :nodes | Array withAll: (nodes second ifNil: [ #() ]) ]
]

{ #category : #primitives }
PP2JsonParser >> charEscape [
	^ super charEscape ==> [ :nodes | CharacterTable at: nodes last ]
]

{ #category : #primitives }
PP2JsonParser >> charOctal [
	^ super charOctal ==> [ :nodes |
		Character value: (nodes last allButFirst
			inject: nodes last first digitValue
			into: [ :result :each | (result << 4) + each digitValue ]) ]
]

{ #category : #grammar }
PP2JsonParser >> elements [
	^ super elements ==> [ :nodes | nodes reject: [ :each | each isToken ] ]
]

{ #category : #tokens }
PP2JsonParser >> falseToken [
	^ super falseToken ==> [ :token | false ]
]

{ #category : #grammar }
PP2JsonParser >> members [
	^ super members ==> [ :nodes | nodes reject: [ :each | each isToken ] ]
]

{ #category : #tokens }
PP2JsonParser >> nullToken [
	^ super nullToken  ==> [ :token | nil ]
]

{ #category : #tokens }
PP2JsonParser >> numberToken [
	^ super numberToken ==> [ :token | (token value copyWithout: $+) asLowercase asNumber ]
]

{ #category : #grammar }
PP2JsonParser >> object [
	^ super object ==> [ :nodes |
		(nodes second ifNil: [ #() ])
			inject: Dictionary new
			into: [ :result :each | 
				result
					add: each;
					yourself ] ]
]

{ #category : #grammar }
PP2JsonParser >> pair [
	^ super pair map: [ :key :sep :val | key -> val ]
]

{ #category : #tokens }
PP2JsonParser >> stringToken [
	^ string trim ==> [ :nodes | String withAll: nodes second ]
]

{ #category : #tokens }
PP2JsonParser >> trueToken [
	^ super trueToken ==> [ :token | true ]
]
