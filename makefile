
# 
# First, create yourself an empty project on github: 
# Then, proceed with the following command:
#  project=my_super_cool_project_name make setup
#


url       := https://github.com/DobroSun/
extension := .git
gitignore := "\
*.s[a-z][a-z]   \n\
*.pdb		\n\
*.exe		\n\
*.vs		\n\
*.obj		\n\
"

remote := $(url)$(project)$(extension)


help:
	@echo "This is your help!"


setup:
	echo -e $(gitignore) > .gitignore
	git init
	git submodule add $(url)std$(extension)
	git remote add origin $(remote)
	git add .
	git commit -m "Initial commit. (made by god-like-makefile)"
	git push --set-upstream origin master

undo_failed_setup:
	rm -rfv .git
	rm -rfv .gitignore
	rm -rfv .gitmodules

undo_failed_undo_failed_setup:
	rm -rfv universe/


clone:
	git clone --recurse-submodules $(remote)

commit:
	git commit -m "$(comment)"
	cd std/
	git commit -m "$(comment)"
	cd ../

push:
	git push
	cd std/
	git push
	cd ../



pull:
	git pull
	git submodule update --init --recursive

