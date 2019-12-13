Class {
	#name : #BarcodeEAN,
	#superclass : #Barcode,
	#category : #'Barcode-Code-EAN-Base'
}

{ #category : #conversion }
BarcodeEAN >> asForm [
	
	^self asFormOfHeight: 40.
]

{ #category : #conversion }
BarcodeEAN >> asFormOfHeight: height [
	| seq form |
	seq := self binarySequence. 
	form := Form extent: (seq size)@height.
	seq withIndexDo: [:each :index |
		each = $1 ifTrue: [
			1 to: height do: [:y | form colorAt: (index - 1)@(y - 1) put: Color black ] ]].
	^form

]

{ #category : #accessing }
BarcodeEAN >> binarySequence [

	| left right leftUpTo |
	leftUpTo := self defaultSize // 2 +  (self defaultSize \\ 2).
	left := self data copyFrom: 1 to: leftUpTo.
	right := self data copyFrom: leftUpTo + 1 to: self defaultSize.
	^String streamContents: [:stream |
			stream nextPutAll: '101'.
			self leftBinarySequenceOn: stream for: left.
			stream nextPutAll: '01010'.
			self rightBinarySequenceOn: stream for: right.
			stream nextPutAll: '101'
	 ].
 
]

{ #category : #private }
BarcodeEAN >> computeChecksum [

	|odd even|
	odd := 0. even := 0.
	self data allButLast reverse doWithIndex: [:el : index |
		index even 
			ifTrue: [ even := even + el digitValue ]
			ifFalse: [ odd := odd + el digitValue ]].
	^( 10 - ((3 * odd + even) \\ 10 )) \\ 10
]

{ #category : #defaults }
BarcodeEAN >> defaultSize [

	^self subclassResponsibility 
]

{ #category : #testing }
BarcodeEAN >> hasValidCheckSum [

	(self data isAllDigits) ifFalse: [ ^false ].
	(self data size = self defaultSize) ifFalse: [ ^false ].
	^self computeChecksum = self data last digitValue
]

{ #category : #private }
BarcodeEAN >> leftBinarySequenceOn: aStream for: leftString [  

	leftString do: [:each | aStream nextPutAll: (self leftRuleTable at: each digitValue + 1) ]
	
]

{ #category : #'private accessing' }
BarcodeEAN >> leftRuleTable [

	^#('0001101' '0011001' '0010011' '0111101' '0100011' '0110001' '0101111' '0111011' '0110111' '0001011')
]

{ #category : #private }
BarcodeEAN >> rightBinarySequenceOn: aStream for: rightString [

	rightString do: [:each | aStream nextPutAll: (self rightRuleTable at: each digitValue + 1) ]
	
]

{ #category : #'private accessing' }
BarcodeEAN >> rightRuleTable [

	^#('1110010' '1100110' '1101100' '1000010' '1011100' '1001110' '1010000' '1000100' '1001000' '1110100')
]
