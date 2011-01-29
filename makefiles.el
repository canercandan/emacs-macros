;;; makefiles.el --- 
;; 
;; Filename: makefiles.el
;; Description: 
;; Author: Caner Candan
;; Maintainer: 
;; Created: Sun Dec 28 00:02:55 2008 (+0200)
;; Version: 
;; Last-Updated: Sun Dec 28 12:34:47 2008 (+0200)
;;           By: Caner Candan
;;     Update #: 22
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

(global-set-key [?\C-c ?m ?k ?c]	'makemacros-c)
(global-set-key [?\C-c ?m ?k ?+]	'makemacros-cpp)
(global-set-key [?\C-c ?m ?k ?u ?c]	'makemacros-cunit)
(global-set-key [?\C-c ?m ?k ?u ?+]	'makemacros-cppunit)
(global-set-key [?\C-c ?m ?k ?l ?c]	'makemacros-lib-c)
(global-set-key [?\C-c ?m ?k ?l ?+]	'makemacros-lib-cpp)
(global-set-key [?\C-c ?m ?k ?f ?c]	'makemacros-file-c)
(global-set-key [?\C-c ?m ?k ?f ?+]	'makemacros-file-cpp)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Makefile for C-language
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'makemacros-c "\
\C-a\C-k\
PATH_BIN\M-i=\M-i.
PATH_SRC\M-i=\M-i.
PATH_INCLUDE\M-i=\M-i.
PATH_LIBRARY\M-i=\M-i.

NAME\M-i\M-i=\M-i$(PATH_BIN)/\C-y

SRCS\M-i\M-i=\M-i\\
\M-i\M-i\M-i$(PATH_SRC)/main.c

OBJS\M-i\M-i=\M-i$(SRCS:.c=.o)

CC\M-i\M-i=\M-igcc
RM\M-i\M-i=\M-irm -f
MKDIR\M-i\M-i=\M-imkdir -p
ECHO\M-i\M-i=\M-iecho
ECHOE\M-i\M-i=\M-iecho -e
ECHON\M-i\M-i=\M-iecho -n

SUCCESS\M-i\M-i=\M-i$(ECHOE) \"[\\033[32mSUCCESS\\033[0m] \"
FAILED\M-i\M-i=\M-i$(ECHOE) \"[\\033[31mFAILED\\033[0m] \"

INCLUDES\M-i+=\M-i-I$(PATH_INCLUDE)
LIBRARIES\M-i+=\M-i-L$(PATH_LIBRARY)

DEBUG_TRUE\M-i=\M-i-g -DDEBUG
COMPAT\M-i\M-i+=\M-i-D__BSD_VISIBLE
WARNINGS\M-i+=\M-i-W -Wall -Werror

CFLAGS\M-i\M-i+=\M-i$(INCLUDES) $(DEBUG_$(DEBUG)) $(COMPAT) $(WARNINGS)
LDFLAGS\M-i\M-i+=\M-i$(LIBRARIES)

.SUFFIXES\M-i:\M-i.c.o

$(NAME)\M-i\M-i:\M-i$(OBJS)
\M-i\M-i\M-i-@$(ECHON) \"*** Making directory $(PATH_BIN) \"
\M-i\M-i\M-i-@$(MKDIR) $(PATH_BIN) && $(SUCCESS) || $(FAILED)
\M-i\M-i\M-i-@$(ECHON) \"*** Compiling $(OBJS) to $@ \"
\M-i\M-i\M-i-@$(CC) -o $@ $(OBJS) $(LDFLAGS) && $(SUCCESS) || $(FAILED)

all\M-i\M-i:\M-i$(NAME)

clean\M-i\M-i:
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(PATH_SRC)/*~ \"
\M-i\M-i\M-i-@$(RM) $(PATH_SRC)/*~ && $(SUCCESS) || $(FAILED)
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(PATH_SRC)/*.o \"
\M-i\M-i\M-i-@$(RM) $(PATH_SRC)/*.o && $(SUCCESS) || $(FAILED)
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(PATH_BIN)/*.core \"
\M-i\M-i\M-i-@$(RM) $(PATH_BIN)/*.core && $(SUCCESS) || $(FAILED)

fclean\M-i\M-i:\M-iclean
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(NAME) \"
\M-i\M-i\M-i-@$(RM) $(NAME) && $(SUCCESS) || $(FAILED)

re\M-i\M-i:\M-ifclean all

.PHONY\M-i\M-i:\M-iall clean fclean re

.c.o\M-i\M-i:
\M-i\M-i\M-i-@$(ECHON) \"*** Compiling $< to $@ \"
\M-i\M-i\M-i-@$(CC) $(CFLAGS) -c $< -o $@ && $(SUCCESS) || $(FAILED)
")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Makefile for C++
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'makemacros-cpp "\
\C-a\C-k\
PATH_BIN\M-i=\M-i.
PATH_SRC\M-i=\M-i.
PATH_INCLUDE\M-i=\M-i.
PATH_LIBRARY\M-i=\M-i.

NAME\M-i\M-i=\M-i$(PATH_BIN)/\C-y

SRCS\M-i\M-i=\M-i\\
\M-i\M-i\M-i$(PATH_SRC)/main.cpp

OBJS\M-i\M-i=\M-i$(SRCS:.cpp=.o)

CXX\M-i\M-i=\M-ig++
RM\M-i\M-i=\M-irm -f
MKDIR\M-i\M-i=\M-imkdir -p
ECHO\M-i\M-i=\M-iecho
ECHOE\M-i\M-i=\M-iecho -e
ECHON\M-i\M-i=\M-iecho -n

SUCCESS\M-i\M-i=\M-i$(ECHOE) \"[\\033[32mSUCCESS\\033[0m] \"
FAILED\M-i\M-i=\M-i$(ECHOE) \"[\\033[31mFAILED\\033[0m] \"

INCLUDES\M-i+=\M-i-I$(PATH_INCLUDE)
LIBRARIES\M-i+=\M-i-L$(PATH_LIBRARY)

DEBUG_TRUE\M-i=\M-i-g -DDEBUG
COMPAT\M-i\M-i+=\M-i-D__BSD_VISIBLE
WARNINGS\M-i+=\M-i-W -Wall -Werror

CFLAGS\M-i\M-i+=\M-i$(INCLUDES) $(DEBUG_$(DEBUG)) $(COMPAT) $(WARNINGS)
LDFLAGS\M-i\M-i+=\M-i$(LIBRARIES)

.SUFFIXES\M-i:\M-i.cpp.o

$(NAME)\M-i\M-i:\M-i$(OBJS)
\M-i\M-i\M-i-@$(ECHON) \"*** Making directory $(PATH_BIN) \"
\M-i\M-i\M-i-@$(MKDIR) $(PATH_BIN) && $(SUCCESS) || $(FAILED)
\M-i\M-i\M-i-@$(ECHON) \"*** Compiling $(OBJS) to $@ \"
\M-i\M-i\M-i-@$(CXX) -o $@ $(OBJS) $(LDFLAGS) && $(SUCCESS) || $(FAILED)

all\M-i\M-i:\M-i$(NAME)

clean\M-i\M-i:
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(PATH_SRC)/*~ \"
\M-i\M-i\M-i-@$(RM) $(PATH_SRC)/*~ && $(SUCCESS) || $(FAILED)
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(PATH_SRC)/*.o \"
\M-i\M-i\M-i-@$(RM) $(PATH_SRC)/*.o && $(SUCCESS) || $(FAILED)
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(PATH_BIN)/*.core \"
\M-i\M-i\M-i-@$(RM) $(PATH_BIN)/*.core && $(SUCCESS) || $(FAILED)

fclean\M-i\M-i:\M-iclean
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(NAME) \"
\M-i\M-i\M-i-@$(RM) $(NAME) && $(SUCCESS) || $(FAILED)

re\M-i\M-i:\M-ifclean all

.PHONY\M-i\M-i:\M-iall clean fclean re

.cpp.o\M-i\M-i:
\M-i\M-i\M-i-@$(ECHON) \"*** Compiling $< to $@ \"
\M-i\M-i\M-i-@$(CXX) $(CFLAGS) -c $< -o $@ && $(SUCCESS) || $(FAILED)
")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Makefile for CUnit
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'makemacros-cunit "\
\C-a\C-k\
PATH_BIN\M-i=\M-i.
PATH_SRC\M-i=\M-i.
PATH_INCLUDE\M-i=\M-i.
PATH_LIBRARY\M-i=\M-i.

NAME\M-i\M-i=\M-i$(PATH_BIN)/\C-y

SRCS\M-i\M-i=\M-i\\
\M-i\M-i\M-i$(PATH_SRC)/main.c

OBJS\M-i\M-i=\M-i$(SRCS:.c=.o)

CC\M-i\M-i=\M-igcc
RM\M-i\M-i=\M-irm -f
MKDIR\M-i\M-i=\M-imkdir -p
ECHO\M-i\M-i=\M-iecho
ECHOE\M-i\M-i=\M-iecho -e
ECHON\M-i\M-i=\M-iecho -n

SUCCESS\M-i\M-i=\M-i$(ECHOE) \"[\\033[32mSUCCESS\\033[0m] \"
FAILED\M-i\M-i=\M-i$(ECHOE) \"[\\033[31mFAILED\\033[0m] \"

INCLUDES\M-i+=\M-i-I$(PATH_INCLUDE)
INCLUDES\M-i+=\M-i-I/usr/local/include

LIBRARIES\M-i+=\M-i-L$(PATH_LIBRARY)
LIBRARIES\M-i+=\M-i-L/usr/local/lib -lcunit

DEBUG_TRUE\M-i=\M-i-g -DDEBUG
COMPAT\M-i\M-i+=\M-i-D__BSD_VISIBLE
WARNINGS\M-i+=\M-i-W -Wall -Werror

CFLAGS\M-i\M-i+=\M-i$(INCLUDES) $(DEBUG_$(DEBUG)) $(COMPAT) $(WARNINGS)
LDFLAGS\M-i\M-i+=\M-i$(LIBRARIES)

.SUFFIXES\M-i:\M-i.c.o

$(NAME)\M-i\M-i:\M-i$(OBJS)
\M-i\M-i\M-i-@$(ECHON) \"*** Making directory $(PATH_BIN) \"
\M-i\M-i\M-i-@$(MKDIR) $(PATH_BIN) && $(SUCCESS) || $(FAILED)
\M-i\M-i\M-i-@$(ECHON) \"*** Compiling $(OBJS) to $@ \"
\M-i\M-i\M-i-@$(CC) -o $@ $(OBJS) $(LDFLAGS) && $(SUCCESS) || $(FAILED)

all\M-i\M-i:\M-i$(NAME)

clean\M-i\M-i:
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(PATH_SRC)/*~ \"
\M-i\M-i\M-i-@$(RM) $(PATH_SRC)/*~ && $(SUCCESS) || $(FAILED)
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(PATH_SRC)/*.o \"
\M-i\M-i\M-i-@$(RM) $(PATH_SRC)/*.o && $(SUCCESS) || $(FAILED)
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(PATH_BIN)/*.core \"
\M-i\M-i\M-i-@$(RM) $(PATH_BIN)/*.core && $(SUCCESS) || $(FAILED)

fclean\M-i\M-i:\M-iclean
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(NAME) \"
\M-i\M-i\M-i-@$(RM) $(NAME) && $(SUCCESS) || $(FAILED)

re\M-i\M-i:\M-ifclean all

.PHONY\M-i\M-i:\M-iall clean fclean re

.c.o\M-i\M-i:
\M-i\M-i\M-i-@$(ECHON) \"*** Compiling $< to $@ \"
\M-i\M-i\M-i-@$(CC) $(CFLAGS) -c $< -o $@ && $(SUCCESS) || $(FAILED)
")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Makefile for C++Unit
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'makemacros-cppunit "\
\C-a\C-k\
PATH_BIN\M-i=\M-i.
PATH_SRC\M-i=\M-i.
PATH_INCLUDE\M-i=\M-i.
PATH_LIBRARY\M-i=\M-i.

NAME\M-i\M-i=\M-i$(PATH_BIN)/\C-y

SRCS\M-i\M-i=\M-i\\
\M-i\M-i\M-i$(PATH_SRC)/main.cpp

OBJS\M-i\M-i=\M-i$(SRCS:.cpp=.o)

CXX\M-i\M-i=\M-ig++
RM\M-i\M-i=\M-irm -f
MKDIR\M-i\M-i=\M-imkdir -p
ECHO\M-i\M-i=\M-iecho
ECHOE\M-i\M-i=\M-iecho -e
ECHON\M-i\M-i=\M-iecho -n

SUCCESS\M-i\M-i=\M-i$(ECHOE) \"[\\033[32mSUCCESS\\033[0m] \"
FAILED\M-i\M-i=\M-i$(ECHOE) \"[\\033[31mFAILED\\033[0m] \"

INCLUDES\M-i+=\M-i-I$(PATH_INCLUDE)
INCLUDES\M-i+=\M-i`cppunit-config --cflags`

LIBRARIES\M-i+=\M-i-L$(PATH_LIBRARY)
LIBRARIES\M-i+=\M-i`cppunit-config --libs`

DEBUG_TRUE\M-i=\M-i-g -DDEBUG
COMPAT\M-i\M-i+=\M-i-D__BSD_VISIBLE
WARNINGS\M-i+=\M-i-W -Wall -Werror

CFLAGS\M-i\M-i+=\M-i$(INCLUDES) $(DEBUG_$(DEBUG)) $(COMPAT) $(WARNINGS)
LDFLAGS\M-i\M-i+=\M-i$(LIBRARIES)

.SUFFIXES\M-i:\M-i.cpp.o

$(NAME)\M-i\M-i:\M-i$(OBJS)
\M-i\M-i\M-i-@$(ECHON) \"*** Making directory $(PATH_BIN) \"
\M-i\M-i\M-i-@$(MKDIR) $(PATH_BIN) && $(SUCCESS) || $(FAILED)
\M-i\M-i\M-i-@$(ECHON) \"*** Compiling $(OBJS) to $@ \"
\M-i\M-i\M-i-@$(CXX) -o $@ $(OBJS) $(LDFLAGS) && $(SUCCESS) || $(FAILED)

all\M-i\M-i:\M-i$(NAME)

clean\M-i\M-i:
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(PATH_SRC)/*~ \"
\M-i\M-i\M-i-@$(RM) $(PATH_SRC)/*~ && $(SUCCESS) || $(FAILED)
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(PATH_SRC)/*.o \"
\M-i\M-i\M-i-@$(RM) $(PATH_SRC)/*.o && $(SUCCESS) || $(FAILED)
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(PATH_BIN)/*.core \"
\M-i\M-i\M-i-@$(RM) $(PATH_BIN)/*.core && $(SUCCESS) || $(FAILED)

fclean\M-i\M-i:\M-iclean
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(NAME) \"
\M-i\M-i\M-i-@$(RM) $(NAME) && $(SUCCESS) || $(FAILED)

re\M-i\M-i:\M-ifclean all

.PHONY\M-i\M-i:\M-iall clean fclean re

.cpp.o\M-i\M-i:
\M-i\M-i\M-i-@$(ECHON) \"*** Compiling $< to $@ \"
\M-i\M-i\M-i-@$(CXX) $(CFLAGS) -c $< -o $@ && $(SUCCESS) || $(FAILED)
")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Makefile for C Library
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'makemacros-lib-c "\
\C-a\C-k\
PATH_BIN\M-i=\M-i.
PATH_SRC\M-i=\M-i.
PATH_INCLUDE\M-i=\M-i.

NAME\M-i\M-i=\M-i$(PATH_BIN)/lib\C-y.a

SRCS\M-i\M-i=\M-i\\
\M-i\M-i\M-i$(PATH_SRC)/\C-y_init.c

OBJS\M-i\M-i=\M-i$(SRCS:.c=.o)

CC\M-i\M-i=\M-igcc
AR\M-i\M-i=\M-iar r
RL\M-i\M-i=\M-iranlib
RM\M-i\M-i=\M-irm -f
MKDIR\M-i\M-i=\M-imkdir -p
ECHO\M-i\M-i=\M-iecho
ECHOE\M-i\M-i=\M-iecho -e
ECHON\M-i\M-i=\M-iecho -n

SUCCESS\M-i\M-i=\M-i$(ECHOE) \"[\\033[32mSUCCESS\\033[0m] \"
FAILED\M-i\M-i=\M-i$(ECHOE) \"[\\033[31mFAILED\\033[0m] \"

INCLUDES\M-i+=\M-i-I$(PATH_INCLUDE)

DEBUG_TRUE\M-i=\M-i-g -DDEBUG
COMPAT\M-i\M-i+=\M-i-D__BSD_VISIBLE
WARNINGS\M-i+=\M-i-W -Wall -Werror

CFLAGS\M-i\M-i+=\M-i$(INCLUDES) $(DEBUG_$(DEBUG)) $(COMPAT) $(WARNINGS)

.SUFFIXES\M-i:\M-i.c.o

$(NAME)\M-i\M-i:\M-i$(OBJS)
\M-i\M-i\M-i-@$(ECHON) \"*** Making directory $(PATH_BIN) \"
\M-i\M-i\M-i-@$(MKDIR) $(PATH_BIN) && $(SUCCESS) || $(FAILED)
\M-i\M-i\M-i-@$(ECHON) \"*** Creating archive \"
\M-i\M-i\M-i-@$(AR) $(NAME) $(OBJS) && $(SUCCESS) || $(FAILED)
\M-i\M-i\M-i-@$(ECHON) \"*** Generating index to archive \"
\M-i\M-i\M-i-@$(RL) $(NAME) && $(SUCCESS) || $(FAILED)

all\M-i\M-i:\M-i$(NAME)

clean\M-i\M-i:
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(PATH_SRC)/*~ \"
\M-i\M-i\M-i-@$(RM) $(PATH_SRC)/*~ && $(SUCCESS) || $(FAILED)
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(PATH_SRC)/*.o \"
\M-i\M-i\M-i-@$(RM) $(PATH_SRC)/*.o && $(SUCCESS) || $(FAILED)

fclean\M-i\M-i:\M-iclean
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(NAME) \"
\M-i\M-i\M-i-@$(RM) $(NAME) && $(SUCCESS) || $(FAILED)

re\M-i\M-i:\M-ifclean all

.PHONY\M-i\M-i:\M-iall clean fclean re

.c.o\M-i\M-i:
\M-i\M-i\M-i-@$(ECHON) \"*** Compiling $< to $@ \"
\M-i\M-i\M-i-@$(CC) $(CFLAGS) -c $< -o $@ && $(SUCCESS) || $(FAILED)
")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Makefile for C++ Library
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'makemacros-lib-cpp "\
\C-a\C-k\
PATH_BIN\M-i=\M-i.
PATH_SRC\M-i=\M-i.
PATH_INCLUDE\M-i=\M-i.

NAME_LOW\M-i=\M-i\C-y\C-[[1;5D\M-l
NAME\M-i\M-i=\M-i$(PATH_BIN)/lib$(NAME_LOW).a

SRCS\M-i\M-i=\M-i\\
\M-i\M-i\M-i$(PATH_SRC)/\C-y.cpp

OBJS\M-i\M-i=\M-i$(SRCS:.cpp=.o)

CXX\M-i\M-i=\M-ig++
AR\M-i\M-i=\M-iar r
RL\M-i\M-i=\M-iranlib
RM\M-i\M-i=\M-irm -f
MKDIR\M-i\M-i=\M-imkdir -p
ECHO\M-i\M-i=\M-iecho
ECHOE\M-i\M-i=\M-iecho -e
ECHON\M-i\M-i=\M-iecho -n

SUCCESS\M-i\M-i=\M-i$(ECHOE) \"[\\033[32mSUCCESS\\033[0m] \"
FAILED\M-i\M-i=\M-i$(ECHOE) \"[\\033[31mFAILED\\033[0m] \"

INCLUDES\M-i+=\M-i-I$(PATH_INCLUDE)

DEBUG_TRUE\M-i=\M-i-g -DDEBUG
COMPAT\M-i\M-i+=\M-i-D__BSD_VISIBLE
WARNINGS\M-i+=\M-i-W -Wall -Werror

CFLAGS\M-i\M-i+=\M-i$(INCLUDES) $(DEBUG_$(DEBUG)) $(COMPAT) $(WARNINGS)

.SUFFIXES\M-i:\M-i.cpp.o

$(NAME)\M-i\M-i:\M-i$(OBJS)
\M-i\M-i\M-i-@$(ECHON) \"*** Making directory $(PATH_BIN) \"
\M-i\M-i\M-i-@$(MKDIR) $(PATH_BIN) && $(SUCCESS) || $(FAILED)
\M-i\M-i\M-i-@$(ECHON) \"*** Creating archive \"
\M-i\M-i\M-i-@$(AR) $(NAME) $(OBJS) && $(SUCCESS) || $(FAILED)
\M-i\M-i\M-i-@$(ECHON) \"*** Generating index to archive \"
\M-i\M-i\M-i-@$(RL) $(NAME) && $(SUCCESS) || $(FAILED)

all\M-i\M-i:\M-i$(NAME)

clean\M-i\M-i:
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(PATH_SRC)/*~ \"
\M-i\M-i\M-i-@$(RM) $(PATH_SRC)/*~ && $(SUCCESS) || $(FAILED)
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(PATH_SRC)/*.o \"
\M-i\M-i\M-i-@$(RM) $(PATH_SRC)/*.o && $(SUCCESS) || $(FAILED)

fclean\M-i\M-i:\M-iclean
\M-i\M-i\M-i-@$(ECHON) \"*** Removing $(NAME) \"
\M-i\M-i\M-i-@$(RM) $(NAME) && $(SUCCESS) || $(FAILED)

re\M-i\M-i:\M-ifclean all

.PHONY\M-i\M-i:\M-iall clean fclean re

.cpp.o\M-i\M-i:
\M-i\M-i\M-i-@$(ECHON) \"*** Compiling $< to $@ \"
\M-i\M-i\M-i-@$(CXX) $(CFLAGS) -c $< -o $@ && $(SUCCESS) || $(FAILED)
")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Makefile C-Language add a file
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'makemacros-file-c "\
\C-a\C-k\
$(PATH_SRC)/\C-y.o\M-i:\M-i\\
\M-i\M-i\M-i\M-i$(PATH_SRC)/\C-y.c\M-i
\M-i\M-i\M-i\M-i-@$(ECHON) \"*** Recompiling $(PATH_SRC)/\C-y.c to $@ \"
\M-i\M-i\M-i\M-i-@$(CC) $(CFLAGS) -c $(PATH_SRC)/\C-y.c -o $@ && $(SUCCESS) || $(FAILED)
")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Makefile C++ add a file
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'makemacros-file-cpp "\
\C-a\C-k\
$(PATH_SRC)/\C-y.o\M-i:\M-i\\
\M-i\M-i\M-i\M-i$(PATH_SRC)/\C-y.cpp\M-i\\
\M-i\M-i\M-i\M-i$(PATH_SRC)/\C-y.h\M-i
\M-i\M-i\M-i\M-i-@$(ECHON) \"*** Recompiling $(PATH_SRC)/\C-y.cpp to $@ \"
\M-i\M-i\M-i\M-i-@$(CXX) $(CFLAGS) -c $(PATH_SRC)/\C-y.cpp -o $@ && $(SUCCESS) || $(FAILED)
")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; makefiles.el ends here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
