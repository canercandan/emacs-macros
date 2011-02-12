(global-set-key [?\C-c ?u ?c ?h] 'user-c-header)

(fset 'user-c-header
      "\C-a\C-k\
#ifndef _\C-y_h
#define _\C-y_h

#endif // !_\C-y_h
")
