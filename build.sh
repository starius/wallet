mkdir "build" && cd ./build
mv local.properties{,_bp} || true
podman run -v $PWD:/app/valet/wallet:z valet
mv local.properties{_bp,} || true
