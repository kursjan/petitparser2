Class {
	#name : #PP2MSEArrayParser,
	#superclass : #PP2MSEGrammar,
	#category : 'PetitParser2-MSE'
}

{ #category : #accessing }
PP2MSEArrayParser >> attribute [
	^ super attribute 
	
	==> [:token | Array with: (token at: 2) with: (token at: 3) ]
]

{ #category : #accessing }
PP2MSEArrayParser >> attributeValue [
	^ super attributeValue
	
	==> [ :tokens | 
		    (tokens size > 1 or: [ tokens isEmpty ]) 	
				ifTrue: [ tokens asArray ] 
				ifFalse: [ tokens first ]]
]

{ #category : #values }
PP2MSEArrayParser >> boolean [ 
	^ super boolean 
	
	==> [:token | token value = 'true' ifTrue: [true] ifFalse: [token value = 'false' ifTrue: [false] ifFalse: [nil]]] 
]

{ #category : #accessing }
PP2MSEArrayParser >> element [
	^ super element
	
	==> [:token | Array with: (token at: 2) with: (token at: 3) with: (token at: 4) asArray ]
]

{ #category : #accessing }
PP2MSEArrayParser >> elementName [
	^ super elementName
	
	==> [:token | token value ]
]

{ #category : #accessing }
PP2MSEArrayParser >> elements [
	^ super elements
	
	==> [:token | token second asArray ]
]

{ #category : #accessing }
PP2MSEArrayParser >> id [
	^ super id
	
	==> [:token | Array with: 'id' with: (token at: 3) value asNumber ]
]

{ #category : #values }
PP2MSEArrayParser >> integerReference [ 
	^ super integerReference

	==> [:token | Array with: 'ref' with: token "(token at: 3) asNumber" ]
]

{ #category : #values }
PP2MSEArrayParser >> nameReference [ 
	^ super nameReference

	==> [:token | Array with: 'ref' with: token ]
]

{ #category : #values }
PP2MSEArrayParser >> natural [
	^ super natural
	
	==> [ :token | token value asNumber ]
]

{ #category : #values }
PP2MSEArrayParser >> number [
	^ super number
	
	==> [ :token | (token value copyReplaceAll: 'E' with: 'e') asNumber ]
]

{ #category : #values }
PP2MSEArrayParser >> primitive [ 
	^ super primitive
]

{ #category : #accessing }
PP2MSEArrayParser >> simpleName [
	^ super simpleName
	
	==> [:token | token value ]
]

{ #category : #values }
PP2MSEArrayParser >> string [
	^ super string
		
	==> [ :token | token second ]
]

{ #category : #basic }
PP2MSEArrayParser >> stringText [
	^ super stringText
	
	==> [:token | 
		 token value
			copyReplaceAll: ''''''
			with: '''' ]
]
