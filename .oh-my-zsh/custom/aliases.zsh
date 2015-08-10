alias df='df -h'

alias -g L='| less'
alias -g P='| percol --match-method migemo'

# Arch Linux
alias pas='packer -S'
alias pass='packer -Ss'
alias pasi='packer -Si'
upgrade() {
    packer -Syu
}
