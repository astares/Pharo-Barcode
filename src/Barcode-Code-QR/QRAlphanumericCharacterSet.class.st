"
Alphanumeric mode is for the decimal digits 0 through 9, as well as uppercase letters (not lowercase!), and the symbols $, %, *, +, -, ., /, and : as well as a space.  
"
Class {
	#name : #QRAlphanumericCharacterSet,
	#superclass : #QREncodableCharacterSet,
	#category : #'Barcode-Code-QR-CharacterSets'
}

{ #category : #'private accessing' }
QRAlphanumericCharacterSet class >> allowedCharacters [

	^OrderedCollection new
			addAll: ($1 to: $9);
      		addAll: ($A to: $Z);
			add: Character space;
			addAll: #($$ $% $* $+ $- $. $/ $:);
			yourself
]

{ #category : #testing }
QRAlphanumericCharacterSet class >> canEncode: aCharacter [

	^self allowedCharacters includes: aCharacter
]

{ #category : #'private accessing' }
QRAlphanumericCharacterSet class >> capacityTable [
	"Return the capacity table in the form of #((LMQH) (LMQH) (LQMH) ...) for each of the 40 versions."

	^#((25 20 16 10) (47 38 29 20) (77 61 47 35) (114 90 67 50) (154 122 87 64) (195 154 108 84) (224 178 125 93) (279 221 157 122) (335 262 189 143) (395 311 221 174) (468 366 259 200) (535 419 296 227) (619 483 352 259) (667 528 376 283) (758 600 426 321) (854 656 470 365) (938 734 531 408) (1046 816 574 452) (1153 909 644 493) (1249 970 702 557) (1352 1035 742 587) (1460 1134 823 640) (1588 1248 890 672) (1704 1326 963 744) (1853 1451 1041 779) (1990 1542 1094 864) (2132 1637 1172 910) (2223 1732 1263 958) (2369 1839 1322 1016) (2520 1994 1429 1080) (2677 2113 1499 1150) (2840 2238 1618 1226) (3009 2369 1700 1307) (3183 2506 1787 1394) (3351 2632 1867 1431) (3537 2780 1966 1530) (3729 2894 2071 1591) (3927 3054 2181 1658) (4087 3220 2298 1774) (4296 3391 2420 1852))
]

{ #category : #accessing }
QRAlphanumericCharacterSet class >> characterCountIndicatorSizeInBitsForVersion: version [

	((1 to: 9) includes: version) ifTrue: [ ^9 "bits" ].
	((10 to: 26) includes: version) ifTrue: [ ^11    "bits" ].
	((27 to: 40) includes: version) ifTrue: [ ^13 "bits" ].
	self error: 'bad version (only 1 to 40 allowed)'
]

{ #category : #encoding }
QRAlphanumericCharacterSet class >> encode: aDataString [
	"
	For each pair of characters, get the number representation (from the alphanumeric table) of the first character and multiply it by 45. Then add that number to the number representation of the second character.
	Convert that number into an 11-bit binary string, padding on the left with 0s if necessary.
	If you are encoding an odd number of characters, take the numeric representation of the final character and convert it into a 6-bit binary string."
	
	|value padTo|
	self verifyEncodable: aDataString.
	
	^String streamContents: [:stream |
		(aDataString splitIntoChunksOfMaxSize: 2) do: [:each |	
			value := (self allowedCharacters indexOf: each first).
			padTo := 6.
			each size > 1 ifTrue: [ value := value * 45 + (self allowedCharacters indexOf: each second). padTo := 11]	.			   
			stream nextPutAll: (((value asNumber printStringRadix: 2) allButFirst: 2) padLeftTo: padTo with: $0) ]]
	
	
]

{ #category : #accessing }
QRAlphanumericCharacterSet class >> modeIndicator [

	^'0010'
]
