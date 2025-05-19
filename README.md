
# ccminer-termux

Port and build of `ccminer` optimized for ARM devices running Termux on Android.

## Features

- Mining on Android via Termux
- Supports ARM architecture (including non-AVX CPUs)
- Built and tested in Termux (e.g. on STB devices)

---

## Installation Steps

### 1. Install Termux

Download Termux from [F-Droid](https://f-droid.org/packages/com.termux/).

### 2. Install dependencies

```bash
pkg update && pkg upgrade
pkg install git build-essential clang cmake curl openssh
```

### 3. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/ccminer-termux.git
cd ccminer-termux
```

### 4. Compile ccminer

```bash
./autogen.sh
./configure CXX=clang++ --with-cuda=no
make -j$(nproc)
```

---

## Common Errors & Fixes

### `fatal error: 'compat/endian.h' file not found`

**Fix:** Replace the include with:

```cpp
#include <endian.h>
```

or manually define:

```cpp
#ifndef htole16
#include <stdint.h>
#define htole16(x) (x)
#define htole32(x) (x)
#define htole64(x) (x)
#define le16toh(x) (x)
#define le32toh(x) (x)
#define le64toh(x) (x)
#endif
```

---

### `use of undeclared identifier 'pthread_setcanceltype'`

**Fix:** Wrap the code with preprocessor check:

```cpp
#ifdef __GLIBC__
pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
#endif
```

---


## Credits

Modified and compiled from sources originally by tpruvot and Oink70.
