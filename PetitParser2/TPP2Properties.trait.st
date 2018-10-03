Trait {
	#name : #TPP2Properties,
	#category : 'PetitParser2-Core'
}

{ #category : #'accessing - properties' }
TPP2Properties >> hasProperty: aKey [
	"Test if the property aKey is present."
	
	^ self properties notNil and: [ self properties includesKey: aKey ]
]

{ #category : #'accessing - properties' }
TPP2Properties >> properties [
	self explicitRequirement
]

{ #category : #'accessing - properties' }
TPP2Properties >> properties: newProperties [
	self explicitRequirement
]

{ #category : #'accessing - properties' }
TPP2Properties >> propertiesCopy [
	self properties isNil ifTrue: [ ^ nil ].
	^ self properties collect: #copy
]

{ #category : #'accessing - properties' }
TPP2Properties >> propertyAt: aKey [
	"Answer the property value associated with aKey."
	
	^ self propertyAt: aKey ifAbsent: [ self error: 'Property not found' ]
]

{ #category : #'accessing - properties' }
TPP2Properties >> propertyAt: aKey ifAbsent: aBlock [
	"Answer the property value associated with aKey or, if aKey isn't found, answer the result of evaluating aBlock."
	
	^ self properties isNil
		ifTrue: [ aBlock value ]
		ifFalse: [ self properties at: aKey ifAbsent: aBlock ]
]

{ #category : #'accessing - properties' }
TPP2Properties >> propertyAt: aKey ifAbsentPut: aBlock [
	"Answer the property associated with aKey or, if aKey isn't found store the result of evaluating aBlock as new value."
	
	^ self propertyAt: aKey ifAbsent: [ self propertyAt: aKey put: aBlock value ]
]

{ #category : #'accessing - properties' }
TPP2Properties >> propertyAt: aKey put: anObject [
	"Set the property at aKey to be anObject. If aKey is not found, create a new entry for aKey and set is value to anObject. Answer anObject."

	^ (self properties ifNil: [ self properties: (IdentityDictionary new: 1) ])
		at: aKey put: anObject
]

{ #category : #'accessing - properties' }
TPP2Properties >> removeProperty: aKey [
	"Remove the property with aKey. Answer the property or raise an error if aKey isn't found."
	
	^ self removeProperty: aKey ifAbsent: [ self error: 'Property not found' ]
]

{ #category : #'accessing - properties' }
TPP2Properties >> removeProperty: aKey ifAbsent: aBlock [
	"Remove the property with aKey. Answer the value or, if aKey isn't found, answer the result of evaluating aBlock."
	
	| answer |
	self properties isNil ifTrue: [ ^ aBlock value ].
	answer := self properties removeKey: aKey ifAbsent: aBlock.
	self properties isEmpty ifTrue: [ self properties: nil ].
	^ answer
]
