#!/usr/sbin/dtrace -qFZs

sub-entry,
sub-return
{
    /* arg0 is subroutine name */
	trace(copyinstr(arg0))
}
