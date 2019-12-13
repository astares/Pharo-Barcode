Class {
	#name : #QRBarcode,
	#superclass : #Barcode,
	#instVars : [
		'encoding'
	],
	#category : #'Barcode-Code-QR-Base'
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
	
	"Add more 0s to make the length a multiple of 8"
	[dataBits size \\ 8 = 0] whileFalse: [ dataBits := dataBits padRightTo: dataBits size + 1 with: $0]. 
	 
	"Add pad bytes (236 and 17) if the string is still too short "
	[dataBits size < totalNumberOfBitsRequired] whileTrue: [ dataBits := dataBits , '1110110000010001' ].
		 
	^dataBits copyFrom: 1 to: totalNumberOfBitsRequired 
]

{ #category : #accessing }
QRBarcode >> characterCountIndicator [
	|sizeAsBinaryString|
	sizeAsBinaryString := self data size printStringBase: 2.
	^sizeAsBinaryString padLeftTo: (self encoding characterCountIndicatorSizeInBits) with: $0
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
