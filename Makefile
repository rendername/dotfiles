REPOS_DIR = ~/repos
CONFIG_DIR = ~/.config

default:
	git status
	git diff master

install:
	@rsync -azv ./vim ${CONFIG_DIR}

update:
	@rsync -azv ${CONFIG_DIR}/vim ${REPOS_DIR}/dotfiles/
