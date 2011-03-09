(global-set-key [?\C-c ?u ?c ?c ?h] 'user-cpp-header)
(global-set-key [?\C-c ?u ?c ?c ?i] 'user-cpp-content)
(global-set-key [?\C-c ?u ?c ?c ?j] 'user-cpp-header-content)

(fset 'user-cpp-header
      "\C-a\C-k\
#ifndef _\C-y_h
#define _\C-y_h

class \C-y
{
public:
\C-y();
~\C-y();
\C-y(const \C-y&);
void operator=(const \C-y&);
};

#endif // !_\C-y_h
")

(fset 'user-cpp-content
      "\C-a\C-k\
#include \"\C-y.h\"

\C-y::\C-y() {}
\C-y::~\C-y() {}
\C-y::\C-y(const \C-y& _\C-y) { *this = _\C-y; }

void \C-y::operator=(const \C-y& _\C-y)
{
if (this != &_\C-y)
{
}
return *this;
}
")

(fset 'user-cpp-header-content
      "\C-a\C-k\
class \C-y
{
public:
\C-y() {}
~\C-y() {}
\C-y(const \C-y& _\C-y) { *this = _\C-y; }

void operator=(const \C-y& _\C-y)
{
if (this != &_\C-y)
{
}
return *this;
}
};
")
