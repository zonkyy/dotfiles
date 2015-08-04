# 引数のファイルの文字コードを変換
function euc() {
    for i in $*; do
        if [[ -f $i ]] then
            nkf -e -Lu $i >! /tmp/euc.$$ # -Lu :改行を LF にする
            mv -f /tmp/euc.$$ $i
        fi
    done
}
function utf() {
    for i in $*; do
        if [[ -f $i ]] then
            nkf -w -Lu $i >! /tmp/utf.$$ # -Lu :改行を LF にする
            mv -f /tmp/utf.$$ $i
        fi
    done
}
function sjis() {
    for i in $*; do
        if [[ -f $i ]] then
            nkf -s -Lw $i >! /tmp/sjis.$$ # -Lw :改行を CR+LF にする
            mv -f /tmp/sjis.$$ $i
        fi
    done
}
