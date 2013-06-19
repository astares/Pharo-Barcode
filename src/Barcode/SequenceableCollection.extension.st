Extension { #name : #SequenceableCollection }

{ #category : #'*Barcode' }
SequenceableCollection >> splitIntoSegmentsOfSize: anInteger [ 

	|res nrOfSegments|
	nrOfSegments := self size \\ anInteger + (self size // anInteger).
	res := Array new: nrOfSegments. 
	1 to: nrOfSegments do: [:each | 
		each <= (self size \\ anInteger)
			ifTrue: [ res at: each put: (self copyFrom: 1 * each to: 1 * each + anInteger - 1) ]
	].
	^res
]
