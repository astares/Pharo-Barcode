"
Error correction within QR codes
"
Class {
	#name : #QRErrorCorrection,
	#superclass : #Object,
	#instVars : [
		'level',
		'errorCorrectionCapability'
	],
	#category : #'Barcode-Code-QR-Utilities'
}

{ #category : #private }
QRErrorCorrection class >> level: aSymbol errorCorrectionCapability: aNumber [

	^(self new)
		level: aSymbol;
		errorCorrectionCapability: aNumber;
		yourself
]

{ #category : #defaults }
QRErrorCorrection class >> levelH [
	"Recovers 30% of data"
	
	^self level: #H errorCorrectionCapability: 30
]

{ #category : #defaults }
QRErrorCorrection class >> levelL [
	"Recovers 7% of data"
	
	^self level: #L errorCorrectionCapability: 7
]

{ #category : #defaults }
QRErrorCorrection class >> levelM [
	"Recovers 15% of data"
	
	^self level: #M errorCorrectionCapability: 15
]

{ #category : #defaults }
QRErrorCorrection class >> levelQ [
	"Recovers 25% of data"
	
	^self level: #Q errorCorrectionCapability: 25
]

{ #category : #comparing }
QRErrorCorrection >> = anotherErrorCorrection [
	
	^self level = anotherErrorCorrection level 
		and: [ self  errorCorrectionCapability = anotherErrorCorrection errorCorrectionCapability ] 
]

{ #category : #accessing }
QRErrorCorrection >> errorCorrectionCapability [

	^errorCorrectionCapability
]

{ #category : #accessing }
QRErrorCorrection >> errorCorrectionCapability: aNumber [

	errorCorrectionCapability := aNumber
]

{ #category : #accessing }
QRErrorCorrection >> level [

	^level
]

{ #category : #accessing }
QRErrorCorrection >> level: aSymbol [

	level := aSymbol
]

{ #category : #printing }
QRErrorCorrection >> printOn: aStream [

	aStream 
		nextPutAll: 'Error Correction Level ';
		nextPutAll: self level;
		space;
		nextPutAll: '(recovers ';
		nextPutAll: errorCorrectionCapability asString;
		nextPutAll:  '% of data)' 
]
