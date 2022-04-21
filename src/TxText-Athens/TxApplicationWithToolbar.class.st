"
TxApplicationWithToolbar new openWithSpec
"
Class {
	#name : #TxApplicationWithToolbar,
	#superclass : #SpPresenter,
	#instVars : [
		'text'
	],
	#category : #'TxText-Athens-Spec'
}

{ #category : #'as yet unclassified' }
TxApplicationWithToolbar class >> defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :c | 
			c 
				add: #text ];
		yourself.
	 
]

{ #category : #'as yet unclassified' }
TxApplicationWithToolbar >> initializeWidgets [

	text := self newText.
	
	self focusOrder add:  text 
	

]

{ #category : #'as yet unclassified' }
TxApplicationWithToolbar >> openWithSpec [
	| old |
	old := SpecInterpreter bindings.
	SpecInterpreter bindings: TxAdapterBindings new.
	^ [ super openWithSpec ]
		ensure: [ SpecInterpreter bindings: old ]
]

{ #category : #'as yet unclassified' }
TxApplicationWithToolbar >> text [
	^ text
]
