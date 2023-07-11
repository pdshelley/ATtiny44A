#ifdef __clang_version__
// Clang (we are parsing header files as bridging header)
#define __nonnull _Nonnull
#define __nullable _Nullable
#else
// GCC
#define __nonnull 
#define __nullable 
#endif

typedef void (* __nonnull generalInterruptCallback)();
