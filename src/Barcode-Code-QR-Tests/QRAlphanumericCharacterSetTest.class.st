Class {
	#name : #QRAlphanumericCharacterSetTest,
	#superclass : #TestCase,
	#instVars : [
		'characterSet'
	],
	#category : #'Barcode-Code-QR-Tests-CharacterSets'
}

{ #category : #accessing }
QRAlphanumericCharacterSetTest >> defaultTestClass [

	^QRAlphanumericCharacterSet 
]

{ #category : #running }
QRAlphanumericCharacterSetTest >> setUp [ 
	super setUp.
	characterSet := self defaultTestClass
]

{ #category : #tests }
QRAlphanumericCharacterSetTest >> testAllowedCharacters [

	self assert: characterSet allowedCharacters size equals: 44

]

{ #category : #tests }
QRAlphanumericCharacterSetTest >> testCanEncode [

   ($1 to: $9) do: [:digit | 
		self assert:  (characterSet canEncode: digit) ].
	
	($A to: $Z) do: [:character | 
		self assert:  (characterSet canEncode: character) ].	
	
	self 
		assert: (characterSet canEncode: Character space);
		assert: (characterSet canEncode: $$);
		assert: (characterSet canEncode: $%);
		assert: (characterSet canEncode: $*);
		assert: (characterSet canEncode: $+);	
		assert: (characterSet canEncode: $-);
		assert: (characterSet canEncode: $.);
		assert: (characterSet canEncode: $/);
		assert: (characterSet canEncode: $:).
			
	self 
		deny: (characterSet canEncode: Character tab);
		deny: (characterSet canEncode: $a)	 
]

{ #category : #tests }
QRAlphanumericCharacterSetTest >> testCharacterCountIndicatorSizeInBits [
	"version 1 through 9 with 9 bits, version 10 through 26 with 11 bits, version 27 through 40 with 13 bits"
	
	#(9 9 9 9 9 9 9 9 9
	   11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11
	   13 13 13 13 13 13 13 13 13 13 13 13 13 13)
		withIndexDo: [:element :index | 
			self assert: (characterSet characterCountIndicatorSizeInBitsForVersion: index) equals: element ]
]

{ #category : #tests }
QRAlphanumericCharacterSetTest >> testEncode [

	self assert: (characterSet encode: 'HELLO WORLD') equals: '0110000101101111000110100010111001011011100010011010100001101'


]

{ #category : #tests }
QRAlphanumericCharacterSetTest >> testEncodeOnlyAlphanumericCharacters [

	self should: [characterSet encode: '<>' ] raise: Error.
]

{ #category : #'tests-iso spec' }
QRAlphanumericCharacterSetTest >> testISOSpecExample1 [
	|barcode|
	barcode := QRBarcode new.
	barcode data: 'AC-42'. 
	barcode encoding: (QREncoding
							version: 1							
							errorCorrection: QRErrorCorrection levelH
							characterSet: self defaultTestClass).	
	self assert: (barcode binarySequence copyFrom: 1 to: 41) equals: ('0010','000000101','00111001110','11100111001','000010')  
]

{ #category : #tests }
QRAlphanumericCharacterSetTest >> testModeIndicator [

	self assert: characterSet modeIndicator equals: '0010'
]
