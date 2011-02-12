(global-set-key [?\C-c ?u ?c ?c ?h] 'user-cpp-header)
(global-set-key [?\C-c ?u ?c ?c ?i] 'user-cpp-content)

(fset 'user-cpp-header
      "\C-a\C-k\
#ifndef _\C-y_h
#define _\C-y_h

class\C-[i\C-y
{
public:
\C-y();
~\C-y();
\C-y(const \C-y&);
void\C-[ioperator=(const \C-y&);
};

#endif // !_\C-y_h
")

(fset 'user-cpp-content
      "\C-a\C-k\
#include \"\C-y.h\"

\C-y::\C-y()
{}

\C-y::~\C-y()
{}

\C-y::\C-y(const \C-y& _\C-y\C-[[1;5D\C-[l)
{
\(void)_\C-y\C-[[1;5D\C-[l;
}

void\C-[i\C-y::operator=(const \C-y& _\C-y\C-[[1;5D\C-[l)
{
\(void)_\C-y\C-[[1;5D\C-[l;
}
")