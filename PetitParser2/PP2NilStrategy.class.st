"
Null-object pattern for the PP2Strategy
"
Class {
	#name : #PP2NilStrategy,
	#superclass : #PP2AbstractStrategy,
	#category : 'PetitParser2-Strategies'
}

{ #category : #accessing }
PP2NilStrategy >> displayName [
	^ 'nil'
]

{ #category : #accessing }
PP2NilStrategy >> node [
	^ nil
]
