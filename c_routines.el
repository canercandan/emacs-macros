(global-set-key [?\C-c ?u ?c ?a ?m] 'user-c-args-main)
(global-set-key [?\C-c ?u ?c ?m] 'user-c-main)

(fset 'user-c-args-main
      "\
int main(int ac, char** av)
{


return 0;
}
")

(fset 'user-c-main
      "\
int main(void)
{


return 0;
}
")
