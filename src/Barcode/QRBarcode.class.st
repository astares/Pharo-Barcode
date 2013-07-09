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

	| totalNumberOfBitsRequired |
	totalNumberOfBitsRequired := self encoding totalNumberOfDataCodewords * 8.
	totalNumberOfBitsRequired halt. 
	
	"If the bit string is shorter than the total number of required bits, a terminator of up to four 0s must be added to the right side of the string. If the bit string is more than four bits shorter than the required number of bits, add four 0s to the end. If the bit string is fewer than four bits shorter, add only the number of 0s that are needed to reach the required number of bits."
	
	^String streamContents: [:stream |
		stream 
			nextPutAll: self encoding characterSet modeIndicator;
		 	nextPutAll: self characterCountIndicator ]
]

{ #category : #accessing }
QRBarcode >> characterCountIndicator [
	|sizeAsBinaryString|
	sizeAsBinaryString := self data size printStringBase: 2.
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
