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
