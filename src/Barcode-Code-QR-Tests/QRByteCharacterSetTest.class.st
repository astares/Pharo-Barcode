Class {
	#name : #QRByteCharacterSetTest,
	#superclass : #TestCase,
	#instVars : [
		'characterSet'
	],
	#category : #'Barcode-Code-QR-Tests-CharacterSets'
}

{ #category : #accessing }
QRByteCharacterSetTest >> defaultTestClass [

	^QRByteCharacterSet
]

{ #category : #running }
QRByteCharacterSetTest >> setUp [ 

	super setUp.
	characterSet := self defaultTestClass.
]

{ #category : #tests }
QRByteCharacterSetTest >> testCanEncode [

	((Character value:1) to: (Character value:255)) 
		do: [:character | self assert:  (characterSet canEncode: character) ].
		
	self deny: (characterSet canEncode: (Character value: 256))
]

{ #category : #tests }
QRByteCharacterSetTest >> testEncode [

	self assert: (characterSet encode: 'Hello, world!') = '01001000011001010110110001101100011011110010110000100000011101110110111101110010011011000110010000100001'


]

{ #category : #tests }
QRByteCharacterSetTest >> testEncodeOnlyByteCharacters [
 
	self should: [characterSet encode:  (Character value: 256) asString ] raise: Error.
]

{ #category : #tests }
QRByteCharacterSetTest >> testModeIndicator [

	self assert: characterSet modeIndicator = '0100'
]
