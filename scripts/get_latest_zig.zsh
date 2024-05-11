#!/usr/bin/env zsh

tmp_dir="$(mktemp -d)"
trap 'rm -rf -- "$tmp_dir"' EXIT

json="$(noglob curl -s https://ziglang.org/download/index.json | jq -r '{ version:.master.version, tarball:.master."x86_64-linux".tarball }')"

version="$(echo $json | jq -r '.version')"
tarball_url="$(echo $json | jq -r '.tarball')"

echo "----"
echo "Version: '$version'"
echo "Tarball URL: '$tarball_url'"

if [ -z "$version" ] || [ -z "$tarball_url" ]; then
    echo "Error: Failed to extract the version or tarball URL."
    exit 1
fi

tarball="${tarball_url##*/}"
extract_dir="$(basename $tarball .tar.xz)"

echo "----"
echo "Fetching: '$tarball_url'"
curl -s "$tarball_url" -o "$tmp_dir/$tarball"

echo "----"
echo "Extracting to '$HOME/build'"
tar -xJf "$tmp_dir/$tarball" -C "$HOME/build"

abs_path_to_new_zig_bin="$HOME/build/$extract_dir/zig"
target="$HOME/local/bin/zig"

echo "----"
echo "Creating symlink from '$abs_path_to_new_zig_bin' to '$target'"
ln -sf "$abs_path_to_new_zig_bin" "$target"

echo "----"
echo "Done."

