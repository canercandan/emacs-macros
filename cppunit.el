;;; cppunit.el --- 
;; 
;; Filename: cppunit.el
;; Description: 
;; Author: Caner Candan
;; Maintainer: 
;; Created: Sun Dec 28 00:32:07 2008 (+0200)
;; Version: 
;; Last-Updated: Sun Dec 28 00:32:22 2008 (+0200)
;;           By: Caner Candan
;;     Update #: 1
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

(global-set-key [?\C-c ?u ?c] 'cppunit-class)
(global-set-key [?\C-c ?u ?i] 'cppunit-implementation)
(global-set-key [?\C-c ?u ?m] 'cppunit-main)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C++ Unit Class
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'cppunit-class "\
\C-a\C-k\
#ifndef __\C-y\C-[[1;5D\M-u_H__
# define __\C-y\C-[[1;5D\M-u_H__

# include <cppunit/extensions/HelperMacros.h>
# include <cppunit/TestFixture.h>

class\M-i\C-y : public CppUnit::TestFixture
{
CPPUNIT_TEST_SUITE(\C-y);
CPPUNIT_TEST(testTest);
CPPUNIT_TEST_SUITE_END();
public:
void\M-isetUp();
void\M-itearDown();

void\M-itestTest();
};

#endif // !__\C-y\C-[[1;5D\M-u_H__
")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C++ Unit Implementation
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'cppunit-implementation "\
\C-a\C-k\
#include <cppunit/TestAssert.h>
#include \"\C-y.h\"

void\M-i\C-y::setUp()
{}

void\M-i\C-y::tearDown()
{}

void\M-i\C-y::testTest()
{
CPPUNIT_ASSERT(false);
}
")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C++ Unit Main
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'cppunit-main "\
\C-a\C-k\
#include <cppunit/ui/text/TestRunner.h>
#include \"\C-y.h\"

int\M-imain(void)
{
CppUnit::TextUi::TestRunner\M-irunner;

runner.addTest(\C-y::suite());

runner.run();
return (0);
}
")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; cppunit.el ends here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
