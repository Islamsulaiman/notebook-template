" ─────────────── CLIPBOARD SYNCHRONIZATION ───────────────
" Syncs Obsidian's yank/delete registers with your system clipboard
set clipboard=unnamed

" ─────────────── LINK NAVIGATION (gd) ───────────────
" Maps 'gd' (Go to Definition) to open the internal link under your cursor
exmap followLink obcommand editor:follow-link
nmap gd :followLink<CR>


" ─────────────── FILE HISTORY NAVIGATION (<C-o> & <C-i>) ───────────────
" 1. Clear CodeMirror's hardcoded internal file cursor jump defaults
nunmap <C-o>

" 2. Register the application back/forward layout operations
exmap goBack obcommand app:go-back

" 3. Bind the keys globally to step across note paths
nmap <C-o> :goBack<CR>
