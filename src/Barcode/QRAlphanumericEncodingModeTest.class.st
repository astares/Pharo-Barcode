Class {
	#name : #QRAlphanumericEncodingModeTest,
	#superclass : #TestCase,
	#category : #'Barcode-Tests-Core-QR'
}

{ #category : #tests }
QRAlphanumericEncodingModeTest >> testAllowedCharacters [

	self assert: QRAlphanumericCharacterSet allowedCharacters size = 44

]

{ #category : #tests }
QRAlphanumericEncodingModeTest >> testCanEncode [

	($1 to: $9) do: [:digit | 
		self assert:  (QRAlphanumericCharacterSet canEncode: digit) ].
	
	($A to: $Z) do: [:character | 
		self assert:  (QRAlphanumericCharacterSet canEncode: character) ].	
	
	self 
		assert: (QRAlphanumericCharacterSet canEncode: Character space);
		assert: (QRAlphanumericCharacterSet canEncode: $$);
		assert: (QRAlphanumericCharacterSet canEncode: $%);
		assert: (QRAlphanumericCharacterSet canEncode: $*);
		assert: (QRAlphanumericCharacterSet canEncode: $+);	
		assert: (QRAlphanumericCharacterSet canEncode: $-);
		assert: (QRAlphanumericCharacterSet canEncode: $.);
		assert: (QRAlphanumericCharacterSet canEncode: $/);
		assert: (QRAlphanumericCharacterSet canEncode: $:).
			
	self 
		deny: (QRAlphanumericCharacterSet canEncode: Character tab);
		deny: (QRAlphanumericCharacterSet canEncode: $a)	 
]
