Class {
	#name : #QRErrorCorrectionLevel,
	#superclass : #Object,
	#instVars : [
		'level',
		'errorCorrectionCapability'
	],
	#category : #'Barcode-Core-QR'
}

{ #category : #'instance creation' }
QRErrorCorrectionLevel class >> level: aSymbol errorCorrectionCapability: aNumber [

	^(self new)
		level: aSymbol;
		errorCorrectionCapability: aNumber;
		yourself
]

{ #category : #'instance creation' }
QRErrorCorrectionLevel class >> levelH [
	"Recovers 30% of data"
	
	^self level: #H errorCorrectionCapability: 30
]

{ #category : #defaults }
QRErrorCorrectionLevel class >> levelL [
	"Recovers 7% of data"
	
	^self level: #L errorCorrectionCapability: 7
]

{ #category : #defaults }
QRErrorCorrectionLevel class >> levelM [
	"Recovers 15% of data"
	
	^self level: #M errorCorrectionCapability: 15
]

{ #category : #defaults }
QRErrorCorrectionLevel class >> levelQ [
	"Recovers 25% of data"
	
	^self level: #Q errorCorrectionCapability: 25
]

{ #category : #comparing }
QRErrorCorrectionLevel >> = anotherErrorCorrectionLevel [ 
	
	^self level = anotherErrorCorrectionLevel level 
		and: [ self  errorCorrectionCapability = anotherErrorCorrectionLevel errorCorrectionCapability ] 
]

{ #category : #accessing }
QRErrorCorrectionLevel >> errorCorrectionCapability [

	^errorCorrectionCapability
]

{ #category : #accessing }
QRErrorCorrectionLevel >> errorCorrectionCapability: aNumber [

	errorCorrectionCapability := aNumber
]

{ #category : #accessing }
QRErrorCorrectionLevel >> level [

	^level
]

{ #category : #accessing }
QRErrorCorrectionLevel >> level: aSymbol [

	level := aSymbol
]

{ #category : #printing }
QRErrorCorrectionLevel >> printOn: aStream [

	aStream 
		nextPutAll: 'Error Correction Level ';
		nextPutAll: self level;
		space;
		nextPutAll: '(recovers ';
		nextPutAll: errorCorrectionCapability asString;
		nextPutAll:  '% of data)' 
]
