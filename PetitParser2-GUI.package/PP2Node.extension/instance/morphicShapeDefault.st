*PetitParser2-GUI-Morhpic
morphicShapeDefault
	^ self newRowMorph
		addMorphBack: (self newColumnMorph
			addMorphBack: (self newSpacerMorph);
			addMorphBack: (LineMorph from: 0 @ 0 to: 20 @ 0 color: Color black width: 1)	
				makeForwardArrow;
			yourself);
		addMorphBack: (self newRowMorph
			borderWidth: 1;
			layoutInset: 3;
			color: Color white;
			addMorphBack: (StringMorph new
				contents: self displayName;
				color: self displayColor;
				yourself);
			yourself);
		yourself