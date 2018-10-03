Class {
	#name : #PP2WebPageParser,
	#superclass : #PP2WebPageGrammar,
	#category : 'PetitParser2-Html-Core'
}

{ #category : #'as yet unclassified' }
PP2WebPageParser >> document [
	^ super document
	
	map: [ :_bw :_document :_aw |
		| beforeWater afterWater |
		beforeWater := PP2HtmlText new
			text: _bw;
			yourself.
			
		afterWater := PP2HtmlText new
			text: _aw;
			yourself.
			
		PP2HtmlElement new
			name: 'ROOT';
			children: (Array with: beforeWater with: _document with: afterWater);
			yourself
	
	]
]

{ #category : #element }
PP2WebPageParser >> elClose [
	^ super elClose trim
]

{ #category : #element }
PP2WebPageParser >> elOpen [
	^ super elOpen trim
]

{ #category : #element }
PP2WebPageParser >> element [
	^ super element 
	
	map: [ :_open :_content :_close | 
	 	(PP2HtmlElement new)
			name: _open;
			children: _content;
			yourself
	]
]

{ #category : #javascript }
PP2WebPageParser >> javascript [
	^ super javascript 
	
	map: [ :_open :_content :_close | 
	 	(PP2JavascriptElement new)
			code: _content;
			yourself
	]
]

{ #category : #element }
PP2WebPageParser >> rawText [
	^ super rawText 
	
	map: [ :_value | 
		PP2HtmlText new
			text: _value;
			yourself	
	]
]
