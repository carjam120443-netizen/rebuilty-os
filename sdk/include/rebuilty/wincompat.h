#pragma once

/*
 * Rebuilty OS Windows-compatibility shim.
 *
 * This header intentionally contains only interface definitions owned by
 * Rebuilty OS. The actual Win32/NT implementation comes from the open-source
 * ReactOS tree that is fetched during the build.
 */

#ifdef __cplusplus
extern "C" {
#endif

typedef void *RB_HANDLE;
typedef unsigned long RB_DWORD;
typedef int RB_BOOL;
typedef const char *RB_LPCSTR;

#define RB_TRUE 1
#define RB_FALSE 0

/* Small stable API surface for early Rebuilty applications. */
RB_BOOL RebuiltyIsWindowsCompatible(void);
const char *RebuiltyGetCompatibilityName(void);

#ifdef __cplusplus
}
#endif
