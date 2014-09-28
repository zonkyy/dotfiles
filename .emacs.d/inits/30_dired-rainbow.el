;;;; dired をファイルの拡張子に合わせて色分けする

(use-package dired-rainbow
  :ensure dired-rainbow)
;;; 日本語の dired 仕様に変更
(setq dired-rainbow-date-regexp "\\(?:[0-9][0-9]:[0-9][0-9]\\|.[0-9]\\{4\\}\\)")


;;;;;;;;;;;;;;
;;; 色設定
;;;;;;;;;;;;;;

(defconst dired-rainbow-omit1-extensions
  '("elc" "class" "so" "ko" "la" "o" "al" "ix" "db" "td" "dat" "dll" "Dll" "DLL" "sav" "rdp" "sys" "SYS" "prf" "tlb" "cat" "bak")
  "extensions to match unimportanted file types")

(defconst dired-rainbow-omit2-extensions
  '("git" "svn" "~.*" "#.*" "%.*" "tmp" "$DATA" ":encryptable" "db_encryptable")
  "extensions to match backup or cache filetypes.")

(defconst dired-rainbow-omit3-extensions
  "\\..*$"
  "extensions to match hidden files")

(dired-rainbow-define omit1 "Chartreuse" dired-rainbow-omit1-extensions)
(dired-rainbow-define omit2 "Chartreuse" dired-rainbow-omit2-extensions)
(dired-rainbow-define omit3 "Chartreuse" dired-rainbow-omit3-extensions)

(defconst dired-rainbow-document-extensions
  '("pdf" "chm" "CHM" "tex" "doc" "docx" "xls" "xlsx" "ppt" "pptx" "odt" "ott" "rtf" "sdw" "ods" "sxc" "odp" "otp" "sdx" "kdh" "shx")
  "extensions to match rich document filetypes")

(dired-rainbow-define document "DarkCyan" dired-rainbow-document-extensions)

(defconst dired-rainbow-plain-extensions
  '("TXT" "txt" "Txt" "ini" "INI" "lrc" "org" "log" "conf" "CFG" "cfg" "properties" "config" "diff" "patch" "ebuild" "inf" "cnf" "example" "sample" "default" "m4")
  "extensions to match plain text filetype")

(dired-rainbow-define plain "MediumPurple" dired-rainbow-plain-extensions)

(defconst dired-rainbow-common-extensions
  '("configure" "INSTALL" "README" "readme" "COPYING" "CHANGES" "LICENSE" "ChangeLog" "Makefile.in" "MANIFEST.MF" "NOTICE.txt" "build.xml" "Manifest" "metadata.xml" "install-sh" "NEWS" "HACKING" "AUTHORS" "todo" "Todo" "TODO" "makefile" "TAGS" "tag")
  "extensions to match common files")

(dired-rainbow-define common "Peru" dired-rainbow-common-extensions)

(defconst dired-rainbow-xml-extensions
  '("htm" "html" "HTM" "HTML" "xml" "XML" "xsl" "xsd" "rng" "dtd" "mht" "jsp" "asp" "js" "xaml")
  "extensions to match xml filetype")

(dired-rainbow-define xml "Chocolate" dired-rainbow-xml-extensions)

(defconst dired-rainbow-compress-extensions
  '("tar" "zip" "ZIP" "rar" "RAR" "tgz" "gz" "bzip2" "bz2" "7z" "7Z" "Z" "z" "xz" "XZ" "rpm" "deb" "lzma" "cab" "gzip" "taz" "wim" "iso" "tbz2" "xar" "XAR" "jar" "war" "img")
  "extensions to match compressed filetypes")

(dired-rainbow-define compress "Orchid" dired-rainbow-compress-extensions)

(defconst dired-rainbow-source-extensions
  '("c" "cpp" "java" "JAVA" "C" "php" "h" "rb" "pl" "css" "el" "lua" "sql" "ahk" "cs" "erl" "hrl")
  "extensions to match source code filetypes")

(dired-rainbow-define source "SpringGreen" dired-rainbow-source-extensions)

(defconst dired-rainbow-execute-extensions
  '("exe" "EXE" "bat" "BAT" "msi" "MSI" "sh" "run" "reg" "REG" "com" "COM" "vbx" "VBX" "bin" "xpi" "bundle")
  "extensions to match executable filetypes")

(dired-rainbow-define execute "green" dired-rainbow-execute-extensions)

(defconst dired-rainbow-music-extensions
  '("mp3" "MP3" "wma" "WMA" "wav" "WAV" "mid" "MID")
  "extensions to match music files")

(dired-rainbow-define music "SteelBlue" dired-rainbow-music-extensions)

(defconst dired-rainbow-video-extensions
  '("flv" "avi" "AVI" "mkv" "rmvb" "RMVB" "mpeg" "mpg" "MPG" "rm" "RM" "mp4" "wmv" "WMV" "m4v" "mov" "ogg" "ogv" "3gp" "f4v" "swf")
  "extensions to match video filetypes")

(dired-rainbow-define video "SandyBrown" dired-rainbow-video-extensions)

(defconst dired-rainbow-image-extensions
  '("gif" "GIF" "jpg" "JPG" "bmp" "BMP" "jpeg" "JPEG" "png" "PNG" "xpm" "svg")
  "extensions to match images filetypes")

(dired-rainbow-define image "MediumPurple" dired-rainbow-image-extensions)

(defconst dired-rainbow-lnk-extensions
  '("lnk" "LNK" "desktop" "torrent" "url" "URL")
  "extensions to match lnk filetypes")

(dired-rainbow-define lnk "yellow" dired-rainbow-lnk-extensions)
