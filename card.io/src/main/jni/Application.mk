# card.io Application.mk
#
# See the file "LICENSE.md" for the full license governing this code.

APP_CPPFLAGS += -std=c++11 -frtti -fexceptions -DANDROID_DMZ=1 -Wno-c++11-narrowing
APP_STL := c++_shared
APP_ABI := all
NDK_TOOLCHAIN_VERSION := 4.8
APP_CFLAGS += -O3 -Wno-error=format-security

## DEBUG
#APP_ABI := armeabi-v7a
#APP_CFLAGS += -UNDEBUG -O0 -g -ggdb
#APP_OPTIM := debug
#APP_CPPFLAGS += -DDMZ_DEBUG=1

# disable "mangling of 'va_list' has changed in GCC 4.4" warning.
#APP_CFLAGS += -Wno-psabi