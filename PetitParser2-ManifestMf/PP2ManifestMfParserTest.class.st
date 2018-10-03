Class {
	#name : #PP2ManifestMfParserTest,
	#superclass : #PP2CompositeNodeTest,
	#category : 'PetitParser2-ManifestMf'
}

{ #category : #'as yet unclassified' }
PP2ManifestMfParserTest >> parserClass [
	^ PP2ManifestMfParser
]

{ #category : #'as yet unclassified' }
PP2ManifestMfParserTest >> testDoublePairsWithCollection [
	self 
		assert: 'Header: value1,value2
Header2: value3, value4'
		is: {'Header'->#('value1' 'value2') . 'Header2'->#('value3' 'value4')} 
]

{ #category : #'as yet unclassified' }
PP2ManifestMfParserTest >> testMultilineDoublePairsWithCollection [
	self 
		assert: 'Header: value1,
 value2
Header2: value3,
 value4' 
		is: {'Header'->#('value1' 'value2') . 'Header2'->#('value3' 'value4')}
]

{ #category : #'as yet unclassified' }
PP2ManifestMfParserTest >> testMultilineSinglePairWithCollection [
	self assert: 'Header: value1,
 value2' is: {'Header'->#('value1' 'value2')}
]

{ #category : #'as yet unclassified' }
PP2ManifestMfParserTest >> testSinglePair [
	self assert: 'Header: value' is: {'Header'->#('value')}
]

{ #category : #'as yet unclassified' }
PP2ManifestMfParserTest >> testSinglePairWithCollection [
	self assert: 'Header: value1, value2' is: {'Header'->#('value1' 'value2')}
]
