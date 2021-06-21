# card.io Application.mk
#
# See the file "LICENSE.md" for the full license governing this code.

#LIBCXX rebuild was needed once when using APP_STL := c++_static
APP_CPPFLAGS += -std=c++11 -frtti -fexceptions -DANDROID_DMZ=1 -Wno-c++11-narrowing
APP_STL := c++_static
#Also the gnu compiler can be used
#APP_STL:= gnustl_static
APP_ABI := all
NDK_TOOLCHAIN_VERSION := 4.8
APP_PLATFORM=android-16
#APP_STL := c++_shared
#APP_PLATFORM := android-16
#
#NDK_TOOLCHAIN_VERSION := clang
#APP_CPPFLAGS += -static-libstdc++
## RELEASE
APP_CFLAGS += -O3 -Wno-error=format-security

## DEBUG
#APP_ABI := armeabi-v7a
#APP_CFLAGS += -UNDEBUG -O0 -g -ggdb 
#APP_OPTIM := debug
#APP_CPPFLAGS += -DDMZ_DEBUG=1


# disable "mangling of 'va_list' has changed in GCC 4.4" warning.
#APP_CFLAGS += -Wno-psabi