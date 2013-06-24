Class {
	#name : #QRKanjiCharacterSetTest,
	#superclass : #TestCase,
	#category : #'Barcode-Tests-Core-QR'
}

{ #category : #tests }
QRKanjiCharacterSetTest >> testModeIndicator [

	self assert: QRKanjiCharacterSet modeIndicator = '1000'
]
