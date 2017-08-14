generated
definitionComment
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