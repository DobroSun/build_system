.PHONY: all

# 
# First, create yourself an empty project on github: 
# Then, proceed with the following command:
#  project=my_super_cool_project_name make setup
#

visual_studio_vcvarsall := "E:\Install\Visual Studio\VC\Auxiliary\Build\vcvarsall.bat"
target_arch 			:= x64

git_path  := "E:\Install\Git\usr\bin"
url       := https://github.com/DobroSun/
extension := .git

remote := $(url)$(project)$(extension)


help:
	@echo "Help: this is your help!"


setup: shell
	echo -e $(gitignore) > .gitignore
	$(git) init
	$(git) submodule add $(url)std$(extension)
	$(git) remote add origin $(remote)
	$(git) add .
	$(git) commit -m "Initial commit. (made by god-like-makefile)"
	$(git) push --set-upstream origin master

undo_failed_setup:
	rm -rfv .git
	rm -rfv .gitignore
	rm -rfv .gitmodules

undo_failed_undo_failed_setup:
	rm -rfv universe/

shell:
	set path=$(git_path);%path%"
	call $(visual_studio_vcvarsall) $(target_arch)"


clone:
	$(git) clone --recurse-submodules $(remote)

commit:
	$(git) commit -m "$(comment)"
	cd std/
	$(git) commit -m "$(comment)"
	cd ../

push:
	$(git) push
	cd std/
	$(git) push
	cd ../

pull:
	$(git) pull
	$(git) submodule update --init --recursive

