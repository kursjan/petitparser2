Class {
	#name : #WebElement,
	#superclass : #Object,
	#category : 'PetitParser2-Tutorial'
}

{ #category : #accessing }
WebElement >> children [
	^ #()

]

{ #category : #accessing }
WebElement >> firstChild [
	"Just for convenience"
	^ self children first

]

{ #category : #gui }
WebElement >> gtTreeViewIn: composite [
	<gtInspectorPresentationOrder: 40>

	composite tree
		title: 'Tree';
		children: [:n | n children ];
		format: [:n| n displayText printStringLimitedTo: 50 ];
		shouldExpandToLevel: 6

]

{ #category : #accessing }
WebElement >> secondChild [
	"Just for convenience"
	^ self children second

]
