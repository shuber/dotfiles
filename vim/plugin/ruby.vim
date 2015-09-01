nmap <leader>a :call RunAllSpecs()<cr>
nmap <leader>c :Dispatch spring rails console<cr>
nmap <leader>el :RExtractLet<cr>
nmap <leader>l :call RunLastSpec()<cr>
nmap <leader>t :call RunCurrentSpecFile()<cr>
nmap <leader>s :call RunNearestSpec()<cr>

let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-","<ion-", "</ion-"]
let g:syntastic_ruby_exec = "~/.rbenv/shims/ruby"
let g:rspec_command = "compiler rspec | set makeprg=spring | Make rspec {spec}"
