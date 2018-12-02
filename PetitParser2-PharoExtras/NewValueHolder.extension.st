Extension { #name : #NewValueHolder }

{ #category : #'*PetitParser2-PharoExtras' }
NewValueHolder >> asArray [

	"We need to extend the NewValueHolder with this message because we are adding Object>>#asArray"

	^ self value asArray
]
