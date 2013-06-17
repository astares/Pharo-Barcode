Class {
	#name : #QRErrorCorrectionLevel,
	#superclass : #Object,
	#category : #'Barcode-Core-QR'
}

{ #category : #'instance creation' }
QRErrorCorrectionLevel class >> levelH [
	"Recovers 30% of data"
	
	^(self new) 
		level: #H;
		yourself
]

{ #category : #'instance creation' }
QRErrorCorrectionLevel class >> levelL [
	"Recovers 7% of data"
	
	^(self new) 
		level: #L;
		yourself
]

{ #category : #'instance creation' }
QRErrorCorrectionLevel class >> levelM [
	"Recovers 15% of data"
	
	^(self new) 
		level: #M;
		yourself
]

{ #category : #'instance creation' }
QRErrorCorrectionLevel class >> levelQ [
	"Recovers 25% of data"
	
	^(self new) 
		level: #Q;
		yourself
]
