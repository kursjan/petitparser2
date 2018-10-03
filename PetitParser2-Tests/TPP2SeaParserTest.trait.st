Trait {
	#name : #TPP2SeaParserTest,
	#category : 'PetitParser2-Tests-Seas'
}

{ #category : #'parse support' }
TPP2SeaParserTest >> emptySea [
	| nilSea |
	nilSea := self seaInstance.
	nilSea island: nil asPParser.
	nilSea name: 'nil sea'.
	^ nilSea
]

{ #category : #'parse support' }
TPP2SeaParserTest >> nestedBlock [
	| blockSea block nilIsland |
	blockSea := self seaInstance.
	nilIsland := (self emptySea ==> #first).
	
	block := PP2DelegateNode new.
	block child: (${ asPParser,  (blockSea plus / nilIsland), $} asPParser).
	block name: 'block'.
	
	blockSea island: block.
	blockSea name: 'block island'.
	^ block
]

{ #category : #'parse support' }
TPP2SeaParserTest >> result [
	self explicitRequirement
]

{ #category : #'parse support' }
TPP2SeaParserTest >> seaInstance [
	^ self explicitRequirement
]

{ #category : #tests }
TPP2SeaParserTest >> testEOFBoundary [
	| sea |

	sea := self seaInstance island: $a asPParser.
	
	self assert: sea parse: '..a..'.
	self assert: self result second equals: $a.

	self assert: sea fail: '..'
]

{ #category : #tests }
TPP2SeaParserTest >> testNestedBlockDeepNested [
	| block |

	block := self nestedBlock.
	
	self assert: block parse: '{ {} { {  } } }'.
	self assert: self result size equals: 3.
	self assert: self result first equals: ${.
	self assert: self result second size equals: 2.
	self assert: self result second first size equals: 3.
	self assert: self result second second size equals: 3.
	self assert: self result third equals: $}.
]

{ #category : #tests }
TPP2SeaParserTest >> testNestedBlockEmpty [
	| block |

	block := self nestedBlock.
	
	self assert: block parse: '{}'.
	self assert: self result size equals: 3.
	self assert: self result first equals: ${.
	self assert: self result second equals: #() asOrderedCollection.
	self assert: self result third equals: $}.
]

{ #category : #tests }
TPP2SeaParserTest >> testNestedBlockNested [
	| block |

	block := self nestedBlock.
	
	self assert: block parse: '{ {} }'.
	self assert: self result size equals: 3.
	self assert: self result first equals: ${.
	self assert: self result second size equals: 1.
	self assert: self result second first size equals: 3.
	self assert: self result third equals: $}.
]

{ #category : #tests }
TPP2SeaParserTest >> testNestedBlockSpace [
	| block |

	block := self nestedBlock.
	
	self assert: block parse: '{ }'.
	self assert: self result size equals: 3.
	self assert: self result first equals: ${.
	self assert: self result second equals: #( $ ) asOrderedCollection.
	self assert: self result third equals: $}.
]

{ #category : #tests }
TPP2SeaParserTest >> testNilSea [
	| parser |
	parser := self emptySea.
	
	self assert: parser parse: ''.
	self assert: self result first equals: #() asOrderedCollection.	

	self assert: parser parse: '...'.
	self assert: self result first equals: #($. $. $.) asOrderedCollection.


]

{ #category : #tests }
TPP2SeaParserTest >> testNilSeaPlus [
	| sea parser |

	sea := self seaInstance island: nil asPParser.
	parser := sea flatten nonEpsilon plus.
	
	self assert: parser fail: ''.


	self assert: parser parse: '...'.
	self assert: self result size equals: 1.
	self assert: self result first equals: '...'.


]

{ #category : #tests }
TPP2SeaParserTest >> testNilSeaSequence [
	| sea sea2 parser |

	sea := self seaInstance island: nil asPParser.
	sea2 := self seaInstance island: nil asPParser.
	parser := sea flatten, sea2 flatten.
	
	self assert: parser parse: ''.
	self assert: self result first equals: ''.	
	self assert: self result second equals: ''.	

	self assert: parser parse: '...'.
	self assert: self result first equals: '...'.
	self assert: self result second equals: ''.	


]

{ #category : #tests }
TPP2SeaParserTest >> testNilSeaStar [
	| sea parser |

	sea := self seaInstance island: #epsilon asPParser.
	parser := sea flatten nonEpsilon star.
	
	self assert: parser parse: ''.
	self assert: self result isEmpty.

	self assert: parser parse: '...'.
	self assert: self result size equals: 1.
	self assert: self result first equals: '...'.


]

{ #category : #tests }
TPP2SeaParserTest >> testNullableBoundary [
	| parser sea |

	sea := self seaInstance island: $a asPParser.
	parser := sea, $b asPParser optional.
	
	self assert: parser parse: '..a..'.
	self assert: self result first second equals: $a.

	self assert: parser parse: '..a..b'.
	self assert: self result first second equals: $a.

	self assert: parser fail: '..b'.
	self assert: parser fail: '..'	.
]

{ #category : #tests }
TPP2SeaParserTest >> testNullableIsland [
	| parser sea |

	sea := self seaInstance island: nil asPParser.
	parser := sea.
	
	self assert: parser parse: '..'.
	self assert: self result first equals: #($. $.) asOrderedCollection.
	self assert: self result second equals: nil.
	self assert: self result third equals: #() asOrderedCollection.


	self assert: parser parse: ''.
]

{ #category : #tests }
TPP2SeaParserTest >> testOverlappingSeas [
	| seas seaOne seaTwo |

	seaOne := self seaInstance island: $a asPParser.
	seaTwo := self seaInstance island: $b asPParser.
	
	seas := seaOne, seaTwo.
	
	self assert: seas parse: '..a..b..'.
	self assert: self result first second equals: $a.
	self assert: self result second second equals: $b.
	
	self assert: seas fail: '..b..a..b..'.
	self assert: seas fail: '..a..'
]

{ #category : #tests }
TPP2SeaParserTest >> testSeaPlus [
	| sea parser |

	sea := self seaInstance island: $a asPParser.
	parser := sea plus.

	self assert: parser parse: '..a..a..a...'.
	self assert: self result size equals: 3.	

	self assert: parser fail: '...'.

]

{ #category : #tests }
TPP2SeaParserTest >> testSeaStar [
	| sea parser |

	sea := self seaInstance island: $a asPParser.
	parser := sea star.
	
	self assert: parser parse: '..a..a..a...'.
	self assert: self result size equals: 3.	

	self assert: parser parse: ''.
	self assert: self result size equals: 0.	

]
