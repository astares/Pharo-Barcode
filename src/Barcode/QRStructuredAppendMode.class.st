"
Structured Append mode encodes data across multiple QR codes, up to a maximum of 16 QR codes. I will not be discussing this mode in this tutorial but may add more information at a later time.
"
Class {
	#name : #QRStructuredAppendMode,
	#superclass : #QREncodingMode,
	#category : #'Barcode-Core-QR'
}

{ #category : #accessing }
QRStructuredAppendMode class >> modeIndicator [

	^'0011'
]
