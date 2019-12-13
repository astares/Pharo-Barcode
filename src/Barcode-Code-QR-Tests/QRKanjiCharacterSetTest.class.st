Class {
	#name : #QRKanjiCharacterSetTest,
	#superclass : #TestCase,
	#instVars : [
		'characterSet'
	],
	#category : #'Barcode-Code-QR-Tests-CharacterSets'
}

{ #category : #accessing }
QRKanjiCharacterSetTest >> defaultTestClass [

	^QRKanjiCharacterSet
]

{ #category : #running }
QRKanjiCharacterSetTest >> setUp [ 
	super setUp.
	characterSet := self defaultTestClass
]

{ #category : #tests }
QRKanjiCharacterSetTest >> testModeIndicator [

	self assert: characterSet modeIndicator = '1000'
]
