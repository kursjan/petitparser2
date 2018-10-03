Class {
	#name : #WebParser,
	#superclass : #WebGrammar,
	#category : 'PetitParser2-Tutorial'
}

{ #category : #various }
WebParser >> document [
	^ super document
	
	map: [ :_bw :_document :_aw |
		| beforeWater afterWater |
		beforeWater := UnknownText new
			text: _bw;
			yourself.
			
		afterWater := UnknownText new
			text: _aw;
			yourself.
			
		HtmlElement new
			name: 'DOCUMENT';
			children: (Array with: beforeWater with: _document with: afterWater);
			yourself
	
	]
]

{ #category : #accessing }
WebParser >> elClose [
	^ super elClose trim

]

{ #category : #accessing }
WebParser >> elOpen [
	^ super elOpen trimRight

]

{ #category : #accessing }
WebParser >> element [
	^ super element 
	
	map: [ :_open :_content :_close | 
	 	(HtmlElement new)
			name: _open;
			children: _content;
			yourself
	]

]

{ #category : #accessing }
WebParser >> javascript [
	^ super javascript
	
	map: [ :_code | 
		(JavascriptElement new)
			code: _code;
			yourself
	]

]

{ #category : #accessing }
WebParser >> jsContent [
	^ super jsContent flatten
]

{ #category : #accessing }
WebParser >> structuredDocument [
	^ super structuredDocument
	
	map: [ :_bw :_html :_aw |
		| beforeWater afterWater |
		beforeWater := UnknownText new
			text: _bw;
			yourself.
			
		afterWater := UnknownText new
			text: _aw;
			yourself.
			
		HtmlElement new
			name: 'DOCUMENT';
			children: (Array 
				with: beforeWater 
				with: _html 
				with: afterWater);
			yourself
	]

]

{ #category : #accessing }
WebParser >> text [
	^ super text flatten
	
	map: [ :_value | 
		UnknownText new
			text: _value;
			yourself	
	]

]
