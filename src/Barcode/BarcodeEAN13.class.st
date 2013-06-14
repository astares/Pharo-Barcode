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

{ #category : #defaults }
BarcodeEAN13 >> defaultSize [

	^13
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
