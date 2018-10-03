Class {
	#name : #PP2AbstractStrategy,
	#superclass : #Object,
	#category : 'PetitParser2-Strategies'
}

{ #category : #conversion }
PP2AbstractStrategy >> cache [

	^ PP2Cache on: self
]

{ #category : #conversion }
PP2AbstractStrategy >> debug [
	^ PP2DebuggingStrategy on: self
]

{ #category : #analysis }
PP2AbstractStrategy >> includesCache [
	^ self allChildren anySatisfy: [ :s | s isCache ]
]

{ #category : #testing }
PP2AbstractStrategy >> isCache [
	^ false
]

{ #category : #testing }
PP2AbstractStrategy >> isDebugging [
	^ false
]

{ #category : #testing }
PP2AbstractStrategy >> isMemoized [
	^ false
]

{ #category : #testing }
PP2AbstractStrategy >> isRecording [
	^ false
]

{ #category : #testing }
PP2AbstractStrategy >> isReparsable [
	^ false
]

{ #category : #conversion }
PP2AbstractStrategy >> memoize [
	^ PP2Packrat on: self
]

{ #category : #conversion }
PP2AbstractStrategy >> parsingGuard: classification [
	^ (PP2ParsingGuard on: self)
		classification: classification;
		retval: (PP2Failure message: 'Early failure, no first set character found')
		yourself
]

{ #category : #conversion }
PP2AbstractStrategy >> recognizer [
	^ self
]

{ #category : #conversion }
PP2AbstractStrategy >> recording [
	^ self
]

{ #category : #conversion }
PP2AbstractStrategy >> reparsable [
	^ PP2Reparsable on: self
]

{ #category : #conversion }
PP2AbstractStrategy >> trimmingCache [
	^ PP2TrimmingCache on: self
]

{ #category : #accessing }
PP2AbstractStrategy >> withoutDebugStrategy [
	^ self
]
