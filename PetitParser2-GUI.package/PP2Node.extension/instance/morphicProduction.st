*PetitParser2-GUI-Morhpic
morphicProduction
	^ self newRowMorph
		layoutInset: 4;
		addMorphBack: (self newRowMorph
			layoutInset: 4;
			addMorphBack: (StringMorph new
				contents: self displayName;
				emphasis: TextEmphasis bold emphasisCode;
				yourself);
			yourself);
		addMorphBack: (self morphicShapeSeen: IdentitySet new depth: 0);
		addMorphBack: (self newColumnMorph
			addMorphBack: (self newSpacerMorph);
			addMorphBack: (LineMorph from: 0 @ 0 to: 20 @ 0 color: Color black width: 1)	
				makeForwardArrow;
			yourself);
		yourself