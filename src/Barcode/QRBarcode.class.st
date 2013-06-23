Class {
	#name : #QRBarcode,
	#superclass : #Barcode,
	#instVars : [
		'encoding'
	],
	#category : #'Barcode-Core-QR'
}

{ #category : #accessing }
QRBarcode >> binarySequence [

	^String streamContents: [:stream |
		stream nextPutAll: self encoding characterSet modeIndicator
	]
]

{ #category : #accessing }
QRBarcode >> encoding [

	^encoding
]

{ #category : #accessing }
QRBarcode >> encoding: anQREncoding [

	encoding := anQREncoding
]
