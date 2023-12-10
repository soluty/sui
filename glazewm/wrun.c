// https://zhuanlan.zhihu.com/p/157633688?from_voters_page=true
#include <windows.h>

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPWSTR lpCmdLine, int nCmdShow) {
    STARTUPINFO si;
    PROCESS_INFORMATION pi;

    ZeroMemory(&si, sizeof(si));
    si.cb = sizeof(si);
    ZeroMemory(&pi, sizeof(pi));

    CreateProcessW(NULL, lpCmdLine, NULL, NULL, 0, CREATE_NO_WINDOW, NULL, NULL, &si, &pi);

    return 0;
}