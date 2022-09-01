#include "microsoft_crazyness.h"
#include "stdio.h"

int main() {
	Find_Result result = find_visual_studio_and_windows_sdk();
	printf("Windows SDK version           := %d\n", result.windows_sdk_version);
	printf("Windows SDK root              := %ls\n", result.windows_sdk_root);
	printf("Windows SDK um   library path := %ls\n", result.windows_sdk_um_library_path);
	printf("Windows SDK ucrt library path := %ls\n", result.windows_sdk_ucrt_library_path);
	printf("Visual Studio executable path := %ls\n", result.vs_exe_path);
	printf("Visual Studio library    path := %ls\n", result.vs_library_path);

	free_resources(&result);
	return 0;
}
