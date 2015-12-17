.PHONY:all run test clean jetpack xpi
sdk.version=1.17
CFX=addon-sdk-${sdk.version}/bin/cfx
OUTDIR=pubmed0journal


all: pubmed0journal.xpi

pubmed0journal.xpi: xpi
	mv $(OUTDIR)/$@ ./

xpi test run: ${CFX}
	(cd ${OUTDIR}; ../${CFX} $@)


jetpack: ${CFX}
${CFX}:
	curl -kL -o "jetpack-sdk-${sdk.version}.zip" "https://ftp.mozilla.org/pub/mozilla.org/labs/jetpack/addon-sdk-${sdk.version}.zip" && \
	unzip -o "jetpack-sdk-${sdk.version}.zip" && \
	rm -f "jetpack-sdk-${sdk.version}.zip"

clean:
	rm -rf addon-sdk-${sdk.version} pubmed0journal.xpi
