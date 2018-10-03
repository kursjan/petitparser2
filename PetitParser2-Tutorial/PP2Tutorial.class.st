Class {
	#name : #PP2Tutorial,
	#superclass : #Object,
	#category : 'PetitParser2-Tutorial'
}

{ #category : #'pillar-support' }
PP2Tutorial >> definitionFor: aClass [
	^ aClass definition
]

{ #category : #actions }
PP2Tutorial >> export: class [
	| name |
	name := class name.
	
	(('build/', name, '.st') asFileReference) deleteIfAbsent: nil.
	class fileOut.
	(name, '.st') asFileReference moveTo: (('build/', name, '.st') asFileReference).
]

{ #category : #'pillar-support' }
PP2Tutorial >> printAsCode: aString stream: stream [
	stream nextPutAll: '[[[';
		lf;
		nextPutAll: aString;
		lf;
		nextPutAll: ']]]'.
]

{ #category : #accessing }
PP2Tutorial >> script [
| js jsSea document jsString any |
any := #any asPParser.
jsString := $' asPParser, any starLazy, $' asPParser.
js := '<script>' asPParser, ((jsString / any) starLazy) flatten, '</script>' asPParser
	 ==> #second.

jsSea := js sea ==> #second.
document := jsSea star.
^ document
]

{ #category : #accessing }
PP2Tutorial >> scriptWithoutString [
	| source js jsSea document |
source := PP2Sources current htmlSample.
js := '<script>' asPParser, #any asPParser starLazy flatten, '</script>' asPParser
	==> #second.
jsSea := js sea ==> #second.
document := jsSea star.
^ document
]

{ #category : #accessing }
PP2Tutorial >> source [
	^ PP2Sources current htmlSample 
]

{ #category : #'pillar-support' }
PP2Tutorial >> sourceFor: selector [
	^ self sourceFor: selector in: self class
]

{ #category : #'pillar-support' }
PP2Tutorial >> sourceFor: selector in: class [
	^ class name, '>>', (class methodNamed: selector) sourceCode
]

{ #category : #'pillar-support' }
PP2Tutorial >> sourceForScript: selector [
	| lines |
	lines := Character cr split: (self sourceFor: selector).
	lines	removeFirst.
	lines removeFirst.
	lines removeLast.
	^ Character cr join: lines.
]

{ #category : #'pillar-support' }
PP2Tutorial >> testResultFor: selector in: class [
	"
		self new testResultFor: #testText in: WebGrammarTest
	"
	^ (class run: selector) passed isEmpty ifFalse: [ '[PASS]' ] ifTrue: [ '[FAIL]' ]

]

{ #category : #'pillar-support' }
PP2Tutorial >> testResultsFor: selectorArray in: class [
	"
		self new testResultsFor: #(#testText #testJavascript) in: WebGrammarTest
	"
	^ (class buildSuiteFromMethods: selectorArray) run asString

]
