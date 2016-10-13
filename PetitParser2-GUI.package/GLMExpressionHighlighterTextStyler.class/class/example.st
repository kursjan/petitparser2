as yet unclassified
example
	<example>
	| input presentation composite |
	input := PP2Sources current expressionOfSize: 500.
	presentation := GLMRubricHighlightedTextPresentation new
		title: 'Source';
		editingMode: [ GLMHighlighterTextRubEditingMode withStylerDecorator: GLMExpressionHighlighterTextStyler new].
	composite := GLMCompositePresentation new.
	composite custom: presentation.
	composite openOn: input.