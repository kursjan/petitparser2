Extension { #name : #SequenceableCollection }

{ #category : #'*PetitParser2-Experiments-Reparsing' }
SequenceableCollection >> asReparsableContext [
	^ PP2ReparsableContext on: self position: 0
]
