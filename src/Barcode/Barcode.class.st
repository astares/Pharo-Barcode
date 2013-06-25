Class {
	#name : #Barcode,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #'Barcode-Core'
}

{ #category : #'instance creation' }
Barcode class >> data: aString [

	^(self new)
		data: aString;
		yourself
]

{ #category : #accessing }
Barcode >> data [ 
	data ifNil: [ data := String new ].
	^data
]

{ #category : #accessing }
Barcode >> data: aString [

	data := aString
]
