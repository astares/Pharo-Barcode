Class {
	#name : #Barcode,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #'Barcode-Core'
}

{ #category : #'instance creation' }
Barcode class >> value: aValue [

	^(self new)
		value: aValue;
		yourself
]

{ #category : #accessing }
Barcode >> value [ 
	value ifNil: [ value := String new ].
	^value
]

{ #category : #accessing }
Barcode >> value: aValue [

	value := aValue
]
