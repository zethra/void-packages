#
# This helper is for templates using cargo
#

cargo_build_args=""

do_configure() {
	# local cargo_cmd
	# local cargo_build_args
	if [ "$rust_toolchain" ]; then
		rustup install "${rust_toolchain}"
		rustup default "${rust_toolchain}"
	fi
	if [ "$rust_features" ]; then
		cargo_build_args+=" --features=\"${rust_features}\""
	fi
	if [ "$rust_bin" ]; then
		cargo_build_args+=" --bin=\"${rust_bin}\""
	fi
	if [ "$cargo_args" ]; then
		cargo_build_args+=" ${cargo_args}"
	fi
}

do_build() {
	cargo build --release ${cargo_build_args}
}

do_check() {
	cargo check --release
	cargo test --release
}

do_install() {
	find target -maxdepth 2 -type f -executable | while read line; do
		vbin ${line}
	done
}
