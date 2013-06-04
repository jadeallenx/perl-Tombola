#!/usr/sbin/dtrace -qZs

sub-entry
{
    /* Count sub entries by package and sub name
     * arg3 = package name (Foo::Bar) 
     * arg0 = subroutine name (my_method()) */
	@[strjoin(strjoin(copyinstr(arg3),"::"),copyinstr(arg0))] = count()  
}

END 
{
    /* Give me top 10 highest counts; throw away rest */
    trunc(@, 10)
}
