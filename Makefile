REPOS_DIR = ~/repos
CONFIG_DIR = ~/.config

default:
	git status
	git diff master

install:
	@rsync -azv ./nvim ${CONFIG_DIR}

update:
	@rsync -azv ${CONFIG_DIR}/nvim ${REPOS_DIR}/dotfiles/
