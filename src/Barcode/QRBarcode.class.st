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
		stream 
			nextPutAll: self encoding characterSet modeIndicator;
		 	nextPutAll: self characterCountIndicator ]
]

{ #category : #accessing }
QRBarcode >> characterCountIndicator [
	|sizeAsBinaryString|
	sizeAsBinaryString := self value size printStringBase: 2.
	^sizeAsBinaryString padded: #left to: (self encoding characterCountIndicatorSizeInBits) with: $0
]

{ #category : #accessing }
QRBarcode >> encoding [

	^encoding
]

{ #category : #accessing }
QRBarcode >> encoding: anQREncoding [

	encoding := anQREncoding
]
