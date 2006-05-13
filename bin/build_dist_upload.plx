#!/usr/bin/perl -w
##

use strict;

use warnings;

require FindBin;

chdir( $FindBin::Bin ); chdir( $FindBin::Bin ); ## dummy

if ( -f '../.lock' )
{
   print "$0 reporting .lock exists\n";

   exit;

} ## end if

require Date::Format;

require Shell;

chdir( $FindBin::Bin ); ## auto-locate

my $sh = Shell->new();

my $pwd = $sh->pwd(); chop( $pwd );

die( "error: \$FindBin::Bin ne \$sh->pwd()" ) if ( $FindBin::Bin ne $pwd );

##debug## print $FindBin::Bin . "\n";
##debug## print $pwd . "\n";

my $TIME = time;

my $YYYY = Date::Format::time2str( '%Y', $TIME );

my $MMDD = Date::Format::time2str( '%m%d', $TIME );

my $YYYY_MMDD = "${YYYY}_${MMDD}";

##
## Check if I can upload
##
my $mmdd = $sh->tail( "-n 1 ${YYYY}_MMDD" ) if ( -f "${YYYY}_MMDD" );

$mmdd = $sh->tail( '-n 1 ' . last_year( $YYYY ) . '_MMDD' ) if ( ! defined( $mmdd ) && -f last_year( $YYYY ) . '_MMDD' );

$mmdd = 0000 if ( ! defined( $mmdd ) );

$mmdd =~ s/\n$//;

##debug##die( "wait until tommorrow\n" ) if ( ( -f "${YYYY}_MMDD" ) && ( $mmdd == $MMDD ) );

exit if ( ( -f "${YYYY}_MMDD" ) && ( $mmdd == $MMDD ) );

##
## Here we go
##

my @output = ();

@output = $sh->perl( "create_bundle_modules.plx 2>&1" );

print @output;

chdir( '..' );

if ( ! -f 'SIGNATURE' )
{
   @output = $sh->cpansign( '-s 2>&1' );

   print @output;

} ## end if

@output = $sh->perl( 'Build.PL 2>&1' );

print @output;

@output = $sh->perl( 'Build manifest 2>&1' );

print @output;

@output = $sh->perl( 'Build realclean 2>&1' );

print @output;

@output = $sh->perl( 'Build.PL 2>&1' );

print @output;

@output = $sh->perl( 'Build test 2>&1' );

print @output;

@output = $sh->perl( 'Build dist 2>&1' );

print @output;

@output = $sh->chown( '-R 500:500 ' . $sh->pwd() . '2>&1' );

print @output;

@output = $sh->echo( "cpan-upload Bundle-Modules-${YYYY}.${MMDD} 2>&1" );

print @output;

##@output = $sh->find();
#
##print @output;

END {

} ## end END

sub last_year
{
   my $yyyy = shift;

   return( $yyyy - 1 );

} ## end

__END__
