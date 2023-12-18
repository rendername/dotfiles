REPOS_DIR = ~/repos
CONFIG_DIR = ~/.config

default:
	git status
	git diff master --name-only

install:
	@rsync -azv ./nvim ${CONFIG_DIR}

update:
	@rsync -azv ${CONFIG_DIR}/nvim ${REPOS_DIR}/dotfiles/
