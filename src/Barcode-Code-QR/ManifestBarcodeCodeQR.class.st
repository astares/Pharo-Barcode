"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestBarcodeCodeQR,
	#superclass : #PackageManifest,
	#category : #'Barcode-Code-QR-Manifest'
}

{ #category : #'code-critics' }
ManifestBarcodeCodeQR class >> ruleLiteralArrayCharactersRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'QRAlphanumericCharacterSet class' #allowedCharacters #true)) #'2023-12-19T17:31:11.265+01:00') )
]

{ #category : #'code-critics' }
ManifestBarcodeCodeQR class >> ruleLiteralArrayContainsSuspiciousTrueFalseOrNilRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMetaclassDefinition #(#'ManifestBarcodeCodeQR class' #ManifestBarcodeCodeQR)) #'2023-12-19T17:43:18.874+01:00') )
]
