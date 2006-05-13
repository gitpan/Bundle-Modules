#!/usr/bin/perl -w
##

use strict;

use warnings;

require FindBin;

require Date::Format;

require IO::File;

chdir( $FindBin::Bin ); chdir( $FindBin::Bin ); ## dummy

unshift( @ARGV, time() ) unless ( $ARGV[0] =~ m/^\d+$/ );

our $VERSION =  Date::Format::time2str( '%Y.%m%d', $ARGV[0] );

my $SEEDATE = Date::Format::time2str( '%Y.%m%d', 1147298572 ); ## 2006.0510

my $EMADDR = 'Eric R. Meyers <ermeyers@adelphia.net>'; $EMADDR =~ s/[<]([^>]+)[>]/E<lt>$1E<gt>/;

my $AUTHOR = $EMADDR;

my $DESCRB = 'This Bundle package will install all of the modules listed, if they\'re not commented out of the B<L<Bundle::Modules>> context.';

my $CPANID = 'http://www.cpan.org/modules/by-authors/id/E/ER/ERMEYERS/Bundle-Modules-' . $VERSION;

my $LICENS = 'http://www.perl.com/perl/misc/Artistic.html';

my $LTERMS = 'This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.';

my $CRIGHT = 'Copyright 2006 by ' . $EMADDR;

my $BNDLROOT = '../lib';

my $CPANROOT = $ENV{'HOME'} . '/.cpan';

my $CPANPLUSROOT = $ENV{'HOME'} . '/.cpanplus';

##  ------
##  Bundle::Modules
##  ------

my %Bundle__Modules = ();

##rename( $BNDLROOT . '/Modules.pm', $BNDLROOT . '/Modules.pm.bak' );

my $Bundle__Modules = IO::File->new( $BNDLROOT . '/Modules.pm', '+>' ) ||
                      die "opening Bundle::Modules:$!\n";

##  ------
##  Bundle::Modules::Unstable
##  ------

my %Bundle__Modules__Unstable = ();

my $Bundle__Modules__Unstable = IO::File->new( $BNDLROOT . '/Modules/Unstable.pm', '+<' ) ||
                                die "opening Bundle::Modules::Unstable:$!\n";

##  ------
##  Bundle::Modules::CPAN
##  ------

my %Bundle__Modules__CPAN = ();

my $Bundle__Modules__CPAN = IO::File->new( $BNDLROOT . '/Modules/CPAN.pm', '+>' ) ||
                            die "opening Bundle::Modules::CPAN:$!\n";

##  ------
##  Bundle::Modules::CPAN::Unstable
##  ------

my %Bundle__Modules__CPAN__Unstable = ();

my $Bundle__Modules__CPAN__Unstable = IO::File->new( $BNDLROOT . '/Modules/CPAN/Unstable.pm', '+<' ) ||
                                      die "opening Bundle::Modules::CPAN::Unstable:$!\n";

##  ------
##  Bundle::Modules::Acme::Everything
##  ------

my %Bundle__Modules__Acme__Everything = ();

my $Bundle__Modules__Acme__Everything = IO::File->new( $BNDLROOT . '/Modules/Acme/Everything.pm', '<' ) ||
                                        die "opening Bundle::Modules::Acme::Everything:$!\n";

##  ------
##  Bundle::Modules::Acme::Everything::Unstable
##  ------

my %Bundle__Modules__Acme__Everything__Unstable = ();

##  ------
##  Bundle::Modules::Acme::Everything::Unique
##  ------

my %Bundle__Modules__Acme__Everything__Unique = ();

##  ------
##  Bundle::Modules::Acme::Everything::Unique::Unstable
##  ------

my %Bundle__Modules__Acme__Everything__Unique__Unstable = ();

## ------
## Packages__Details
## ------
my %Packages__Details = ();

my $Packages__Details = undef;

if ( -f $CPANROOT . '/sources/modules/02packages.details.txt' )
{
   $Packages__Details = IO::File->new( $CPANROOT . '/sources/modules/02packages.details.txt', '<' ) ||
                        die "opening Packages__Details:$!\n";

}
elsif ( -f $CPANPLUSROOT . '/sources/modules/02packages.details.txt' )
{
   $Packages__Details = IO::File->new( $CPANPLUSROOT . '/sources/modules/02packages.details.txt', '<' ) ||
                        die "opening Packages__Details:$!\n";

}
else
{
   die "opening Packages__Details:$!\n";

} ## end if

## ------
## beginning
## ------

my $Contents = undef;

my %count =
(
   'Bundle::Modules' => 0,
   'Bundle::Modules::Unstable' => 0,
   'Bundle::Modules::CPAN' => 0,
   'Bundle::Modules::CPAN::Unstable' => 0,
   'Packages__Details' => 0,
   'Bundle::Modules::Acme::Everything' => 0,
   'Bundle::Modules::Acme::Everything::Unstable' => 0,
   'Bundle::Modules::Acme::Everything::Unique' => 0,
   'Bundle::Modules::Acme::Everything::Unique::Unstable' => 0,
);

$count{'math'} = ( $count{'Bundle::Modules::CPAN'} + $count{'Bundle::Modules::CPAN::Unstable'} )
               - ( $count{'Packages__Details'} + ( $count{'Bundle::Modules::Acme::Everything::Unique'} + $count{'Bundle::Modules::Acme::Everything::Unique::Unstable'} ) )
               - ( $count{'Bundle::Modules'} + $count{'Bundle::Modules::Unstable'} );

## ------
## Bundle::Modules::Unstable
## ------

$Contents = 0;

