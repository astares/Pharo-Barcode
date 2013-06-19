Class {
	#name : #QRNumericEncodingModeTest,
	#superclass : #TestCase,
	#category : #'Barcode-Tests-Core-QR'
}

{ #category : #tests }
QRNumericEncodingModeTest >> testAllowedCharacters [

	QRNumericEncodingMode allowedCharacters 
		do: [:each | self assert: each isDigit ]
]

{ #category : #tests }
QRNumericEncodingModeTest >> testCanEncode [

	self 
		assert: (QRNumericEncodingMode canEncode: $1);
		assert: (QRNumericEncodingMode canEncode: $2);
		assert: (QRNumericEncodingMode canEncode: $3);
		assert: (QRNumericEncodingMode canEncode: $4);
		assert: (QRNumericEncodingMode canEncode: $5);
		assert: (QRNumericEncodingMode canEncode: $6);
		assert: (QRNumericEncodingMode canEncode: $7);
		assert: (QRNumericEncodingMode canEncode: $8);
		assert: (QRNumericEncodingMode canEncode: $9).
	
	self 
		deny: (QRNumericEncodingMode canEncode: Character space);
		deny: (QRNumericEncodingMode canEncode: $A)	
]
