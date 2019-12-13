"
A model indicator
"
Class {
	#name : #QRModeIndicator,
	#superclass : #Object,
	#instVars : [
		'mode',
		'indicator'
	],
	#category : #'Barcode-Code-QR-Utilities'
}

{ #category : #'instance creation' }
QRModeIndicator class >> alphanumericMode [
	 ^self mode: #alphanumericMode indicator: '0010'
]

{ #category : #'instance creation' }
QRModeIndicator class >> byteMode [
	 ^self mode: #byteMode indicator: '0100'
]

{ #category : #'instance creation' }
QRModeIndicator class >> eciMode [
	 ^self mode: #eciMode indicator: '0111'
]

{ #category : #'instance creation' }
QRModeIndicator class >> kanjiMode [
	 ^self mode: #kanjiMode indicator: '1000'
]

{ #category : #'instance creation' }
QRModeIndicator class >> numericMode [
	 ^self mode: #numericMode indicator: '0001'
]
