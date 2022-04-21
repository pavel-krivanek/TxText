Class {
	#name : #TxTextAdapter,
	#superclass : #SpAbstractMorphicAdapter,
	#category : #'TxText-Athens-Spec'
}

{ #category : #'as yet unclassified' }
TxTextAdapter >> adapt: aComposableModel [

	model := aComposableModel.
	aComposableModel addDependent: self.

	widget := self buildWidget.
	
	model whenTextChanged: [ :new :old | 
		self editorDo: [ :e | e contents: new ]
		 ].
	"model text whenChangedSend: #setNewText: to: self"
]

{ #category : #'as yet unclassified' }
TxTextAdapter >> buildWidget [
	| view wrapper |
	
	view := TxViewContainer new.
	view addDecorator: (TxScrollbarDecorator new placeRight color: Color blue;yourself).
	view addDecorator: (TxScrollbarDecorator new placeBottom color: Color green;yourself).
	view useEditor.
	view wrapText: true.
	
	view hResizing: #spaceFill ; vResizing: #spaceFill .
	view layoutFrame: (LayoutFrame identity).
	
	wrapper := AthensWrapMorph new.
	wrapper layoutPolicy: ProportionalLayout new.
	wrapper addMorph: view.
	wrapper hResizing: #spaceFill ; vResizing: #spaceFill .

	^ wrapper

]

{ #category : #'as yet unclassified' }
TxTextAdapter >> classOrMetaClass: aClass [
]

{ #category : #'as yet unclassified' }
TxTextAdapter >> editorDo: aBlock [

	^ self widgetDo: [ :w | aBlock value: w submorphs first viewMorph ]

]

{ #category : #'as yet unclassified' }
TxTextAdapter >> font: aFont [
]

{ #category : #'as yet unclassified' }
TxTextAdapter >> getText [
	1halt
]

{ #category : #'as yet unclassified' }
TxTextAdapter >> pendingText: aText [
1halt.
	self editorDo: [ :e | 
		e insert: aText ]
]

{ #category : #'as yet unclassified' }
TxTextAdapter >> setScrollValue: aPoint [ 
	
]

{ #category : #'as yet unclassified' }
TxTextAdapter >> setSelectionFromModel: x [
1halt
]

{ #category : #'as yet unclassified' }
TxTextAdapter >> takeKeyboardFocus [

	self editorDo: [ :e | e takeKeyboardFocus ]
]
