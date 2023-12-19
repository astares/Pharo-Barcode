"
Common superclass for all barcodes
"
Class {
	#name : #Barcode,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #'Barcode-Core-Base'
}

{ #category : #'instance creation' }
Barcode class >> data: aString [

	^ self new
		  data: aString;
		  yourself
]

{ #category : #testing }
Barcode class >> isAbstract [

	^ self == Barcode
]

{ #category : #accessing }
Barcode >> data [

	data ifNil: [ data := String new ].
	^ data
]

{ #category : #accessing }
Barcode >> data: aString [

	data := aString
]
