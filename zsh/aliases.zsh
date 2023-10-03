alias vim="nvim"
alias ezsh="nvim $ZSH_DIR/.zshrc"
alias ealias="nvim $ZSH_DIR/aliases.zsh"
alias evim="nvim ~/.config/nvim/init.vim"
alias etig="nvim ~/.tigrc"
alias fzfvim='nvim $(fzf)'
alias fzfvimhidden='nvim $(find . | fzf)'
alias home="cd ~"

# $1 = project name, $2 = subscription name, #3 = limit (number of messages. Very unreliable though... Might return less than limit despite there being more)
getSubscriptionMessageJson() {
  gcloud pubsub subscriptions pull --project $1 $2 --limit $3 --format="json" |  jq '.[] | .message.data |= @base64d' | jq '.message.data |= fromjson'
}
