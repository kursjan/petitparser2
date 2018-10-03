Class {
	#name : #ExpressionParser,
	#superclass : #SmaCCGLRParser,
	#category : 'PetitParser2-RewriteEngine-SmaCC'
}

{ #category : #'generated-accessing' }
ExpressionParser class >> cacheId [
	^'2017-08-06T17:39:33.33474+02:00'
]

{ #category : #generated }
ExpressionParser class >> definitionComment [
"<number> : [0-9]+ (\. [0-9]*) ? ;
<name> : [a-zA-Z]\w*;
<whitespace> : \s+;

<patternToken> : \` [^\`]* \` ;
%glr;

%left ""+"" ""-"";
%left ""*"" ""/"";
%right ""^"";
%annotate_tokens;
%root Expression;
%prefix AST;
%suffix Node;
%ignore_variables leftParenToken rightParenToken;

Expression 
	: Expression 'left' ""+"" 'operator' Expression 'right' {{Binary}}
	| Expression 'left' ""-"" 'operator' Expression 'right' {{Binary}}
	| Expression 'left' ""*"" 'operator' Expression 'right' {{Binary}}
	| Expression 'left' ""/"" 'operator' Expression 'right' {{Binary}}
	| Expression 'left' ""^"" 'operator' Expression 'right' {{Binary}}
	| ""("" Expression "")"" {{}}
	| Number
	| Function;
Number : <number> {{Number}};
Function
	: <name> ""("" 'leftParen' _Arguments "")"" 'rightParen' {{}};
_Arguments
	:
	| Arguments;
Arguments
	: Expression 'argument'
	| Arguments "","" Expression 'argument';"
]

{ #category : #'generated-accessing' }
ExpressionParser class >> scannerClass [
	^ExpressionScanner
]

{ #category : #generated }
ExpressionParser class >> startingStateForExpression [
	^ 1
]

{ #category : #'generated-reduction actions' }
ExpressionParser >> reduceActionForArguments1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
ExpressionParser >> reduceActionForArguments2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
ExpressionParser >> reduceActionForExpression2: nodes [
	| result |
	result := ASTBinaryNode new.
	result left: (nodes at: 1).
	result operator: (nodes at: 2).
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
ExpressionParser >> reduceActionForExpression6: nodes [
	| result |
	result := nodes at: 2.
	result addFirstToken: (nodes at: 1) to: result leftParenTokens.
	result addToken: (nodes at: 3) to: result rightParenTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
ExpressionParser >> reduceActionForExpression8: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
ExpressionParser >> reduceActionForFunction1: nodes [
	| result |
	result := ASTFunctionNode new.
	result nameToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result arguments.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result rightParen: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
ExpressionParser >> reduceActionForNumber1: nodes [
	| result |
	result := ASTNumberNode new.
	result numberToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
ExpressionParser >> reduceActionFor_Arguments1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
ExpressionParser >> reduceActionFor_Arguments2: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #generated }
ExpressionParser >> reduceTable [
^#(
	#(20 1 #reduceActionForNumber1:) 
	#(19 1 #reduceActionForExpression8:) 
	#(15 0 #reduceActionFor_Arguments1:) 
	#(19 3 #reduceActionForExpression6:) 
	#(15 1 #reduceActionFor_Arguments2:) 
	#(16 1 #reduceActionForArguments1:) 
	#(19 3 #reduceActionForExpression2:) 
	#(13 4 #reduceActionForFunction1:) 
	#(16 3 #reduceActionForArguments2:)
	).
]

{ #category : #generated }
ExpressionParser >> symbolNames [
	^ #('"-"' '"+"' '"*"' '","' '"/"' '"^"' '")"' '"("' '<number>' '<name>' '<whitespace>' '<patternToken>' 'Function' 'B e g i n' '_Arguments' 'Arguments' 'E O F' 'error' 'Expression' 'Number')
]

{ #category : #generated }
ExpressionParser >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #ASTFunctionNode #ASTExpressionNode #OrderedCollection #OrderedCollection #SmaCCToken #SmaCCToken #ASTExpressionNode #ASTNumberNode)
]

{ #category : #generated }
ExpressionParser >> transitionTable [
^#(
#[1 0 9 0 8 0 13 0 9 0 17 0 10 0 21 0 13 0 25 0 19 0 29 0 20] 
#[1 0 9 0 8 0 13 0 9 0 17 0 10 0 21 0 13 0 33 0 19 0 29 0 20] 
#[0 0 6 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 17] 
#[0 0 37 0 8] 
#[0 0 10 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 17] 
#[1 0 41 0 1 0 45 0 2 0 49 0 3 0 53 0 5 0 57 0 6 0 0 0 17] 
#[0 0 10 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 17] 
#[1 0 41 0 1 0 45 0 2 0 49 0 3 0 53 0 5 0 57 0 6 0 61 0 7] 
#[1 0 14 0 7 0 9 0 8 0 13 0 9 0 17 0 10 0 21 0 13 0 65 0 15 0 69 0 16 0 73 0 19 0 29 0 20] 
#[1 0 9 0 8 0 13 0 9 0 17 0 10 0 21 0 13 0 77 0 19 0 29 0 20] 
#[1 0 9 0 8 0 13 0 9 0 17 0 10 0 21 0 13 0 81 0 19 0 29 0 20] 
#[1 0 9 0 8 0 13 0 9 0 17 0 10 0 21 0 13 0 85 0 19 0 29 0 20] 
#[1 0 9 0 8 0 13 0 9 0 17 0 10 0 21 0 13 0 89 0 19 0 29 0 20] 
#[1 0 9 0 8 0 13 0 9 0 17 0 10 0 21 0 13 0 93 0 19 0 29 0 20] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 17] 
#[0 0 97 0 7] 
#[1 0 101 0 4 0 22 0 7] 
#[1 0 41 0 1 0 45 0 2 0 49 0 3 0 26 0 4 0 53 0 5 0 57 0 6 0 26 0 7] 
#[1 0 30 0 1 0 30 0 2 0 49 0 3 0 30 0 4 0 53 0 5 0 57 0 6 0 30 0 7 0 30 0 17] 
#[1 0 30 0 1 0 30 0 2 0 49 0 3 0 30 0 4 0 53 0 5 0 57 0 6 0 30 0 7 0 30 0 17] 
#[1 0 30 0 1 0 30 0 2 0 30 0 3 0 30 0 4 0 30 0 5 0 57 0 6 0 30 0 7 0 30 0 17] 
#[1 0 30 0 1 0 30 0 2 0 30 0 3 0 30 0 4 0 30 0 5 0 57 0 6 0 30 0 7 0 30 0 17] 
#[1 0 30 0 1 0 30 0 2 0 30 0 3 0 30 0 4 0 30 0 5 0 57 0 6 0 30 0 7 0 30 0 17] 
#[0 0 34 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 17] 
#[1 0 9 0 8 0 13 0 9 0 17 0 10 0 21 0 13 0 105 0 19 0 29 0 20] 
#[1 0 41 0 1 0 45 0 2 0 49 0 3 0 38 0 4 0 53 0 5 0 57 0 6 0 38 0 7]
	).
]