while ( my $Perln = <$Bundle__Modules__Unstable> )
{
   chop( $Perln );

   next if ( $Perln =~ m/^\s*$/ );

   next if ( $Perln =~ m/^[#]/ ); ## just loading previously known unstables

   if ( $Perln =~ m/^=head1\s+CONTENTS/ )
   {
      $Contents = 1;

   }
   elsif ( $Perln =~ m/^=head1\s+CHANGES/ )
   {
      last;

   }
   elsif ( $Contents )
   {
      ##debug## print "$Perln\n";

      $Bundle__Modules__Unstable{$Perln} = 'Bundle::Modules::Unstable';

      $count{'Bundle::Modules::Unstable'}++;

   } ## end if

} ## end while

$Bundle__Modules__Unstable->close();

## ------
## I<unstable> in Bundle::Modules from Bundle::Modules::Unstable
## ------

foreach my $Perln ( keys %Bundle__Modules__Unstable )
{
   $Bundle__Modules{'##'.$Perln} = $Bundle__Modules__Unstable{$Perln};

} ## end foreach

## ------
## Bundle::Modules::CPAN::Unstable
## ------

$Contents = 0;

while ( my $Perln = <$Bundle__Modules__CPAN__Unstable> )
{
   chop( $Perln );

   next if ( $Perln =~ m/^\s*$/ );

   next if ( $Perln =~ m/^[#]/ ); ## just loading previously known unstables

   if ( $Perln =~ m/^=head1\s+CONTENTS/ )
   {
      $Contents = 1;

   }
   elsif ( $Perln =~ m/^=head1\s+CHANGES/ )
   {
      last;

   }
   elsif ( $Contents )
   {
      ##debug## print "$Perln\n";

      $Bundle__Modules__CPAN__Unstable{$Perln} = 'Bundle::Modules::CPAN::Unstable';

      $count{'Bundle::Modules::CPAN::Unstable'}++;

   } ## end if

} ## end while

$Bundle__Modules__CPAN__Unstable->close();

## ------
## I<unstable> in Bundle::Modules::CPAN from Bundle::Modules::CPAN::Unstable
## ------

foreach my $Perln ( keys %Bundle__Modules__CPAN__Unstable )
{
   $Bundle__Modules__CPAN{'##'.$Perln} = $Bundle__Modules__CPAN__Unstable{$Perln};

} ## end foreach

## ------
## Bundle::Modules::Acme::Everything
## ------

$Contents = 0;

while ( my $Perln = <$Bundle__Modules__Acme__Everything> )
{
   chop( $Perln );

   next if ( $Perln =~ m/^\s*$/ );

   if ( $Perln =~ m/^=head1\s+CONTENTS/ )
   {
      $Contents = 1;

   }
   elsif ( $Perln =~ m/^=head1\s+CHANGES/ )
   {
      last;

   }
   elsif ( $Contents )
   {
      ##debug## print "$Perln\n";

      if ( $Perln =~ m/^[#]/ )
      {
         $Perln =~ m/(\w+(::\w+(::\w+(::\w+(::\w+(::\w+(::\w+(::\w+(::\w+)*)*)*)*)*)*)*)*)/; ## I assume it's unstable from the comment

         $Perln = $1;

         if ( ! defined( $Bundle__Modules__CPAN__Unstable{$Perln} ) )
         {
            $count{'Bundle::Modules::CPAN::Unstable'}++;

            $Bundle__Modules__CPAN__Unstable{$Perln} = 'Bundle::Modules::Acme::Everything';

         } ## end if

      }
      else
      {
         $Bundle__Modules__Acme__Everything{$Perln} = 1;

         $count{'Bundle::Modules::Acme::Everything'}++;

      } ## end if

   } ## end if

} ## end while

$Bundle__Modules__Acme__Everything->close();

## ------
## Packages__Details
## ------

$Contents = 0;

while ( my $Perln = <$Packages__Details> )
{
   chop( $Perln );

   if ( $Contents )
   {
      ##debug## print "$Perln\n";

      next if ( $Perln =~ m/^\s*$/ );

      next if ( $Perln =~ m/^[#]/ );

      $Perln =~ m/^([^\s]+)/;

      $Perln = $1;

      ##debug## print "$Perln\n";

      $Packages__Details{$Perln} = 1;

      $count{'Packages__Details'}++;

   } ## end if

   $Contents = 1  if ( $Perln =~ m/^\s*$/ );

} ## end while

$Packages__Details->close();

## ------
## modules from source Bundle::Everything
## ------
foreach my $Perln ( keys %Bundle__Modules__Acme__Everything )
{
   if ( ! ( $Perln =~ m/^[#]/ ) ||
        ( ! defined( $Bundle__Modules__Unstable{$Perln} ) &&
          ! defined( $Bundle__Modules__CPAN__Unstable{$Perln} )
        )
      )
   {
      ##
      ## Bundle::Modules:Acme::Everything
      ##

      ## no change here to Bundle::Modules::Acme::Everything

      ##
      ## Bundle::Modules:Acme::Everything::Unstable
      ##

      $Bundle__Modules__Acme__Everything__Unstable{'##'.$Perln} = 1; ## commented out

      ##
      ## Packages__Details
      ##

      next if ( defined( $Packages__Details{$Perln} ) );

      ##
      ## Bundle::Modules:Acme::Everything::Unique
      ##

      $count{'Bundle::Modules::Acme::Everything::Unique'}++;

      $Bundle__Modules__Acme__Everything__Unique{$Perln} = 1;

      $Bundle__Modules__Acme__Everything__Unique__Unstable{'##'.$Perln} = 1; ## commented out

   }
   else
   {
      ##
      ## Bundle::Modules:Acme::Everything
      ##

      $count{'Bundle::Modules::Acme::Everything'}--;

      ## no change here to Bundle::Modules::Acme::Everything

      ##
      ## Bundle::Modules:Acme::Everything::Unstable
      ##

      $count{'Bundle::Modules::Acme::Everything::Unstable'}++;

      $Bundle__Modules__Acme__Everything__Unstable{$Perln} = 1;

      ##
      ## Packages__Details
      ##

      next if ( defined( $Packages__Details{$Perln} ) );

      ##
      ## Bundle::Modules:Acme::Everything::Unique::Unstable
      ##

      $count{'Bundle::Modules::Acme::Everything::Unique::Unstable'}++;

      $Bundle__Modules__Acme__Everything__Unique{'##'.$Perln} = 1; ## commented out

      $Bundle__Modules__Acme__Everything__Unique__Unstable{$Perln} = 1;

   } ## end if

} ## end foreach

##  ------
##  Bundle::Modules::Acme::Everything
##  ------

$Bundle__Modules__Acme__Everything = IO::File->new( $BNDLROOT . '/Modules/Acme/Everything.pm', '+>' ) ||
                                     die "opening Bundle::Modules::Acme::Everything:$!\n";

$Bundle__Modules__Acme__Everything->print( Bundle_head( 'Bundle::Modules::Acme::Everything',
                                                        'All current I<stable> modules in Bundle::Modules::Acme::Everything',
                                                      )
                                         );

foreach my $Perln ( keys %Bundle__Modules__Acme__Everything )
{
   $Bundle__Modules__Acme__Everything->print( $Perln ."\n" );

} ## end foreach

$Bundle__Modules__Acme__Everything->print( Bundle_foot( 'Bundle::Modules::Acme::Everything' ) );

$Bundle__Modules__Acme__Everything->close();

##  ------
##  Bundle::Modules::Acme::Everything::Unstable
##  ------

my $Bundle__Modules__Acme__Everything__Unstable = IO::File->new( $BNDLROOT . '/Modules/Acme/Everything/Unstable.pm', '+>' ) ||
                                                  die "opening Bundle::Modules::Acme::Everything::Unstable:$!\n";

$Bundle__Modules__Acme__Everything__Unstable->print( Bundle_head( 'Bundle::Modules::Acme::Everything::Unstable',
                                                                  'All current I<unstable> modules from Bundle::Modules::Acme::Everything',
                                                                )
                                                   );

foreach my $Perln ( keys %Bundle__Modules__Acme__Everything__Unstable )
{
   $Bundle__Modules__Acme__Everything__Unstable->print( $Perln ."\n" );

} ## end foreach

$Bundle__Modules__Acme__Everything__Unstable->print( Bundle_foot( 'Bundle::Modules::Acme::Everything::Unstable' ) );

$Bundle__Modules__Acme__Everything__Unstable->close();

##  ------
##  Bundle::Modules::Acme::Everything::Unique
##  ------

my $Bundle__Modules__Acme__Everything__Unique = IO::File->new( $BNDLROOT . '/Modules/Acme/Everything/Unique.pm', '+>' ) ||
                                                die "opening Bundle::Modules::Acme::Everything::Unique:$!\n";

$Bundle__Modules__Acme__Everything__Unique->print( Bundle_head( 'Bundle::Modules::Acme::Everything::Unique',
                                                                'All current I<stable> and I<unique> modules in Bundle::Modules::Acme::Everything',
                                                              )
                                                 );

foreach my $Perln ( keys %Bundle__Modules__Acme__Everything__Unique )
{
   $Bundle__Modules__Acme__Everything__Unique->print( $Perln ."\n" );

} ## end foreach

$Bundle__Modules__Acme__Everything__Unique->print( Bundle_foot( 'Bundle::Modules::Acme::Everything::Unique' ) );

$Bundle__Modules__Acme__Everything__Unique->close();

##  ------
##  Bundle::Modules::Acme::Everything::Unique::Unstable
##  ------

my $Bundle__Modules__Acme__Everything__Unique__Unstable = IO::File->new( $BNDLROOT . '/Modules/Acme/Everything/Unique/Unstable.pm', '+>' ) ||
                                                          die "opening Bundle::Modules::Acme::Everything::Unique::Unstable:$!\n";

$Bundle__Modules__Acme__Everything__Unique__Unstable->print( Bundle_head( 'Bundle::Modules::Acme::Everything::Unique::Unstable',
                                                                          'All current I<unstable> and I<unique> modules in Bundle::Modules::Acme::Everything',
                                                                        )
                                                           );

foreach my $Perln ( keys %Bundle__Modules__Acme__Everything__Unique__Unstable )
{
   $Bundle__Modules__Acme__Everything__Unique__Unstable->print( $Perln ."\n" );

} ## end foreach

$Bundle__Modules__Acme__Everything__Unique__Unstable->print( Bundle_foot( 'Bundle::Modules::Acme::Everything::Unique::Unstable' ) );

$Bundle__Modules__Acme__Everything__Unique__Unstable->close();

## ------
## modules from best sources
## ------

foreach my $Perln ( keys %Packages__Details,
                    keys %Bundle__Modules__Acme__Everything__Unique,
                  )
{
   if ( $Perln =~ m/^Bundle::/ ) ## is a bundle but NOTE: there are other bundles to be had!
   {
      ##
      ## Bundle::Modules
      ##

      next if ( defined( $Bundle__Modules__Unstable{$Perln} ) ); ## stop tainting

      next if ( $Perln =~ m/^Bundle::Modules(|::(CPAN|Perl)(|::Unstable))/ ); ## stop recursion

      $Bundle__Modules{$Perln} = 1;

      $count{'Bundle::Modules'}++;

   }
   else
   {
      ##
      ## Bundle::Modules::CPAN
      ##

      next if ( defined( $Bundle__Modules__CPAN__Unstable{$Perln} ) ); ## stop tainting

      if ( ! defined( $Bundle__Modules__CPAN{$Perln} ) )
      {
         $Bundle__Modules__CPAN{$Perln} = 1;

         $count{'Bundle::Modules::CPAN'}++;

      } ## end if

   } ## end if

} ## end foreach

## ------
## Bundle::Modules
## ------

$Bundle__Modules->print( Bundle_head( 'Bundle::Modules', 'All current I<stable> bundles of modules in CPAN' ) );

foreach my $Perln ( keys %Bundle__Modules )
{
   $Bundle__Modules->print( $Perln . "\n" );

} ## end foreach

$Bundle__Modules->print( Bundle_foot( 'Bundle::Modules' ) );

$Bundle__Modules->close();

## ------
## Bundle::Modules::CPAN
## ------

$Bundle__Modules__CPAN->print( Bundle_head( 'Bundle::Modules::CPAN', 'All current I<stable> modules in CPAN' ) );

foreach my $Perln ( keys %Bundle__Modules__CPAN )
{
   $Bundle__Modules__CPAN->print( $Perln . "\n" );

} ## end foreach

$Bundle__Modules__CPAN->print( Bundle_foot( 'Bundle::Modules::CPAN' ) );

$Bundle__Modules__CPAN->close();

## ------
## I<stable> in Bundle::Modules::Unstable from Bundle::Modules
## ------

foreach my $Perln ( keys %Bundle__Modules )
{
   next if ( $Perln =~ m/^[#]/ ); ## don't want unstable

   $Bundle__Modules__Unstable{'##'.$Perln} = 'Bundle::Modules';

} ## end foreach

## ------
## Bundle::Modules::Unstable
## ------

$Bundle__Modules__Unstable = IO::File->new( $BNDLROOT . '/Modules/Unstable.pm', '+>' ) ||
                             die "opening Bundle::Modules::Unstable:$!\n";

$Bundle__Modules__Unstable->print( Bundle_head( 'Bundle::Modules::Unstable',
                                                'All current I<unstable> bundles of modules in CPAN',
                                              )
                                 );

foreach my $Perln ( keys %Bundle__Modules__Unstable )
{
   $Bundle__Modules__Unstable->print( $Perln . "\n" );

} ## end foreach

$Bundle__Modules__Unstable->print( Bundle_foot( 'Bundle::Modules::Unstable' ) );

$Bundle__Modules__Unstable->close();

## ------
## I<stable> in Bundle::Modules::CPAN::Unstable from Bundle::Modules::CPAN
## ------

foreach my $Perln ( keys %Bundle__Modules__CPAN )
{
   next if ( $Perln =~ m/^[#]/ );

   $Bundle__Modules__CPAN__Unstable{'##'.$Perln} = 'Bundle::Modules::CPAN';

} ## end foreach

## ------
## Bundle::Modules::CPAN::Unstable
## ------

$Bundle__Modules__CPAN__Unstable = IO::File->new( $BNDLROOT . '/Modules/CPAN/Unstable.pm', '+>' ) ||
                                   die "opening Bundle::Modules::CPAN::Unstable:$!\n";

$Bundle__Modules__CPAN__Unstable->print( Bundle_head( 'Bundle::Modules::CPAN::Unstable',
                                                      'All current I<unstable> modules in CPAN',
                                                    )
                                       );

foreach my $Perln ( keys %Bundle__Modules__CPAN__Unstable )
{
   $Bundle__Modules__CPAN__Unstable->print( $Perln . "\n" );

} ## end foreach

$Bundle__Modules__CPAN__Unstable->print( Bundle_foot( 'Bundle::Modules::CPAN::Unstable' ) );

$Bundle__Modules__CPAN__Unstable->close();

## ------
## present the math
## ------

printf( "count{'%-21s'}=%6d\tcount{'%-41s'}=%6d\n",
        'Bundle::Modules::CPAN', $count{'Bundle::Modules::CPAN'},
        'Bundle::Modules::CPAN::Unstable', $count{'Bundle::Modules::CPAN::Unstable'},
      );

printf( "count{'%-21s'}=%6d\tcount{'%-41s'}=%6d\tcount{'%s'}=%6d\n",
        'Packages__Details', $count{'Packages__Details'},
        'Bundle::Modules::Acme::Everything::Unique', $count{'Bundle::Modules::Acme::Everything::Unique'},
        'Bundle::Modules::Acme::Everything::Unique::Unstable', $count{'Bundle::Modules::Acme::Everything::Unique::Unstable'},
      );

printf( "count{'%-21s'}=%6d\tcount{'%-41s'}=%6d\n",
        'Bundle::Modules', $count{'Bundle::Modules'},
        'Bundle::Modules::Unstable', $count{'Bundle::Modules::Unstable'},
      );

$count{'math'} = ( $count{'Bundle::Modules::CPAN'} + $count{'Bundle::Modules::CPAN::Unstable'} )
               - ( $count{'Packages__Details'} + ( $count{'Bundle::Modules::Acme::Everything::Unique'} + $count{'Bundle::Modules::Acme::Everything::Unique::Unstable'} ) )
               + ( $count{'Bundle::Modules'} + $count{'Bundle::Modules::Unstable'} );

printf( "( %d + %d ) - ( %d + ( %d + %d ) ) + ( %d + %d ) = %d\n",
        $count{'Bundle::Modules::CPAN'}, $count{'Bundle::Modules::CPAN::Unstable'},
        $count{'Packages__Details'}, $count{'Bundle::Modules::Acme::Everything::Unique'}, $count{'Bundle::Modules::Acme::Everything::Unique::Unstable'},
        $count{'Bundle::Modules'}, $count{'Bundle::Modules::Unstable'},
        $count{'math'},
      );

END {
}; ## end END

## ------
## Bundle_head
## ------
sub Bundle_head
{ my ( $b, $d ) = @_; return (
'package '. $b . ';' ."\n".
'' ."\n".
'use 5.005;' ."\n".
'' ."\n".
'our $VERSION = ' . $VERSION . '; ## (YYYY.MMDD)' ."\n".
'' ."\n".
'1;' ."\n".
'' ."\n".
'__END__' ."\n".
'' ."\n".
'=head1 NAME' ."\n".
'' ."\n".
'=over' ."\n".
'' ."\n".
$b . ' - ' . $d ."\n".
'' ."\n".
'=back' ."\n".
'' ."\n".
'=head1 SYNOPSIS' ."\n".
'' ."\n".
'=over' ."\n".
'' ."\n".
'=item C<% B<perl -MCPAN -e \'install '. $b . '\'>>' ."\n".
'' ."\n".
'=item C<% B<cpan -i ' . $b . '>>' ."\n".
'' ."\n".
'=back' ."\n".
'' ."\n".
'=head1 CONTENTS' ."\n".
"\n"
); } ## end sub Bundle_head

## ------
## Bundle_foot
## ------
sub Bundle_foot
{
   my $b = shift;

my %SEEALSO =
(
   'Bundle::Modules' =>
   [
     #'Bundle::Modules',
      'Bundle::Modules::Unstable',
      'Bundle::Modules::CPAN',
      'Bundle::Modules::CPAN::Unstable',
      'Bundle::Modules::Acme::Everything',
      'Bundle::Modules::Acme::Everything::Unstable',
      'Bundle::Modules::Acme::Everything::Unique',
      'Bundle::Modules::Acme::Everything::Unique::Unstable',

   ],

   'Bundle::Modules::Unstable' =>
   [
      'Bundle::Modules',
     #'Bundle::Modules::Unstable',
      'Bundle::Modules::CPAN',
      'Bundle::Modules::CPAN::Unstable',
      'Bundle::Modules::Acme::Everything',
      'Bundle::Modules::Acme::Everything::Unstable',
      'Bundle::Modules::Acme::Everything::Unique',
      'Bundle::Modules::Acme::Everything::Unique::Unstable',

   ],

   'Bundle::Modules::CPAN' =>
   [
      'Bundle::Modules',
      'Bundle::Modules::Unstable',
     #'Bundle::Modules::CPAN',
      'Bundle::Modules::CPAN::Unstable',
      'Bundle::Modules::Acme::Everything',
      'Bundle::Modules::Acme::Everything::Unstable',
      'Bundle::Modules::Acme::Everything::Unique',
      'Bundle::Modules::Acme::Everything::Unique::Unstable',

   ],

   'Bundle::Modules::CPAN::Unstable' =>
   [
      'Bundle::Modules',
      'Bundle::Modules::Unstable',
      'Bundle::Modules::CPAN',
     #'Bundle::Modules::CPAN::Unstable',
      'Bundle::Modules::Acme::Everything',
      'Bundle::Modules::Acme::Everything::Unstable',
      'Bundle::Modules::Acme::Everything::Unique',
      'Bundle::Modules::Acme::Everything::Unique::Unstable',

   ],

   'Bundle::Modules::Acme::Everything' =>
   [
      'Bundle::Modules',
      'Bundle::Modules::Unstable',
      'Bundle::Modules::CPAN',
      'Bundle::Modules::CPAN::Unstable',
     #'Bundle::Modules::Acme::Everything',
      'Bundle::Modules::Acme::Everything::Unstable',
      'Bundle::Modules::Acme::Everything::Unique',
      'Bundle::Modules::Acme::Everything::Unique::Unstable',

   ],

   'Bundle::Modules::Acme::Everything::Unstable' =>
   [
      'Bundle::Modules',
      'Bundle::Modules::Unstable',
      'Bundle::Modules::CPAN',
      'Bundle::Modules::CPAN::Unstable',
      'Bundle::Modules::Acme::Everything',
     #'Bundle::Modules::Acme::Everything::Unstable',
      'Bundle::Modules::Acme::Everything::Unique',
      'Bundle::Modules::Acme::Everything::Unique::Unstable',

   ],

   'Bundle::Modules::Acme::Everything::Unique' =>
   [
      'Bundle::Modules',
      'Bundle::Modules::Unstable',
      'Bundle::Modules::CPAN',
      'Bundle::Modules::CPAN::Unstable',
      'Bundle::Modules::Acme::Everything',
      'Bundle::Modules::Acme::Everything::Unstable',
     #'Bundle::Modules::Acme::Everything::Unique',
      'Bundle::Modules::Acme::Everything::Unique::Unstable',

   ],

   'Bundle::Modules::Acme::Everything::Unique::Unstable' =>
   [
      'Bundle::Modules',
      'Bundle::Modules::Unstable',
      'Bundle::Modules::CPAN',
      'Bundle::Modules::CPAN::Unstable',
      'Bundle::Modules::Acme::Everything',
      'Bundle::Modules::Acme::Everything::Unstable',
      'Bundle::Modules::Acme::Everything::Unique',
     #'Bundle::Modules::Acme::Everything::Unique::Unstable',

   ],

);

#foreach my $x ( keys %SEEALSO )
#{
#   printf( "x=%s\n", $x );
=cut
   foreach my $y ( @{$SEEALSO{$b}} )
   {
     printf( "y=%s\n", $y );

   } ## end foreach
=cut
#} ## end foreach

   return (
'' ."\n".
'=head1 CHANGES' ."\n".
'' ."\n".
'=over' ."\n".
'' ."\n".
'=item '. $SEEDATE . ' (YYYY.MMDD)' ."\n".
'' ."\n".
'Initial version of: '. $b . '-' . $SEEDATE . "\n".
'' ."\n".
'This B<L<Bundle::Modules>> component package is in pre-alpha state with hash ordering.' ."\n".
'' ."\n".
'The ordering of listed modules will eventually be prioritized for efficiency and completeness.' ."\n".
'' ."\n".
'Modules commented out of this module list are either I<unstable> or I<stable> in the B<L<Bundle::Modules>> context.' ."\n".
'' ."\n".
'Optimistically, if there are a lot of the modules commented out, then they are I<stable>, and we\'re listing I<unstable> context.' ."\n".
'' ."\n".
'Optimistically, if there are a few of the modules commented out, then they are I<unstable>, and we\'re listing I<stable> context.' ."\n".
'' ."\n".
'If you use the command C<B<man '. $b . '>>, type C<B</#>> to see the commented out modules as they\'re higlighted for you by B<L<man>>.' ."\n".
'' ."\n".
'=back' ."\n".
'' ."\n".
'=head1 DESCRIPTION' ."\n".
'' ."\n".
'=over' ."\n".
'' ."\n".
'=item ' . $DESCRB ."\n".
'' ."\n".
'=back' ."\n".
'' ."\n".
'=head1 SEE ALSO' ."\n".
'' ."\n".
'=over' ."\n".
'' ."\n".
'=item I<L<' . join( ">>, I<L<", @{$SEEALSO{'Bundle::Modules'}} ) . '>>' ."\n".
'' ."\n".
'=back' ."\n".
'' ."\n".
'=head1 AUTHORS' ."\n".
'' ."\n".
'=over' ."\n".
'' ."\n".
'=item ' . $AUTHOR ."\n".
'' ."\n".
'=back' ."\n".
'' ."\n".
'=head1 LICENSE for ' . $CPANID ."\n".
'' ."\n".
'=over' ."\n".
'' ."\n".
'=item ' . $LICENS ."\n".
'' ."\n".
'=item ' . $LTERMS ."\n".
'' ."\n".
'=back' ."\n".
'' ."\n".
'=head1 COPYRIGHT' ."\n".
'' ."\n".
'=over' ."\n".
'' ."\n".
'=item ' . $CRIGHT ."\n".
'' ."\n".
'=back' ."\n".
'' ."\n".
"\n"
   ); } ## end sub Bundle_foot

__END__
##  ------
##  Bundle::Modules::Acme::Everything::Unique ## to eliminate redundancy
##  ------
my %Bundle__Modules__Acme__Everything__Unique = ();

my $Bundle__Modules__Acme__Everything__Unique = IO::File->new( $BNDLROOT . '/Modules/Acme/Everything/Unique.pm', '+>' ) ||
                                                die "opening Bundle::Modules::Acme::Everything::Unique:$!\n";

##  ------
##  Bundle::Modules::Acme::Everything::Unique::Unstable ## also to eliminate redundancy
##  ------
my %Bundle__Modules__Acme__Everything__Unique__Unstable = ();

my $Bundle__Modules__Acme__Everything__Unique__Unstable = IO::File->new( $BNDLROOT . '/Modules/Acme/Everthing/Unique/Unstable.pm', '+>' ) ||
                                                          die "opening Bundle::Modules::Acme::Everything::Unique::Unstable:$!\n";

## ------
## Packages__Details
## ------
my %Packages__Details = ();

my $Packages__Details = undef;

if ( -f $CPANROOT . '/sources/modules/02packages.details.txt' )
{
   $Packages__Details = IO::File->new( $CPANROOT . '/sources/modules/02packages.details.txt', '<' ) ||
                        die "opening Packages__Details:$!\n";

}
elsif ( -f $CPANPLUSROOT . '/sources/modules/02packages.details.txt' )
{
   $Packages__Details = IO::File->new( $CPANPLUSROOT . '/sources/modules/02packages.details.txt', '<' ) ||
                        die "opening Packages__Details:$!\n";

}
else
{
   die "opening Packages__Details:$!\n";

} ## end if

## ------
## beginning
## ------

my $Contents = undef;

my %count =
(
   'Bundle::Modules' => 0,
   'Bundle::Modules::Unstable' => 0,
   'Bundle::Modules::CPAN' => 0,
   'Bundle::Modules::CPAN::Unstable' => 0,
   'Packages__Details' => 0,
   'Bundle::Modules::Acme::Everything' => 0,
   'Bundle::Modules::Acme::Everything::Unstable' => 0,
   'Bundle::Modules::Acme::Everything::Unique' => 0,
   'Bundle::Modules::Acme::Everything::Unique::Unstable' => 0,
);

$count{'math'} = ( $count{'Bundle::Modules::CPAN'} + $count{'Bundle::Modules::CPAN::Unstable'} )
               - ( $count{'Packages__Details'} + ( $count{'Bundle::Modules::Acme::Everything::Unique'} + $count{'Bundle::Modules::Acme::Everything::Unique::Unstable'} ) )
               - ( $count{'Bundle::Modules'} + $count{'Bundle::Modules::Unstable'} );

## ------
## Bundle::Modules::Unstable
## ------

$Contents = 0;

while ( my $Perln = <$Bundle__Modules__Unstable> )
{
   chop( $Perln );

   next if ( $Perln =~ m/^\s*$/ );

   next if ( $Perln =~ m/^[#]/ ); ## just loading previously known unstables

   if ( $Perln =~ m/^=head1\s+CONTENTS/ )
   {
      $Contents = 1;

   }
   elsif ( $Perln =~ m/^=head1\s+CHANGES/ )
   {
      last;

   }
   elsif ( $Contents )
   {
      ##debug## print "$Perln\n";

      $Bundle__Modules__Unstable{$Perln} = 'Bundle::Modules::Unstable';

      $count{'Bundle::Modules::Unstable'}++;

   } ## end if

} ## end while

$Bundle__Modules__Unstable->close();

## ------
## I<unstable> in Bundle::Modules from Bundle::Modules::Unstable
## ------

foreach my $Perln ( keys %Bundle__Modules__Unstable )
{
   $Bundle__Modules{'##'.$Perln} = $Bundle__Modules__Unstable{$Perln};

} ## end foreach

## ------
## Bundle::Modules::CPAN::Unstable
## ------

$Contents = 0;

while ( my $Perln = <$Bundle__Modules__CPAN__Unstable> )
{
   chop( $Perln );

   next if ( $Perln =~ m/^\s*$/ );

   next if ( $Perln =~ m/^[#]/ ); ## just loading previously known unstables

   if ( $Perln =~ m/^=head1\s+CONTENTS/ )
   {
      $Contents = 1;

   }
   elsif ( $Perln =~ m/^=head1\s+CHANGES/ )
   {
      last;

   }
   elsif ( $Contents )
   {
      ##debug## print "$Perln\n";

      $Bundle__Modules__CPAN__Unstable{$Perln} = 'Bundle::Modules::CPAN::Unstable';

      $count{'Bundle::Modules::CPAN::Unstable'}++;

   } ## end if

} ## end while

$Bundle__Modules__CPAN__Unstable->close();

## ------
## I<unstable> in Bundle::Modules::CPAN from Bundle::Modules::CPAN::Unstable
## ------

foreach my $Perln ( keys %Bundle__Modules__CPAN__Unstable )
{
   $Bundle__Modules__CPAN{'##'.$Perln} = $Bundle__Modules__CPAN__Unstable{$Perln};

} ## end foreach

## ------
## Bundle::Modules::Acme::Everything
## ------

$Contents = 0;

while ( my $Perln = <$Bundle__Modules__Acme__Everything> )
{
   chop( $Perln );

   next if ( $Perln =~ m/^\s*$/ );

   if ( $Perln =~ m/^=head1\s+CONTENTS/ )
   {
      $Contents = 1;

   }
   elsif ( $Perln =~ m/^=head1\s+CHANGES/ )
   {
      last;

   }
   elsif ( $Contents )
   {
      ##debug## print "$Perln\n";

      if ( $Perln =~ m/^[#]/ )
      {
         $Perln =~ m/(\w+(::\w+(::\w+(::\w+(::\w+(::\w+(::\w+(::\w+(::\w+)*)*)*)*)*)*)*)*)/; ## I assume it's unstable from the comment

         $Perln = $1;

         if ( ! defined( $Bundle__Modules__CPAN__Unstable{$Perln} ) )
         {
            $count{'Bundle::Modules::CPAN::Unstable'}++;

            $Bundle__Modules__CPAN__Unstable{$Perln} = 'Bundle::Modules::Acme::Everything';

         } ## end if

      }
      else
      {
         $Bundle__Modules__Acme__Everything{$Perln} = 1;

         $count{'Bundle::Modules::Acme::Everything'}++;

      } ## end if

   } ## end if

} ## end while

$Bundle__Modules__Acme__Everything->close();

## ------
## Packages__Details
## ------

$Contents = 0;

while ( my $Perln = <$Packages__Details> )
{
   chop( $Perln );

   if ( $Contents )
   {
      ##debug## print "$Perln\n";

      next if ( $Perln =~ m/^\s*$/ );

      next if ( $Perln =~ m/^[#]/ );

      $Perln =~ m/^([^\s]+)/;

      $Perln = $1;

      ##debug## print "$Perln\n";

      $Packages__Details{$Perln} = 1;

      $count{'Packages__Details'}++;

   } ## end if

   $Contents = 1  if ( $Perln =~ m/^\s*$/ );

} ## end while

$Packages__Details->close();

## ------
## modules from source Bundle::Everything
## ------
foreach my $Perln ( keys %Bundle__Modules__Acme__Everything )
{
   if ( ! ( $Perln =~ m/^[#]/ ) ||
        ( ! defined( $Bundle__Modules__Unstable{$Perln} ) &&
          ! defined( $Bundle__Modules__CPAN__Unstable{$Perln} )
        )
      )
   {
      ##
      ## Bundle::Modules:Acme::Everything
      ##

      ## no change here to Bundle::Modules::Acme::Everything

      ##
      ## Bundle::Modules:Acme::Everything::Unstable
      ##

      $Bundle__Modules__Acme__Everything__Unstable{'##'.$Perln} = 1; ## commented out

      ##
      ## Packages__Details
      ##

      next if ( defined( $Packages__Details{$Perln} ) );

      ##
      ## Bundle::Modules:Acme::Everything::Unique
      ##

      $count{'Bundle::Modules::Acme::Everything::Unique'}++;

      $Bundle__Modules__Acme__Everything__Unique{$Perln} = 1;

      $Bundle__Modules__Acme__Everything__Unique__Unstable{'##'.$Perln} = 1; ## commented out

   }
   else
   {
      ##
      ## Bundle::Modules:Acme::Everything
      ##

      $count{'Bundle::Modules::Acme::Everything'}--;

      ## no change here to Bundle::Modules::Acme::Everything

      ##
      ## Bundle::Modules:Acme::Everything::Unstable
      ##

      $count{'Bundle::Modules::Acme::Everything::Unstable'}++;

      $Bundle__Modules__Acme__Everything__Unstable{$Perln} = 1;

      ##
      ## Packages__Details
      ##

      next if ( defined( $Packages__Details{$Perln} ) );

      ##
      ## Bundle::Modules:Acme::Everything::Unique::Unstable
      ##

      $count{'Bundle::Modules::Acme::Everything::Unique::Unstable'}++;

      $Bundle__Modules__Acme__Everything__Unique{'##'.$Perln} = 1; ## commented out

      $Bundle__Modules__Acme__Everything__Unique__Unstable{$Perln} = 1;

   } ## end if

} ## end foreach

## ------
## Bundle::Modules::Acme::Everything
## ------

$Bundle__Modules__Acme__Everything->print( Bundle_head( 'Bundle::Modules::Acme::Everything',
                                                        'All current I<stable> modules in Bundle::Modules::Acme::Everything',
                                                      )
                                         );

foreach my $Perln ( keys %Bundle__Modules__Acme__Everything )
{
   $Bundle__Modules__Acme__Everything->print( $Perln ."\n" );

} ## end foreach

$Bundle__Modules__Acme__Everything->print( Bundle_foot( 'Bundle::Modules::Acme::Everything' ) );

$Bundle__Modules__Acme__Everything->close();

## ------
## Bundle::Modules::Acme::Everything::Unstable
## ------

$Bundle__Modules__Acme__Everything__Unstable->print( Bundle_head( 'Bundle::Modules::Acme::Everything::Unstable',
                                                                  'All current I<unstable> modules from Bundle::Modules::Acme::Everything',
                                                                )
                                                   );

foreach my $Perln ( keys %Bundle__Modules__Acme__Everything__Unique__Unstable )
{
   $Bundle__Modules__Acme__Everything__Unique__Unstable->print( $Perln ."\n" );

} ## end foreach

$Bundle__Modules__Acme__Everything__Unique__Unstable->print( Bundle_foot( 'Bundle::Modules::Acme::Everything::Unique::Unstable' ) );

$Bundle__Modules__Acme__Everything__Unique__Unstable->close();

## ------
## Bundle::Modules::Acme::Everything::Unique
## ------

$Bundle__Modules__Acme__Everything__Unique->print( Bundle_head( 'Bundle::Modules::Acme::Everything::Unique',
                                                                'All current I<stable> and I<unique> modules in Bundle::Modules::Acme::Everything',
                                                              )
                                                 );

foreach my $Perln ( keys %Bundle__Modules__Acme__Everything__Unique )
{
   $Bundle__Modules__Acme__Everything__Unique->print( $Perln ."\n" );

} ## end foreach

$Bundle__Modules__Acme__Everything__Unique->print( Bundle_foot( 'Bundle::Modules::Acme::Everything::Unique' ) );

$Bundle__Modules__Acme__Everything__Unique->close();

## ------
## Bundle::Modules::Acme::Everything::Unique::Unstable
## ------

$Bundle__Modules__Acme__Everything__Unique__Unstable->print( Bundle_head( 'Bundle::Modules::Acme::Everything::Unique::Unstable',
                                                                          'All current I<unstable> and I<unique> modules in Bundle::Modules::Acme::Everything',
                                                                        )
                                                           );

foreach my $Perln ( keys %Bundle__Modules__Acme__Everything__Unique__Unstable )
{
   $Bundle__Modules__Acme__Everything__Unique__Unstable->print( $Perln ."\n" );

} ## end foreach

$Bundle__Modules__Acme__Everything__Unique__Unstable->print( Bundle_foot( 'Bundle::Modules::Acme::Everything::Unique::Unstable' ) );

$Bundle__Modules__Acme__Everything__Unique__Unstable->close();

## ------
## modules from best sources
## ------

foreach my $Perln ( keys %Packages__Details,
                    keys %Bundle__Modules__Acme__Everything__Unique,
                  )
{
   if ( $Perln =~ m/^Bundle::/ ) ## is a bundle but NOTE: there are other bundles to be had!
   {
      ##
      ## Bundle::Modules
      ##

      next if ( defined( $Bundle__Modules__Unstable{$Perln} ) ); ## stop tainting

      next if ( $Perln =~ m/^Bundle::Modules(|::(CPAN|Perl)(|::Unstable))/ ); ## stop recursion

      $Bundle__Modules{$Perln} = 1;

      $count{'Bundle::Modules'}++;

   }
   else
   {
      ##
      ## Bundle::Modules::CPAN
      ##

      next if ( defined( $Bundle__Modules__CPAN__Unstable{$Perln} ) ); ## stop tainting

      if ( ! defined( $Bundle__Modules__CPAN{$Perln} ) )
      {
         $Bundle__Modules__CPAN{$Perln} = 1;

         $count{'Bundle::Modules::CPAN'}++;

      } ## end if

   } ## end if

} ## end foreach

## ------
## Bundle::Modules
## ------

$Bundle__Modules->print( Bundle_head( 'Bundle::Modules', 'All current I<stable> bundles of modules in CPAN' ) );

foreach my $Perln ( keys %Bundle__Modules )
{
   $Bundle__Modules->print( $Perln . "\n" );

} ## end foreach

$Bundle__Modules->print( Bundle_foot( 'Bundle::Modules' ) );

$Bundle__Modules->close();

## ------
## Bundle::Modules::CPAN
## ------

$Bundle__Modules__CPAN->print( Bundle_head( 'Bundle::Modules::CPAN', 'All current I<stable> modules in CPAN' ) );

foreach my $Perln ( keys %Bundle__Modules__CPAN )
{
   $Bundle__Modules__CPAN->print( $Perln . "\n" );

} ## end foreach

$Bundle__Modules__CPAN->print( Bundle_foot( 'Bundle::Modules::CPAN' ) );

$Bundle__Modules__CPAN->close();

## ------
## I<stable> in Bundle::Modules::Unstable from Bundle::Modules
## ------

foreach my $Perln ( keys %Bundle__Modules )
{
   next if ( $Perln =~ m/^[#]/ ); ## don't want unstable

   $Bundle__Modules__Unstable{'##'.$Perln} = 'Bundle::Modules';

} ## end foreach

## ------
## Bundle::Modules::Unstable
## ------

$Bundle__Modules__Unstable = IO::File->new( $BNDLROOT . '/Modules/Unstable.pm', '+>' ) ||
                             die "opening Bundle::Modules::Unstable:$!\n";

$Bundle__Modules__Unstable->print( Bundle_head( 'Bundle::Modules::Unstable',
                                                'All current I<unstable> bundles of modules in CPAN',
                                              )
                                 );

foreach my $Perln ( keys %Bundle__Modules__Unstable )
{
   $Bundle__Modules__Unstable->print( $Perln . "\n" );

} ## end foreach

$Bundle__Modules__Unstable->print( Bundle_foot( 'Bundle::Modules::Unstable' ) );

$Bundle__Modules__Unstable->close();

## ------
## I<stable> in Bundle::Modules::CPAN::Unstable from Bundle::Modules::CPAN
## ------

foreach my $Perln ( keys %Bundle__Modules__CPAN )
{
   next if ( $Perln =~ m/^[#]/ );

   $Bundle__Modules__CPAN__Unstable{'##'.$Perln} = 'Bundle::Modules::CPAN';

} ## end foreach

## ------
## Bundle::Modules::CPAN::Unstable
## ------

$Bundle__Modules__CPAN__Unstable = IO::File->new( $BNDLROOT . '/Modules/CPAN/Unstable.pm', '+>' ) ||
                                   die "opening Bundle::Modules::CPAN::Unstable:$!\n";

$Bundle__Modules__CPAN__Unstable->print( Bundle_head( 'Bundle::Modules::CPAN::Unstable',
                                                      'All current I<unstable> modules in CPAN',
                                                    )
                                       );

foreach my $Perln ( keys %Bundle__Modules__CPAN__Unstable )
{
   $Bundle__Modules__CPAN__Unstable->print( $Perln . "\n" );

} ## end foreach

$Bundle__Modules__CPAN__Unstable->print( Bundle_foot( 'Bundle::Modules::CPAN::Unstable' ) );

$Bundle__Modules__CPAN__Unstable->close();

## ------
## present the math
## ------

printf( "count{'%-21s'}=%6d\tcount{'%-31s'}=%6d\n",
        'Bundle::Modules::CPAN', $count{'Bundle::Modules::CPAN'},
        'Bundle::Modules::CPAN::Unstable', $count{'Bundle::Modules::CPAN::Unstable'},
      );

printf( "count{'%-21s'}=%6d\tcount{'%-31s'}=%6d\tcount{'%s'}=%6d\n",
        'Packages__Details', $count{'Packages__Details'},
        'Bundle::Modules::Acme::Everything::Unique', $count{'Bundle::Modules::Acme::Everything::Unique'},
        'Bundle::Modules::Acme::Everything::Unique::Unstable', $count{'Bundle::Modules::Acme::Everything::Unique::Unstable'},
      );

printf( "count{'%-21s'}=%6d\tcount{'%-31s'}=%6d\n",
        'Bundle::Modules', $count{'Bundle::Modules'},
        'Bundle::Modules::Unstable', $count{'Bundle::Modules::Unstable'},
      );

$count{'math'} = ( $count{'Bundle::Modules::CPAN'} + $count{'Bundle::Modules::CPAN::Unstable'} )
               - ( $count{'Packages__Details'} + ( $count{'Bundle::Modules::Acme::Everything::Unique'} + $count{'Bundle::Modules::Acme::Everything::Unique::Unstable'} ) )
               + ( $count{'Bundle::Modules'} + $count{'Bundle::Modules::Unstable'} );

printf( "( %d + %d ) - ( %d + ( %d + %d ) ) + ( %d + %d ) = %d\n",
        $count{'Bundle::Modules::CPAN'}, $count{'Bundle::Modules::CPAN::Unstable'},
        $count{'Packages__Details'}, $count{'Bundle::Modules::Acme::Everything::Unique'}, $count{'Bundle::Modules::Acme::Everything::Unique::Unstable'},
        $count{'Bundle::Modules'}, $count{'Bundle::Modules::Unstable'},
        $count{'math'},
      );

END {
}; ## end END

## ------
## Bundle_head
## ------
sub Bundle_head
{ my ( $b, $d ) = @_; return (
'package '. $b . ';' ."\n".
'' ."\n".
'$VERSION = ' . $VERSION . '; ## (YYYY.MMDD)' ."\n".
'' ."\n".
'1;' ."\n".
'' ."\n".
'__END__' ."\n".
'' ."\n".
'=head1 NAME' ."\n".
'' ."\n".
'=over' ."\n".
'' ."\n".
'=item ' . $b ."\n".
'' ."\n".
$d ."\n".
'' ."\n".
'=back' ."\n".
'' ."\n".
'=head1 SYNOPSIS' ."\n".
'' ."\n".
'=over' ."\n".
'' ."\n".
'=item C<% B<perl -MCPAN -e \'install '. $b . '\'>>' ."\n".
'' ."\n".
'=item C<% B<cpan -i ' . $b . '>>' ."\n".
'' ."\n".
'=back' ."\n".
'' ."\n".
'=head1 CONTENTS' ."\n".
"\n"
); } ## end sub Bundle_head

## ------
## Bundle_foot
## ------
sub Bundle_foot
{
   my $b = shift;

my %SEEALSO =
(
   'Bundle::Modules' =>
   [
     #'Bundle::Modules',
      'Bundle::Modules::Unstable',
      'Bundle::Modules::CPAN',
      'Bundle::Modules::CPAN::Unstable',
      'Bundle::Modules::Acme::Everything',
      'Bundle::Modules::Acme::Everything::Unstable',
      'Bundle::Modules::Acme::Everything::Unique',

   ],

   'Bundle::Modules::Unstable' =>
   [
      'Bundle::Modules',
     #'Bundle::Modules::Unstable',
      'Bundle::Modules::CPAN',
      'Bundle::Modules::CPAN::Unstable',
      'Bundle::Modules::Acme::Everything',
      'Bundle::Modules::Acme::Everything::Unstable',
      'Bundle::Modules::Acme::Everything::Unique',

   ],

   'Bundle::Modules::CPAN' =>
   [
      'Bundle::Modules',
      'Bundle::Modules::Unstable',
     #'Bundle::Modules::CPAN',
      'Bundle::Modules::CPAN::Unstable',
      'Bundle::Modules::Acme::Everything',
      'Bundle::Modules::Acme::Everything::Unstable',
      'Bundle::Modules::Acme::Everything::Unique',

   ],

   'Bundle::Modules::CPAN::Unstable' =>
   [
      'Bundle::Modules',
      'Bundle::Modules::Unstable',
      'Bundle::Modules::CPAN',
     #'Bundle::Modules::CPAN::Unstable',
      'Bundle::Modules::Acme::Everything',
      'Bundle::Modules::Acme::Everything::Unstable',
      'Bundle::Modules::Acme::Everything::Unique',

   ],

   'Bundle::Modules::Acme::Everything' =>
   [
      'Bundle::Modules',
      'Bundle::Modules::Unstable',
      'Bundle::Modules::CPAN',
      'Bundle::Modules::CPAN::Unstable',
     #'Bundle::Modules::Acme::Everything',
      'Bundle::Modules::Acme::Everything::Unstable',
      'Bundle::Modules::Acme::Everything::Unique',

   ],

   'Bundle::Modules::Acme::Everything::Unstable' =>
   [
      'Bundle::Modules',
      'Bundle::Modules::Unstable',
      'Bundle::Modules::CPAN',
      'Bundle::Modules::CPAN::Unstable',
      'Bundle::Modules::Acme::Everything',
     #'Bundle::Modules::Acme::Everything::Unstable',
      'Bundle::Modules::Acme::Everything::Unique',

   ],

   'Bundle::Modules::Acme::Everything::Unique' =>
   [
      'Bundle::Modules',
      'Bundle::Modules::Unstable',
      'Bundle::Modules::CPAN',
      'Bundle::Modules::CPAN::Unstable',
      'Bundle::Modules::Acme::Everything',
      'Bundle::Modules::Acme::Everything::Unstable',
     #'Bundle::Modules::Acme::Everything::Unique',

   ],

);

#foreach my $x ( keys %SEEALSO )
#{
#   printf( "x=%s\n", $x );
=cut
   foreach my $y ( @{$SEEALSO{$b}} )
   {
     printf( "y=%s\n", $y );

   } ## end foreach
=cut
#} ## end foreach

   return (
'' ."\n".
'=head1 CHANGES' ."\n".
'' ."\n".
'=over' ."\n".
'' ."\n".
'=item '. $SEEDATE . ' (YYYY.MMDD)' ."\n".
'' ."\n".
'Initial version of: '. $b . '-' . $SEEDATE . "\n".
'' ."\n".
'This B<L<Bundle::Modules>> component package is in pre-alpha state with hash ordering.' ."\n".
'' ."\n".
'The ordering of listed modules will eventually be prioritized for efficiency and completeness.' ."\n".
'' ."\n".
'Modules commented out of this module list are either I<unstable> or I<stable> in the B<L<Bundle::Modules>> context.' ."\n".
'' ."\n".
'Optimistically, if there are a lot of the modules commented out, then they are I<stable>, and we\'re listing I<unstable> context.' ."\n".
'' ."\n".
'Optimistically, if there are a few of the modules commented out, then they are I<unstable>, and we\'re listing I<stable> context.' ."\n".
'' ."\n".
'If you use the command C<B<man '. $b . '>>, type C<B</#>> to see the commented out modules as they\'re higlighted for you by B<L<man>>.' ."\n".
'' ."\n".
'=back' ."\n".
'' ."\n".
'=head1 DESCRIPTION' ."\n".
'' ."\n".
'=over' ."\n".
'' ."\n".
'=item ' . $DESCRB ."\n".
'' ."\n".
'=back' ."\n".
'' ."\n".
'=head1 SEE ALSO' ."\n".
'' ."\n".
'=over' ."\n".
'' ."\n".
'=item I<L<' . join( ">>, I<L<", @{$SEEALSO{'Bundle::Modules'}} ) . '>>' ."\n".
'' ."\n".
'=back' ."\n".
'' ."\n".
'=head1 AUTHORS' ."\n".
'' ."\n".
'=over' ."\n".
'' ."\n".
'=item ' . $AUTHOR ."\n".
'' ."\n".
'=back' ."\n".
'' ."\n".
'=head1 LICENSE for ' . $CPANID ."\n".
'' ."\n".
'=over' ."\n".
'' ."\n".
'=item ' . $LICENS ."\n".
'' ."\n".
'=item ' . $LTERMS ."\n".
'' ."\n".
'=back' ."\n".
'' ."\n".
'=head1 COPYRIGHT' ."\n".
'' ."\n".
'=over' ."\n".
'' ."\n".
'=item ' . $CRIGHT ."\n".
'' ."\n".
'=back' ."\n".
'' ."\n".
"\n"
   ); } ## end sub Bundle_foot

__END__

