Class {
	#name : #QRAlphanumericCharacterSetTest,
	#superclass : #TestCase,
	#instVars : [
		'characterSet'
	],
	#category : #'Barcode-Tests-Core-QR'
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

	self assert: characterSet allowedCharacters size = 44

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
			self assert: (characterSet characterCountIndicatorSizeInBitsForVersion: index) = element ]
]

{ #category : #tests }
QRAlphanumericCharacterSetTest >> testEncode [

	self assert: (characterSet encode: 'HELLO WORLD') = '01100001011...'


]

{ #category : #tests }
QRAlphanumericCharacterSetTest >> testEncodeOnlyAlphanumericCharacters [

	self should: [characterSet encode: '<>' ] raise: Error.
]

{ #category : #tests }
QRAlphanumericCharacterSetTest >> testModeIndicator [

	self assert: characterSet modeIndicator = '0010'
]
