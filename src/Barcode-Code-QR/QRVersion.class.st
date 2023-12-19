"
QR version
"
Class {
	#name : #QRVersion,
	#superclass : #Object,
	#instVars : [
		'number'
	],
	#category : #'Barcode-Code-QR-Utilities'
}

{ #category : #'instance creation' }
QRVersion class >> nr: aVersionNumber [

	^ self new
		  number: aVersionNumber;
		  yourself
]

{ #category : #comparing }
QRVersion >> = anotherQRVersion [
	self species = anotherQRVersion species ifFalse: [ ^ false ].
	^ self number = anotherQRVersion number
]

{ #category : #converting }
QRVersion >> asQRVersion [

	^ self
]

{ #category : #comparing }
QRVersion >> hash [

	^ number hash
]

{ #category : #accessing }
QRVersion >> number [

	^ number
]

{ #category : #accessing }
QRVersion >> number: aNr [

	(aNr < 1 or: [ aNr > 40 ]) ifTrue: [
		self error: 'Only 1 to 40 allowed' ].
	number := aNr
]

{ #category : #printing }
QRVersion >> printOn: aStream [

	aStream
		nextPutAll: 'QRVersion nr: ';
		nextPutAll: self number asString
]

{ #category : #accessing }
QRVersion >> symbolSizeInPixels [
	"Returns the symbol size - not including the quiet zone. This is also refered to as the number of modules"

	^ 17 + (4 * self number)
]
