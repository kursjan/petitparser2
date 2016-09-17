private
sourceRewriter
	^ RBParseTreeRewriter new
		replace: '`#literal' with: '`#literal asParser' when: [ :node |
			(node isLiteralNode and: [ node value isString or: [ node value isCharacter ] ])
				and: [ (node parent isNil or: [ node parent isMessage not or: [ node parent selector ~= #asPParser ] ])
				and: [ (node parents noneSatisfy: [ :each | each isBlock ]) ] ] ];
		replaceMethod: '`@method: `@args | `@temps | ``@.statements. ``.statement `{ :node | node isReturn not }' 
			with: '`@method: `@args | `@temps | ``@.statements. ^ ``.statement';
		yourself