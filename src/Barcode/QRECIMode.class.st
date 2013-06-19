"
Extended Channel Interpretation (ECI) mode specifies the character set (e.g. UTF-8) directly. However, some QR code readers do not support ECI mode and will not understand QR codes that use it.
"
Class {
	#name : #QRECIMode,
	#superclass : #QREncodingMode,
	#category : #'Barcode-Core-QR'
}

{ #category : #'private accessing' }
QRECIMode class >> capacityTable [

	self error: 'Table unknown, please provide one!'
]

{ #category : #accessing }
QRECIMode class >> modeIndicator [

	^'0111'
]
