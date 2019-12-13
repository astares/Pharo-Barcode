Extension { #name : #SequenceableCollection }

{ #category : #'*Barcode-Core' }
SequenceableCollection >> splitIntoChunksOfMaxSize: anInteger [ 
	| nrOfSegments res hasIncomplete complete|
	hasIncomplete := self size \\ anInteger ~= 0.
	complete := self size // anInteger.
	nrOfSegments := complete + (hasIncomplete ifTrue: [1] ifFalse: [0]).
	res := Array new: nrOfSegments.
	1 to: complete do: [:section | 
		res at: section put: (self copyFrom: section * anInteger - anInteger + 1 to: section * anInteger). 
	 ].
	hasIncomplete ifTrue: [ res at: complete +1 put: (self copyFrom: complete * anInteger + 1 to: self size) ].
	^res
]
