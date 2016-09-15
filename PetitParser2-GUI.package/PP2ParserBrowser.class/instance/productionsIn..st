private building
productionsIn: composite
	"Doru: These menus should be built dynamically: title and enabled status should adapt" 
	"enabled: RBRefactoryChangeManager instance hasRedoableOperations"	" , RBRefactoryChangeManager instance redoChange"	"enabled: RBRefactoryChangeManager instance hasUndoableOperations"	" , RBRefactoryChangeManager instance undoChange "

	composite list
		title: [ :class | class name ];
		format: [ :class | class asString ];
		display: [ :class | self productionSelectorsFrom: class ];
		shouldValidate: true;
		act: [ :list :class | 
					RBRefactoryChangeManager instance redoOperation.
					list pane browser update ]
			icon: GLMUIThemeExtraIcons glamorousRedo
			entitled: 'Redo';
		act: [ :list :class | 
					RBRefactoryChangeManager instance undoOperation.
					list pane browser update ]
			icon: GLMUIThemeExtraIcons glamorousUndo
			entitled: 'Undo';
		selectionAct: [ :list  :class | 
					| oldName refactoring |
					oldName := list selection.
					refactoring := PP2RefactoringUtils new performRenameProduction: oldName from: class.
					refactoring changes changes notEmpty ifTrue: [
						list update.
						list selection: refactoring changes changes first newName asSymbol ] ]
			on: $r
			entitled: 'Rename (r)';
		selectionAct: [ :list :class | 
					PP2RefactoringUtils new performRefactoring: (PP2RemoveProdcutionRefactoring onClass: class production: list selection).
					list pane browser update ]
			on: $x
			entitled: 'Remove (x)';
		selectionAct: [ :list :class | Smalltalk tools browser openOnClass: class selector: list selection ]
			on: $b
			entitled: 'Browse (b)';
		selectionAct: [ :list :class | (self production: list selection from: class) explore ]
			on: $I
			entitled: 'Explore (I)'