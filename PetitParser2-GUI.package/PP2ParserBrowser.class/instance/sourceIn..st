private building
sourceIn: composite
	composite pharoMethod
		title: 'Source';
		useExplicitNotNil;
		display: [ :class :production | self sourceCodeFrom: class selector: production ];
		smalltalkClass: [ :class | class ];
		selectionAct: [ :text :class :production | 
				| selector refactoring |
				selector := UIManager default
					request: 'Production name to extract to:'
					initialAnswer: ''
					title: 'Extract production'.
				selector isEmptyOrNil ifFalse: [
					selector := selector asSymbol.
					refactoring := PP2ExtractProductionRefactoring
						onClass: class
						production: production
						interval: text selectionInterval
						to: selector.
					PP2RefactoringUtils new performRefactoring: refactoring.
					text pane browser update.
					(text pane port: #productionToSelect) value: selector ] ]
			on: $e
			entitled: 'Extract production';		
		act: [ :text :class :production | 
				| selector refactoring |
				refactoring := PP2DefineProdcutionRefactoring 	
						onClass: class 
						source: text text asString 
						protocols: #(grammar).
				PP2RefactoringUtils new performRefactoring: refactoring.
				selector := refactoring changes changes last selector.
				selector = production 
					ifTrue: [text update]
					ifFalse: [
						text pane browser update.
						(text pane port: #productionToSelect) value: selector ] ]
			icon: GLMUIThemeExtraIcons glamorousAccept
			on: $s
			entitled: 'Accept'