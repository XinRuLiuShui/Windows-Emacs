(setq custom-file (expand-file-name "~/.emacs.custom.el"))
(load custom-file 'noerror)

(setq package-archives '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(setq make-backup-files nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(electric-pair-mode 1)


(set-face-attribute 'default nil :font "JetBrains Mono-10")

;; 中文字体
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font t charset
                      (font-spec :family "Microsoft YaHei" :height 1.4)))

(add-to-list 'load-path (expand-file-name "themes" user-emacs-directory))
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))
(load-theme 'gruvbox-dark-soft t)


(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)


(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)))


;; avy配置
(use-package avy
  :ensure t
  :defer t  ; 延迟加载，提升启动速度
  :bind (("C-:" . avy-goto-char)
         ("M-g w" . avy-goto-word-1)
         ("M-g f" . avy-goto-line))
)

(use-package consult
  :ensure t
  :bind (("C-x b" . consult-buffer)
	 ("C-c r" . consult-ripgrep)
         )
  )





;; 把 lisp 目录加入 load-path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; 加载自定义检索
(require 'my-search)

;; 加载日志高亮
(require 'log-highlight)

(require 'my-files)
