call plug#begin()
  " Theme
  Plug('mhartington/oceanic-next')
call plug#end()

"------- Config --------"
" Enable theme colors
if (has("termguicolors"))
 set termguicolors
endif

" Set theme and enable syntax
syntax enable
colorscheme OceanicNext
