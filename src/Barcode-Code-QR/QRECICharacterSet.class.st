"
Extended Channel Interpretation (ECI) mode specifies the character set (e.g. UTF-8) directly. However, some QR code readers do not support ECI mode and will not understand QR codes that use it.
"
Class {
	#name : #QRECICharacterSet,
	#superclass : #QREncodableCharacterSet,
	#category : #'Barcode-Code-QR-CharacterSets'
}

{ #category : #'private accessing' }
QRECICharacterSet class >> capacityTable [

	self error: 'Table unknown, please provide one!'
]

{ #category : #accessing }
QRECICharacterSet class >> modeIndicator [

	^'0111'
]
