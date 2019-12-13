Class {
	#name : #QRVersion,
	#superclass : #Object,
	#instVars : [
		'nr',
		'number'
	],
	#category : #'Barcode-Code-QR-Utilities'
}

{ #category : #'instance creation' }
QRVersion class >> nr: aVersionNumber [

	^(self new)
		number: aVersionNumber;
		yourself 
]

{ #category : #comparing }
QRVersion >> = anotherQRVersion [

	^self number = anotherQRVersion number
]

{ #category : #conversion }
QRVersion >> asQRVersion [

	^self
]

{ #category : #accessing }
QRVersion >> number [
	^number
]

{ #category : #accessing }
QRVersion >> number: aNr [ 
	(aNr < 1 or: [ aNr > 50 ]) ifTrue: [ self error: 'Only 1 to 40 allowed' ].
	number := aNr
]

{ #category : #accessing }
QRVersion >> symbolSizeInPixels [
	"Returns the sybol size - not including the quiet zone"
	
	^17 + (self number * 4)
]
