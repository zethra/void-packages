if [ "$rust_toolchain" ]; then
	hostmakedepends+=" rustup"
else
	hostmakedepends+=" cargo rust"
fi
