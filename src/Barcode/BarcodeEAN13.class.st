"
This class represents Barcode EAN 13
see
http://barcode-coder.com/en/ean-13-specification-102.html
"
Class {
	#name : #BarcodeEAN13,
	#superclass : #BarcodeEAN,
	#category : #'Barcode-Core'
}

{ #category : #example }
BarcodeEAN13 class >> example [

	^self value: '2109876543210'
]

{ #category : #conversion }
BarcodeEAN13 >> asForm [
	
	^self asFormOfHeight: 40.
]

{ #category : #conversion }
BarcodeEAN13 >> asFormOfHeight: height [
	| seq form |
	seq := self binarySequence. 
	form := Form extent: (seq size)@height.
	seq withIndexDo: [:each :index |
		each = $1 ifTrue: [
			1 to: height do: [:y | form colorAt: (index - 1)@(y - 1) put: Color black ] ]].
	^form

]

{ #category : #accessing }
BarcodeEAN13 >> binarySequence [

	| left right |
	left := self value copyFrom: 1 to: 7.
	
	right := self value copyFrom: 8 to: 13.
	^String streamContents: [:stream |
			stream nextPutAll: '101'.
			self leftBinarySequenceOn: stream for: left.
			stream nextPutAll: '01010'.
			stream nextPutAll: (self rightBinarySequenceFor: right).
			stream nextPutAll: '101'
	 ].
 
]

{ #category : #private }
BarcodeEAN13 >> computeChecksum [

	|odd even|
	odd := even := 0.
	self value allButLast reverse pairsDo: [:newOdd : newEven |
		odd := odd + newOdd digitValue.
		even := even + newEven digitValue.		
	].
	^( 10 - ((3 * odd + even) \\ 10 )) \\ 10
]

{ #category : #testing }
BarcodeEAN13 >> hasValidCheckSum [

	(self value isAllDigits) ifFalse: [ ^false ].
	(self value size = 13) ifFalse: [ ^false ].
	^self computeChecksum = self value last digitValue
]

{ #category : #'private accessing' }
BarcodeEAN13 >> leftBinarySequence0Table [

	^#('0001101' '0011001' '0010011' '0111101' '0100011' '0110001' '0101111' '0111011' '0110111' '0001011')
]

{ #category : #'private accessing' }
BarcodeEAN13 >> leftBinarySequence1Table [

	^#('0100111' '0110011' '0011011' '0100001' '0011101' '0111001' '0000101' '0010001' '0001001' '0010111')
]

{ #category : #private }
BarcodeEAN13 >> leftBinarySequenceOn: aStream for: leftString [
	|lookupSequence|
	lookupSequence := self leftRuleTable at: leftString first digitValue + 1.	
	(leftString copyFrom: 2 to: leftString size) 
		withIndexDo: [:each :index|  
			aStream nextPutAll: 
				((lookupSequence at: index) = $0
					ifTrue: [ self leftBinarySequence0Table at: each digitValue + 1 ]
					ifFalse: [ self leftBinarySequence1Table at: each digitValue + 1 ])
	]
	
	
]

{ #category : #'private accessing' }
BarcodeEAN13 >> leftRuleTable [

	^#('000000' '001011' '001101' '001110' '010011' '011001' '011100' '010101' '010110' '011010')
]

{ #category : #'private accessing' }
BarcodeEAN13 >> rightBinarySequenceFor: valueString [

	^'100111010111001000010110110011001101110010'
]

{ #category : #private }
BarcodeEAN13 >> rightBinarySequenceOn: aStream for: rightString [

	rightString do: [:each | aStream nextPutAll: (self rightRuleTable at: each digitValue + 1) ]
	
]

{ #category : #'private accessing' }
BarcodeEAN13 >> rightRuleTable [

	^#('1110010' '1100110' '1101100' '1000010' '1011100' '1001110' '1010000' '1000100' '1001000' '1110100')
]
