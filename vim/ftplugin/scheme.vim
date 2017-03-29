let b:is_chicken=1
setl include=\^\(\\(use\\\|require-extension\\)\\s\\+
setl includeexpr=substitute(v:fname,'$','.scm','')
setl path+=/usr/local/lib/chicken/3
setl suffixesadd=.scm
setl lispwords+=define-class
setl lispwords+=define-script
