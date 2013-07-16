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

	| totalNumberOfBitsRequired dataBits terminatorsAdded |
	totalNumberOfBitsRequired := self encoding totalNumberOfDataCodewords * 8.
	dataBits := self dataBitsString.
	
	terminatorsAdded := 0.  
	"Nothing more than 4 terminating zeros to be added as terminator"
	[ dataBits size < totalNumberOfBitsRequired
		and: [ terminatorsAdded <= 4 ]]
			whileTrue: [ dataBits := dataBits padRightTo: dataBits size + 1 with: $0.  
						 terminatorsAdded := terminatorsAdded + 1].
	
	
	 
	
	^dataBits
]

{ #category : #accessing }
QRBarcode >> characterCountIndicator [
	|sizeAsBinaryString|
	sizeAsBinaryString := self data size printStringBase: 2.
	^sizeAsBinaryString padded: #left to: (self encoding characterCountIndicatorSizeInBits) with: $0
]

{ #category : #private }
QRBarcode >> dataBitsString [

	^String streamContents: [:stream |
		stream 
			nextPutAll: self encoding characterSet modeIndicator;
		 	nextPutAll: self characterCountIndicator;
			nextPutAll: (self encoding characterSet encode: self data) ] 
]

{ #category : #accessing }
QRBarcode >> encoding [

	^encoding
]

{ #category : #accessing }
QRBarcode >> encoding: anQREncoding [

	encoding := anQREncoding
]
