################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="lutro"
PKG_VERSION="a19c2f1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/libretro-lutro"
PKG_URL="$LAKKA_MIRROR/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="An experimental lua game framework for libretro inspired by LÖVE"
PKG_LONGDESC="An experimental lua game framework for libretro inspired by LÖVE"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  PTR_SIZE="-m32"
  if [ "$ARCH" == "x86_64" ]; then
    PTR_SIZE="-m64"
  fi  
  make WANT_JIT=1 HOST_CC="$HOST_CC" PTR_SIZE="$PTR_SIZE" CROSS="$TARGET_PREFIX"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp lutro_libretro.so $INSTALL/usr/lib/libretro/
}
