#include "microsoft_crazyness.h"
#include "stdio.h"

#define MAX_STRING_PATH 1024

int main() {
	Find_Result result = find_visual_studio_and_windows_sdk();
	printf("Windows SDK version           := %d\n", result.windows_sdk_version);
	printf("Windows SDK root              := %ls\n", result.windows_sdk_root);
	printf("Windows SDK um   library path := %ls\n", result.windows_sdk_um_library_path);
	printf("Windows SDK ucrt library path := %ls\n", result.windows_sdk_ucrt_library_path);
	printf("Visual Studio executable path := %ls\n", result.vs_exe_path);
	printf("Visual Studio library    path := %ls\n", result.vs_library_path);

	size_t size = sizeof(wchar_t) * MAX_STRING_PATH;
	wchar_t* cd = (wchar_t*) malloc(size);
	memset(cd, 0, size);

	wsprintfW(cd, L"cd %ls", result.vs_exe_path);
	printf("%ls\n", cd);

	ShellExecuteW(0, L"open", L"cmd.exe", cd, 0, SW_SHOW);


	free(cd);
	free_resources(&result);
	return 0;
}
