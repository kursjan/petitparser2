Class {
	#name : #PP2Sequence,
	#superclass : #PP2Strategy,
	#category : 'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2Sequence >> parseOn: context [
	| retval elements memento |

	memento := self remember: context.
	elements := Array new: node children size.
	
	1 to: elements size do: [ :index |
		retval := (node childAt: index) parseOn: context.
		retval isPetit2Failure ifTrue: [ 
			self restore: context from: memento. 
			^ retval
		].
		elements at: index put: retval 
	].
	
	^ elements
]
