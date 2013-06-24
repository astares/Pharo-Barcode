Class {
	#name : #QRNumericCharacterSetTest,
	#superclass : #TestCase,
	#category : #'Barcode-Tests-Core-QR'
}

{ #category : #tests }
QRNumericCharacterSetTest >> testAllowedCharacters [

	QRNumericCharacterSet allowedCharacters 
		do: [:each | self assert: each isDigit ]
]

{ #category : #tests }
QRNumericCharacterSetTest >> testCanEncode [

	self 
		assert: (QRNumericCharacterSet canEncode: $1);
		assert: (QRNumericCharacterSet canEncode: $2);
		assert: (QRNumericCharacterSet canEncode: $3);
		assert: (QRNumericCharacterSet canEncode: $4);
		assert: (QRNumericCharacterSet canEncode: $5);
		assert: (QRNumericCharacterSet canEncode: $6);
		assert: (QRNumericCharacterSet canEncode: $7);
		assert: (QRNumericCharacterSet canEncode: $8);
		assert: (QRNumericCharacterSet canEncode: $9).
	
	self 
		deny: (QRNumericCharacterSet canEncode: Character space);
		deny: (QRNumericCharacterSet canEncode: $A)	
]

{ #category : #tests }
QRNumericCharacterSetTest >> testCharacterCountIndicatorSizeInBits [
	"version 1 through 9 with 10 bits, version 10 through 26 with 12 bits, version 27 through 40 with 14 bits"
	
	#(10 10 10 10 10 10 10 10 10
	   12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12
	   14 14 14 14 14 14 14 14 14 14 14 14 14 14)
		withIndexDo: [:element :index | 
			self assert: (QRNumericCharacterSet characterCountIndicatorSizeInBitsForVersion: index) = element ]
]

{ #category : #tests }
QRNumericCharacterSetTest >> testModeIndicator [

	self assert: QRNumericCharacterSet modeIndicator = '0001'
]
