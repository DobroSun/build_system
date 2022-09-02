#include <windows.h>


int wmain(HINSTANCE Instance, LPWSTR CommandLine);

void __stdcall WinMainCRTStartup() {
    int result = wmain(GetModuleHandle(0), GetCommandLineW());
    ExitProcess(result);
}

extern "C"
{
    int _fltused = 0x9875;

    #pragma function(memset)
    void* memset(void* dest, int c, size_t count) {
        char* bytes = (char*) dest;
        while (count--) {
            *bytes++ = (char)c;
        }
        return dest;
    }

    #pragma function(memcpy)
    void* memcpy(void* dest, const void* src, size_t count) {
        char* dest8 = (char*) dest;
        char* src8  = (char*) src;
        while (count--) {
            *dest8++ = *src8++;
        }
        return dest;
    }
}