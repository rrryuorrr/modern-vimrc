#!/bin/sh
set -eu

install_root=${XDG_DATA_HOME:-"$HOME/.local/share"}/modern-vimrc/gvim
bin_dir=${HOME}/.local/bin
work_dir=$(mktemp -d)
trap 'rm -rf "$work_dir"' EXIT HUP INT TERM

command -v apt-get >/dev/null 2>&1 || {
  echo "This installer requires apt-get (Ubuntu/Debian)." >&2
  exit 1
}
command -v dpkg-deb >/dev/null 2>&1 || {
  echo "This installer requires dpkg-deb." >&2
  exit 1
}

mkdir -p "$install_root" "$bin_dir"
cd "$work_dir"
apt-get download \
  vim-gtk3 \
  vim-gui-common \
  libcanberra0t64 \
  liblua5.1-0 \
  libtdb1 \
  libvorbisfile3

for package in ./*.deb; do
  dpkg-deb -x "$package" "$install_root"
done

lib_dir=$(find "$install_root/usr/lib" -maxdepth 1 -type d -name '*-linux-gnu' | head -n 1)
[ -n "$lib_dir" ] || {
  echo "Could not find the extracted GVim library directory." >&2
  exit 1
}

cat >"$bin_dir/gvim-local" <<EOF
#!/bin/sh
export LD_LIBRARY_PATH="$lib_dir\${LD_LIBRARY_PATH:+:\$LD_LIBRARY_PATH}"
exec "$install_root/usr/bin/vim.gtk3" -g "\$@"
EOF
chmod +x "$bin_dir/gvim-local"

echo "Installed GVim locally."
echo "Run: $bin_dir/gvim-local"
