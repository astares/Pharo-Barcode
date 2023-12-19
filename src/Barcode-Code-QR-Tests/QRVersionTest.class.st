Class {
	#name : #QRVersionTest,
	#superclass : #TestCase,
	#category : #'Barcode-Code-QR-Tests-Utilities'
}

{ #category : #'tests - limits' }
QRVersionTest >> testBadVersionLowerEnd [

	self should: [ QRVersion nr: 0 ] raise: Error
]

{ #category : #'tests - limits' }
QRVersionTest >> testBadVersionUpperEnd [

	self should: [ QRVersion nr: 50 ] raise: Error
]

{ #category : #'tests - converting' }
QRVersionTest >> testConverting [

	self assert: 1 asQRVersion equals: (QRVersion nr: 1)
]

{ #category : #'tests - hashing' }
QRVersionTest >> testInsertIntoSet [

	| v1 v2 c |
	v1 := QRVersion nr: 12.
	v2 := QRVersion nr: 12.
	c := OrderedCollection with: v1 with: v2.
	self assert: c asSet size equals: 1
]

{ #category : #tests }
QRVersionTest >> testInstanceCreation [

	| instance |
	instance := (QRVersion nr: 1).
	self assert: instance number equals: 1
]

{ #category : #tests }
QRVersionTest >> testInstanceCreationFromInteger [

	self assert: 1 asQRVersion number equals: 1
]

{ #category : #'tests - printing' }
QRVersionTest >> testPrinting [

	self assert: (QRVersion nr: 12) printString equals: 'QRVersion nr: 12'
]

{ #category : #tests }
QRVersionTest >> testSymbolSizes [

	#(1 21 2 25 3 29 4 33 5 37 6 41 7 45 8 49 9 53 10 57 11 61 12 65 13 69 14 73 15 77 16 81 17 85 18 89 19 93 20 97 21 101 22 105 23 109 24 113 25 117 26 121 27 125 28 129 29 133 30 137 31 141 32 145 33 149 34 153 35 157 36 161 37 165 38 169 39 173 40 177) pairsDo: [:version :expectedSize |
		self assert: (QRVersion nr: version) symbolSizeInPixels equals: expectedSize ]
]
