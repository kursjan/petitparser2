Extension { #name : #PP2RecordingContextTest }

{ #category : #'*PetitParser2-GUI' }
PP2RecordingContextTest >> testGtCacheReport [
	| wrapper parser context |
	parser := PP2ExpressionParser new optimize enableDebug.
	context := self contextOn: '1+2'.
	
	parser parseWithContext: context.
	
	wrapper := GLMWrapper new.
	self shouldnt: [ wrapper show: [ :a | context gtCacheReport: a ] ] raise: Exception.
]

{ #category : #'*PetitParser2-GUI' }
PP2RecordingContextTest >> testGtEventsMorph [
	| wrapper parser context |
	parser := PP2ExpressionParser new optimize enableDebug.
	context := self contextOn: '1+2'.
	
	parser parseWithContext: context.
	
	wrapper := GLMWrapper new.
	self shouldnt: [ wrapper show: [ :a | context gtEventsMorph: a ] ] raise: Exception.
]

{ #category : #'*PetitParser2-GUI' }
PP2RecordingContextTest >> testGtReportIn [
	| wrapper parser context |
	parser := PP2ExpressionParser new optimize enableDebug.
	context := self contextOn: '1+2'.
	
	parser parseWithContext: context.
	
	wrapper := GLMWrapper new.
	self shouldnt: [ wrapper show: [ :a | context gtReport: a ] ] raise: Exception.
]
