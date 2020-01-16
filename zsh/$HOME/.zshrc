source "${HOME}/.profile"

### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

# zdharma/history-search-multi-word
zstyle ":history-search-multi-word" page-size "11"
zplugin ice wait"1" lucid
zplugin load zdharma/history-search-multi-word

# fast-syntax-highlighting
zplugin ice wait"1" lucid atinit"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

# zsh-autosuggestions
zplugin ice wait"1" lucid atload"!_zsh_autosuggest_start"
zplugin load zsh-users/zsh-autosuggestions

zplugin snippet OMZ::plugins/jenv/jenv.plugin.zsh
zplugin snippet OMZ::plugins/thefuck/thefuck.plugin.zsh
zplugin snippet OMZ::plugins/gpg-agent/gpg-agent.plugin.zsh

# NVM Homebrew fix https://github.com/ohmyzsh/ohmyzsh/pull/8316
zplugin snippet 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/065f2f76aa1c967f51cab7f0ce4fc2c576bfcda1/plugins/nvm/nvm.plugin.zsh'

# From http://zdharma.org/zplugin/wiki/GALLERY/
# See also http://zdharma.org/zplugin/wiki/Direnv-explanation/
zplugin ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
    atpull'%atclone' src"zhook.zsh"
zplugin light direnv/direnv

# Docker completions.
zplugin ice as"completion"
zplugin snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker
