Class {
	#name : #QRAlphanumericEncodingModeTest,
	#superclass : #TestCase,
	#category : #'Barcode-Tests-Core-QR'
}

{ #category : #tests }
QRAlphanumericEncodingModeTest >> testAllowedCharacters [

	self assert: QRAlphanumericEncodingMode allowedCharacters size = 44

]

{ #category : #tests }
QRAlphanumericEncodingModeTest >> testCanEncode [

	($1 to: $9) do: [:digit | 
		self assert:  (QRNumericEncodingMode canEncode: digit) ].
	
	($A to: $Z) do: [:character | 
		self assert:  (QRNumericEncodingMode canEncode: character) ].	
	
	self 
		assert: (QRNumericEncodingMode canEncode: Character space);
		assert: (QRNumericEncodingMode canEncode: $$;
		assert: (QRNumericEncodingMode canEncode: $%);
		assert: (QRNumericEncodingMode canEncode: $*);
		assert: (QRNumericEncodingMode canEncode: $+);	
		assert: (QRNumericEncodingMode canEncode: $-);
		assert: (QRNumericEncodingMode canEncode: $.);
		assert: (QRNumericEncodingMode canEncode: $/);
		assert: (QRNumericEncodingMode canEncode: $:)).
			
	self 
		deny: (QRNumericEncodingMode canEncode: Character tab);
		deny: (QRNumericEncodingMode canEncode: $a)	 
]
