Class {
	#name : #PP2BenchmarkEntry,
	#superclass : #Object,
	#instVars : [
		'name',
		'size',
		'time',
		'timestamp',
		'gcTime'
	],
	#category : 'PetitParser2-Benchmarks-Core'
}

{ #category : #accessing }
PP2BenchmarkEntry >> gcTime [
	^ gcTime ifNil: [ 0 ]
]

{ #category : #accessing }
PP2BenchmarkEntry >> gcTime: anObject [
	gcTime := anObject
]

{ #category : #accessing }
PP2BenchmarkEntry >> name [
	^ name
]

{ #category : #accessing }
PP2BenchmarkEntry >> name: anObject [
	name := anObject
]

{ #category : #accessing }
PP2BenchmarkEntry >> size [
	^ size
]

{ #category : #accessing }
PP2BenchmarkEntry >> size: anObject [
	size := anObject
]

{ #category : #accessing }
PP2BenchmarkEntry >> time [
	^ time
]

{ #category : #accessing }
PP2BenchmarkEntry >> time: anObject [
	time := anObject
]

{ #category : #accessing }
PP2BenchmarkEntry >> timestamp [
	^ timestamp
]

{ #category : #accessing }
PP2BenchmarkEntry >> timestamp: anObject [
	timestamp := anObject
]

{ #category : #stats }
PP2BenchmarkEntry >> tpc [
	^ time / size
]
