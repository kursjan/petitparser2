*PetitParser2-GUI-Morhpic
morphicShapeSeen: aSet depth: anInteger
	^ self morphicShapeSeen: aSet depth: anInteger do: [ :cc |
		self displayDescription isNil
			ifTrue: [ cc value: child ]
			ifFalse: [
				self newRowMorph
					addMorphBack: (self newColumnMorph
						addMorphBack: (self newSpacerMorph height: 10);
						addMorphBack: (LineMorph from: 0 @ 0 to: 20 @ 0 color: Color black width: 1);
						yourself);
					addMorphBack: (self newRowMorph
						color: (self backgroundForDepth: anInteger);
						addMorphBack: (self newColumnMorph
							addMorphBack: (cc value: child);
							addMorphBack: (self newRowMorph
								hResizing: #spaceFill;
								addMorphBack: (self newSpacerMorph
									width: 20;
									yourself);
								addMorphBack: (self newColumnMorph
									hResizing: #spaceFill;
									listCentering: #center;
									addMorphBack: (self newSpacerMorph);
									addMorphBack: (StringMorph new
										contents: self displayDescription;
										yourself);
									yourself);
								yourself);
							yourself);		
						addMorphBack: (self newColumnMorph
							addMorphBack: (self newSpacerMorph height: 10);
							addMorphBack: (LineMorph from: 0 @ 0 to: 20 @ 0 color: Color black width: 1);
							yourself);
						yourself);
					yourself ] ]