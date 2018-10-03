Class {
	#name : #PP2WebPageGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'javascript',
		'jsDoubleQuoteString',
		'jsContent',
		'jsWater',
		'any',
		'whitespaces',
		'elementName',
		'element',
		'elOpen',
		'elClose',
		'jsOpen',
		'jsClose',
		'elContent',
		'jsType',
		'jsTypeString',
		'rawText',
		'document',
		'elWater',
		'identifier',
		'jsString',
		'jsSingleQuoteString'
	],
	#category : 'PetitParser2-Html-Core'
}

{ #category : #others }
PP2WebPageGrammar >> any [
	^ #any asPParser
]

{ #category : #accessing }
PP2WebPageGrammar >> document [
	^ element sea
]

{ #category : #element }
PP2WebPageGrammar >> elClose [
	^ '</' asPParser, elementName match pop, $> asPParser
]

{ #category : #element }
PP2WebPageGrammar >> elContent [
	^ (javascript / element / rawText nonEpsilon)  star
]

{ #category : #element }
PP2WebPageGrammar >> elOpen [
	^ $< asPParser, elementName push, #water asPParser, $> asPParser ==> #second
]

{ #category : #element }
PP2WebPageGrammar >> elWater [
	^ identifier / whitespaces / any
]

{ #category : #accessing }
PP2WebPageGrammar >> element [
	^ (elOpen, elContent, elClose)
		memoize;
		yourself
	
]

{ #category : #element }
PP2WebPageGrammar >> elementName [
	^ #word asPParser plus flatten
]

{ #category : #others }
PP2WebPageGrammar >> identifier [
	^ #letter asPParser, #word asPParser plus
]

{ #category : #javascript }
PP2WebPageGrammar >> javascript [
	^ (jsOpen, jsContent, jsClose)
]

{ #category : #javascript }
PP2WebPageGrammar >> jsClose [
	^ '</script>' asPParser
]

{ #category : #javascript }
PP2WebPageGrammar >> jsContent [
	^ #epsilon asPParser sea 
		waterToken: jsWater;
		flatten
]

{ #category : #javascript }
PP2WebPageGrammar >> jsDoubleQuoteString [
	^ $" asPParser, #water asPParser, $" asPParser
]

{ #category : #javascript }
PP2WebPageGrammar >> jsOpen [
	^ ('<script type=' asPParser, jsTypeString, '>' asPParser) /
	  ('<script>' asPParser)
]

{ #category : #javascript }
PP2WebPageGrammar >> jsSingleQuoteString [
	^ $' asPParser, #water asPParser, $' asPParser
]

{ #category : #javascript }
PP2WebPageGrammar >> jsString [
	^ jsDoubleQuoteString / jsSingleQuoteString
]

{ #category : #javascript }
PP2WebPageGrammar >> jsType [
	^ 'text/javascript' asPParser
]

{ #category : #javascript }
PP2WebPageGrammar >> jsTypeString [
	^ ($" asPParser, jsType, $" asPParser) /
	  ($' asPParser, jsType, $' asPParser)
]

{ #category : #javascript }
PP2WebPageGrammar >> jsWater [
	^ identifier / jsString / whitespaces / any
]

{ #category : #element }
PP2WebPageGrammar >> rawText [
	^ #water asPParser
]

{ #category : #accessing }
PP2WebPageGrammar >> start [
	^ document
]

{ #category : #others }
PP2WebPageGrammar >> whitespaces [
	^ #space asPParser plus
]
