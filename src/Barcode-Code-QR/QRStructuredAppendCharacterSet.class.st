"
Structured Append mode encodes data across multiple QR codes, up to a maximum of 16 QR codes. I will not be discussing this mode in this tutorial but may add more information at a later time.
"
Class {
	#name : #QRStructuredAppendCharacterSet,
	#superclass : #QREncodableCharacterSet,
	#category : #'Barcode-Code-QR-CharacterSets'
}

{ #category : #accessing }
QRStructuredAppendCharacterSet class >> modeIndicator [

	^'0011'
]
