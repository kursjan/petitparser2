instance creation
parse: aStream with: parser 
	| root newParser |
	root := self new.
	newParser := parser transform: [:each |
		each name isNil 
			ifTrue: [ each ]
			ifFalse: [
				each >=> [:stream :continuation | 
					| result child |
					child := PPParserDebuggerResult new 
							parser: each;
							parent: root.
					root := root children add: child.
					child start: stream position + 1.
					result := continuation value.
					child end: stream position.
					root result: result.
					root := root parent.
					result ]]].
	newParser parse: aStream.
	^ root children first