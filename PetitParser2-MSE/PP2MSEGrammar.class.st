Class {
	#name : #PP2MSEGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'elements',
		'element',
		'attributeValue',
		'attribute',
		'elementName',
		'primitive',
		'reference',
		'id',
		'string',
		'number',
		'boolean',
		'integerReference',
		'nameReference',
		'open',
		'close',
		'simpleName',
		'natural',
		'e',
		'stringText'
	],
	#category : 'PetitParser2-MSE'
}

{ #category : #grammar }
PP2MSEGrammar >> attribute [
	^ (open , simpleName , attributeValue , close) trim
]

{ #category : #grammar }
PP2MSEGrammar >> attributeValue [
	^ (primitive / reference / element) star
]

{ #category : #basic }
PP2MSEGrammar >> boolean [ 
	^ ('true' asPParser / 'false' asPParser) flatten token trim
]

{ #category : #basic }
PP2MSEGrammar >> close [
	^ $) asPParser trim
]

{ #category : #basic }
PP2MSEGrammar >> e [
	^ ($e asPParser / $E asPParser) , ($- asPParser / $+ asPParser) optional , natural
]

{ #category : #grammar }
PP2MSEGrammar >> element [
	^ (open , elementName , id optional , attribute star , close) trim
]

{ #category : #basic }
PP2MSEGrammar >> elementName [
	^ (#word asPParser star flatten , 
		( $. asPParser , #word asPParser star flatten ) optional) token trim
]

{ #category : #grammar }
PP2MSEGrammar >> elements [
	^ open , element star , close
]

{ #category : #grammar }
PP2MSEGrammar >> id [
	^ open , 'id:' asPParser , #digit asPParser star token trim , close
]

{ #category : #grammar }
PP2MSEGrammar >> integerReference [ 
	^ (open , 'ref:' asPParser , natural trim , close) token trim
]

{ #category : #grammar }
PP2MSEGrammar >> nameReference [ 
	^ open , 'ref:' asPParser , elementName trim , close
]

{ #category : #basic }
PP2MSEGrammar >> natural [
	^ #digit asPParser plus flatten trim
]

{ #category : #basic }
PP2MSEGrammar >> number [
	^ ($- asPParser optional , natural , ($. asPParser , natural , e optional) optional) flatten token trim
]

{ #category : #basic }
PP2MSEGrammar >> open [
	^ $( asPParser trim
]

{ #category : #basic }
PP2MSEGrammar >> primitive [ 
	^ string / number / boolean" , unlimited"
]

{ #category : #grammar }
PP2MSEGrammar >> reference [ 
	^ integerReference / nameReference
]

{ #category : #basic }
PP2MSEGrammar >> simpleName [
	^ #word asPParser star flatten token trim
]

{ #category : #accessing }
PP2MSEGrammar >> start [ 
	^ elements end
]

{ #category : #basic }
PP2MSEGrammar >> string [
	^ ($' asPParser , stringText , $' asPParser) trim
]

{ #category : #basic }
PP2MSEGrammar >> stringText [
	^ ('''''' asPParser / $' asPParser negate) star flatten token
]
