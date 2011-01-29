;;; cplusplus.el --- 
;; 
;; Filename: cplusplus.el
;; Description: 
;; Author: Caner Candan
;; Maintainer: 
;; Created: Sun Dec 28 00:16:13 2008 (+0200)
;; Version: 
;; Last-Updated: Sun Dec 28 00:21:02 2008 (+0200)
;;           By: Caner Candan
;;     Update #: 2
;; URL: 
;; Keywords: 
;; Compatibility: 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary: 
;; 
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change log:
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;; 
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;; 
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set key
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key [?\C-c ?c ?c] 'cplusplus-class)
(global-set-key [?\C-c ?c ?i] 'cplusplus-implementation)
(global-set-key [?\C-c ?a ?i] 'cplusplus-accessor-int)
(global-set-key [?\C-c ?a ?s] 'cplusplus-accessor-string)
(global-set-key [?\C-c ?c ?m] 'cplusplus-main)

(global-set-key [?\C-c ?s ?f] 'cplusplus-singleton-file)
(global-set-key [?\C-c ?s ?c] 'cplusplus-singleton-class)

(global-set-key [?\C-c ?d ?g] 'cplusplus-debug)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C++ Class
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'cplusplus-class "\
\C-a\C-k\
#ifndef __\C-y\C-[[1;5D\M-u_H__
# define __\C-y\C-[[1;5D\M-u_H__

class\M-i\C-y
{
public:
\C-y();
~\C-y();
\C-y(const \C-y&);
\C-y&\M-ioperator=(const \C-y&);
};

#endif // !__\C-y\C-[[1;5D\M-u_H__
")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C++ Implementation
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'cplusplus-implementation "\
\C-a\C-k\
#include \"\C-y.h\"

\C-y::\C-y()
{}

\C-y::~\C-y()
{}

\C-y::\C-y(const \C-y& \C-y\C-[[1;5D\M-l)
{*this = \C-y\C-[[1;5D\M-l;}

\C-y&\M-i\C-y::operator=(const \C-y& \C-y\C-[[1;5D\M-l)
{
if (this != &\C-y\C-[[1;5D\M-l)
{}
return (*this);
}
")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C++ Accessor Integer
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'cplusplus-accessor-int "\
\C-a\C-k\
public:
const int&\M-iget\C-y(void){return (_\C-y\C-[[1;5D\M-l);}
void\M-iset\C-y(const int& \C-y\C-[[1;5D\M-l){_\C-y\C-[[1;5D\M-l = \C-y\C-[[1;5D\M-l;}
private:
int\M-i_\C-y\C-[[1;5D\M-l;")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C++ Accessor String
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'cplusplus-accessor-string "\
\C-a\C-k\
public:
const std::string&\M-iget\C-y(void){return (_\C-y\C-[[1;5D\M-l);}
void\M-iset\C-y(const std::string& \C-y\C-[[1;5D\M-l){_\C-y\C-[[1;5D\M-l = \C-y\C-[[1;5D\M-l;}
private:
std::string\M-i_\C-y\C-[[1;5D\M-l;")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C++ Main
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'cplusplus-main "\
int\M-imain(void)
{
return (0);
}
")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C++ Singleton File
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'cplusplus-singleton-file "\
#ifndef __SINGLETON_H__
# define __SINGLETON_H__

# include <cstdlib>

template <typename T>
class\M-iSingleton
{
protected:
Singleton(){}
~Singleton(){}
public:
static T*\M-igetInstance()
{
if (!_singleton)
_singleton = new T;
return (static_cast<T*>(_singleton));
}

static void\M-ikill()
{
if (_singleton)
{
delete _singleton;
_singleton = NULL;
}
}

static bool\M-iexist()
{return (_singleton != NULL);}
private:
static T*\M-i_singleton;
};

template <typename T>
T*\M-iSingleton<T>::_singleton = NULL;

#endif // !__SINGLETON_H__
")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C++ Singleton Class
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'cplusplus-singleton-class "\
\C-a\C-k\
#ifndef __\C-y\C-[[1;5D\M-u_H__
# define __\C-y\C-[[1;5D\M-u_H__

# include \"Singleton.hpp\"

class\M-i\C-y : public Singleton<\C-y>
{
friend class\M-iSingleton<\C-y>;
public:

private:
\C-y();
~\C-y();
};

#endif // !__\C-y\C-[[1;5D\M-u_H__
")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C++ Debug
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'cplusplus-debug "\
\C-a\C-k\
std::cout << \"debug: [\" << \C-y << ']' << std::endl;\
")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; cplusplus.el ends here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
