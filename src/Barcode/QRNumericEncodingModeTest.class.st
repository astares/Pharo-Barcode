Class {
	#name : #QRNumericEncodingModeTest,
	#superclass : #TestCase,
	#category : #'Barcode-Tests-Core-QR'
}

{ #category : #tests }
QRNumericEncodingModeTest >> testAllowedCharacters [

	QRNumericCharacterSet allowedCharacters 
		do: [:each | self assert: each isDigit ]
]

{ #category : #tests }
QRNumericEncodingModeTest >> testCanEncode [

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
