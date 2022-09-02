@echo off
cd build
cl ..\main.cpp ..\project.cpp /Zi /DEBUG -nologo -Gm- -GR- -GS- -Gs9999999 -EHa- -Oi -link -nodefaultlib -subsystem:windows kernel32.lib -stack:0x100000,0x100000
cd ..
