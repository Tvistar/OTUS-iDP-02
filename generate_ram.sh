MODULE_SRC=OTUS-IDP-02/Modules/NetworkingRAM/Sources/NetworkingRAM
openapi-generator generate -i rick_and_morty.yaml -g swift5 -o api-mobile
rm -r $MODULE_SRC""*
cp -R api-mobile/OpenAPIClient/Classes/OpenAPIs/. $MODULE_SRC
rm -r api-mobile
