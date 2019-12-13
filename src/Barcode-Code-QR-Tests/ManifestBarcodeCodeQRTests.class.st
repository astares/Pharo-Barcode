"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestBarcodeCodeQRTests,
	#superclass : #PackageManifest,
	#category : #'Barcode-Code-QR-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestBarcodeCodeQRTests class >> ruleRBUnoptimizedToDoRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#QRAlphanumericCharacterSetTest)) #'2019-12-14T00:06:33.690351+01:00') #(#(#RGPackageDefinition #(#'Barcode-Code-QR-Tests')) #'2019-12-14T00:08:29.296351+01:00') )
]
