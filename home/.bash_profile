alias pedit='vi ~/.bash_profile; . ~/.bash_profile'
alias q='exit'
alias ip='ifconfig|grep inet'
alias l='ls -l'
alias ll='ls -al'
alias f='free -h'
alias kill9='kill -s 9'
alias upg='sudo apt-get update && sudo apt-get autoremove -y && sudo apt-get upgrade -y'
alias du='du -d 1 -BM'
alias suspend='sudo systemctl suspend'
alias cui='sudo systemctl isolate multi-user.target'
alias gui='sudo systemctl isolate graphical.target'

# docker
alias dps='docker ps --format "{{.Names}}\t\t{{.Status}}\t\t{{.Ports}}"'

# bitto.jp
alias redis='docker exec -it manga-checker_devcontainer_redis_1 redis-cli'
alias lifflog='docker logs -f --tail 20 manga-checker_devcontainer_liff_1'
alias faslog='docker logs -f --tail 20 manga-checker_devcontainer_fastify_1'
alias batlog='docker logs -f --tail 20 manga-checker_devcontainer_batch_1'
alias nglog='docker logs -f --tail 20 manga-checker_devcontainer_nginx_1'
alias batch='docker exec -it manga-checker_devcontainer_batch_1 /bin/bash'
alias psql='docker exec -it manga-checker_devcontainer_postgres_1 /usr/bin/psql'


# git
alias st='git status'
alias commit='git commit -m'
alias glog="git log --no-merges --date=local --pretty='format:%C(yellow)%h %C(green)%cd %C(yellow)%an%C(red)%d %C(reset)%s' $1"
alias glatest="glog -20"
alias tagfind='git tag --list|grep $1'
tagrm() {
  git tag -d $1 && git push origin :$1
}
alias gpl='git pull -p'
alias gps='git push'
alias gpf='git push -f'
alias amend='git commit --amend --no-edit'
alias dbranch='git branch -D'
alias co='git checkout'
alias cob='git checkout -b'
alias branch='git branch'
alias br='git branch'
alias newpush='git push --set-upstream origin `git branch --contains | cut -d " " -f 2`'
fix_wsl2_interop() {
    for i in $(pstree -np -s $$ | grep -o -E '[0-9]+'); do
        if [[ -e "/run/WSL/${i}_interop" ]]; then
            export WSL_INTEROP=/run/WSL/${i}_interop
        fi
    done
}

# git-prompt.shの存在確認とインストール
if [ ! -e ~/.git-prompt.sh ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
  chmod +x ~/.git-prompt.sh
fi

# git-completionの存在確認とインストール
if [ ! -e ~/.git-completion.bash ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
  chmod +x ~/.git-completion.bash
fi

. ~/.git-prompt.sh
. ~/.git-completion.bash

# プロンプトに各種情報を表示するためのフラグ
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1

############### ターミナルのコマンド受付状態の表示変更
# \u : ユーザ名
# \h : ホスト名
# \W : カレントディレクトリ
# \w : カレントディレクトリのパス
# \n : 改行
# \d : 日付
# \[ 〜 \] : 文字列の色を指定
# \$ : $
export PS1='\[\033[1;32m\]\u\[\033[00m\]:\W\[\033[1;31m\]$(__git_ps1)\[\033[00m\] \$ '
##############


