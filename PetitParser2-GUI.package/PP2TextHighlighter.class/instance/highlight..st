public
highlight: aString
	| text highlighter |
	text := aString asText.
	highlighter := parser transform: [ :p |
		attributeMapper at: p name
			ifPresent: [ :attributes | 
				p token ==> [ :token | 
					attributes do: [:each |
						text 
							addAttribute: each 
							from: token start 
							to: token stop ].
					token ] ]
			ifAbsent: [ p ] ].
	highlighter optimize parse: text.
	^ text