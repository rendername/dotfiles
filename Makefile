REPOS_DIR = ~/repos
CONFIG_DIR = ~/.config

default:
	git status
	git diff master --name-only

install:
	@rsync -azv ./nvim ${CONFIG_DIR}
	@rsync -azv ./scripts ${CONFIG_DIR}
	@rsync -azv ./.tmux.conf ~/.tmux.conf
	@rsync -azv ./.emacs.d ~/.emacs.d

update:
	@rsync -azv ${CONFIG_DIR}/nvim ${REPOS_DIR}/dotfiles/
	@rsync -azv ${CONFIG_DIR}/scripts ${REPOS_DIR}/dotfiles/
	@rsync -azv ~/.emacs.d ./.emacs.d
