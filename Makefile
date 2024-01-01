REPOS_DIR = ~/repos
CONFIG_DIR = ~/.config

default:
	git status
	git diff master --name-only

install:
	@rsync -azv --del ./nvim ${CONFIG_DIR}
	@rsync -azv --del ./scripts ${CONFIG_DIR}
	@rsync -azv --del ./.tmux.conf ~/.tmux.conf
	@rsync -azv --del ./.emacs.d ~/

update:
	@rsync -azv --del ${CONFIG_DIR}/nvim ${REPOS_DIR}/dotfiles/
	@rsync -azv --del ${CONFIG_DIR}/scripts ${REPOS_DIR}/dotfiles/
	@rsync -azv --del ~/.emacs.d ./
