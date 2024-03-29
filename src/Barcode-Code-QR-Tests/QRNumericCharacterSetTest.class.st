Class {
	#name : #QRNumericCharacterSetTest,
	#superclass : #TestCase,
	#instVars : [
		'characterSet'
	],
	#category : #'Barcode-Code-QR-Tests-CharacterSets'
}

{ #category : #accessing }
QRNumericCharacterSetTest >> defaultTestClass [

	^QRNumericCharacterSet 
]

{ #category : #running }
QRNumericCharacterSetTest >> setUp [ 

	super setUp.
	characterSet := self defaultTestClass.
]

{ #category : #tests }
QRNumericCharacterSetTest >> testAllowedCharacters [

	characterSet allowedCharacters 
		do: [:each | self assert: each isDigit ]
]

{ #category : #tests }
QRNumericCharacterSetTest >> testCanEncode [

	self 
		assert: (characterSet canEncode: $0);
		assert: (characterSet canEncode: $1);
		assert: (characterSet canEncode: $2);
		assert: (characterSet canEncode: $3);
		assert: (characterSet canEncode: $4);
		assert: (characterSet canEncode: $5);
		assert: (characterSet canEncode: $6);
		assert: (characterSet canEncode: $7);
		assert: (characterSet canEncode: $8);
		assert: (characterSet canEncode: $9).
	
	self 
		deny: (characterSet canEncode: Character space);
		deny: (characterSet canEncode: $A)	
]

{ #category : #tests }
QRNumericCharacterSetTest >> testCharacterCountIndicatorSizeInBits [
	"version 1 through 9 with 10 bits, version 10 through 26 with 12 bits, version 27 through 40 with 14 bits"
	
	#(10 10 10 10 10 10 10 10 10
	   12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12
	   14 14 14 14 14 14 14 14 14 14 14 14 14 14)
		withIndexDo: [:element :index | 
			self assert: (characterSet characterCountIndicatorSizeInBitsForVersion: index) equals: element ]
]

{ #category : #tests }
QRNumericCharacterSetTest >> testEncode [

	self assert: (characterSet encode: '8675309') equals: '110110001110000100101001'.
	
	self assert: (characterSet encode: '01234567') equals: '000000110001010110011000011'.
	


]

{ #category : #tests }
QRNumericCharacterSetTest >> testEncodeOnlyNumericCharacters [

	self should: [characterSet encode: 'non numeric content' ] raise: Error.
]

{ #category : #tests }
QRNumericCharacterSetTest >> testEncodeWithLeadingZeros [
	"If the group starts with a zero, it should be interpreted as a two-digit number, and if there are two zeroes at the beginning of the group, it should be interpreted as a one-digit number."

	self assert: (characterSet encode: '09') equals: '1001'.
	self assert: (characterSet encode: '009') equals: '1001'.

	self assert: (characterSet encode: '00909') equals: '10011001'.
	self assert: (characterSet encode: '009009') equals: '10011001'  "gives same bit pattern"
]

{ #category : #'tests-iso spec' }
QRNumericCharacterSetTest >> testISOSpecExample1 [
	|barcode|
	barcode := QRBarcode new.
	barcode data: '01234567'. 
	barcode encoding: (QREncoding
							version: 1							
							errorCorrection: QRErrorCorrection levelH
							characterSet: self defaultTestClass).	
	self assert: (barcode binarySequence copyFrom: 1 to: 41) equals: ('0001','0000001000','0000001100','0101011001','1000011')
 	 
]

{ #category : #'tests-iso spec' }
QRNumericCharacterSetTest >> testISOSpecExample2 [
	|barcode|
	barcode := QRBarcode new.
	barcode data: '0123456789012345'. 
	barcode encoding: (QREncoding
							version: 1							
							errorCorrection: QRErrorCorrection levelH
							characterSet: self defaultTestClass).	
	self assert: (barcode binarySequence copyFrom: 1 to: 68) =  ('0001','0000010000','0000001100','0101011001','1010100110', '1110000101', '0011101010', '0101')
 	 
]

{ #category : #tests }
QRNumericCharacterSetTest >> testModeIndicator [

	self assert: characterSet modeIndicator equals: '0001'
]
