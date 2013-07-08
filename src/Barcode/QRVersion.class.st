Class {
	#name : #QRVersion,
	#superclass : #Object,
	#instVars : [
		'version'
	],
	#category : #'Barcode-Core-QR'
}

{ #category : #conversion }
QRVersion class >> asQRVersion [

	^self
]

{ #category : #'instance creation' }
QRVersion class >> nr: aVersionNumber [

	^(self new)
		version: aVersionNumber;
		yourself 
]

{ #category : #accessing }
QRVersion >> symbolSizeInPixels [
	"Returns the sybol size - not including the quiet zone"
	
	^17 + (self version * 4)
]

{ #category : #accessing }
QRVersion >> version [
	^version
]

{ #category : #accessing }
QRVersion >> version: aNr [ 
	(aNr < 1 or: [ aNr > 50 ]) ifTrue: [ self error: 'Only 1 to 40 allowed' ].
	version := aNr
]
