Class {
	#name : #QRVersion,
	#superclass : #Object,
	#instVars : [
		'version'
	],
	#category : #'Barcode-Core-QR'
}

{ #category : #'instance creation' }
QRVersion class >> nr: aVersionNumber [

	^(self new)
		version: aVersionNumber;
		yourself 
]

{ #category : #accessing }
QRVersion >> sizeInPixels [

	^17 + (self version * 4)
]

{ #category : #accessing }
QRVersion >> version [
	^version
]

{ #category : #accessing }
QRVersion >> version: aNr [ 
	version := aNr
]
