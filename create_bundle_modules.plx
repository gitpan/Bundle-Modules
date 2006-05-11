#!/usr/bin/perl -w
##

use strict;

use warnings;

require Date::Format;

require IO::File;

my $SEEDDATE = Date::Format::time2str( '%Y.%m%d', 1147298572 ); ## TBD

my $VERSION =  Date::Format::time2str( '%Y.%m%d', time );

my $AUTHOR = 'Eric R. Meyers (CPAN author/id/E/ER/ERMEYERS/Bundle-Modules-' . $VERSION . ')';

my $BNDLROOT = $ENV{'HOME'}. '/Bundle-Modules-' . $VERSION;

my $CPANROOT = $ENV{'HOME'} . '/.cpan';

my $CPANPLUSROOT = $ENV{'HOME'} . '/.cpanplus';

## ------
## Bundle::Modules
## ------
my %Bundle__Modules = ();

rename ( $BNDLROOT . '/Modules.pm', $BNDLROOT . '/Modules.pm.bak' );

my $Bundle__Modules = IO::File->new( $BNDLROOT . '/Modules.pm', '+>' ) ||
                      die "opening Bundle::Modules:$!\n";

## ------
## Bundle::Modules::Unstable
## ------
my %Bundle__Modules__Unstable = ();

my $Bundle__Modules__Unstable = IO::File->new( $BNDLROOT . '/Modules/Unstable.pm', '+<' ) ||
                                die "opening Bundle::Modules::Unstable:$!\n";

## ------
## Bundle::Modules::CPAN
## ------
my %Bundle__Modules__CPAN = ();

rename ( $BNDLROOT . '/Modules/CPAN.pm', $BNDLROOT . '/Modules/CPAN.pm.bak' );

my $Bundle__Modules__CPAN = IO::File->new( $BNDLROOT . '/Modules/CPAN.pm', '+>' ) ||
                            die "opening Bundle::Modules::CPAN:$!\n";

## ------
## Bundle::Modules::CPAN::Unstable
## ------
my %Bundle__Modules__CPAN__Unstable = ();

my $Bundle__Modules__CPAN__Unstable = IO::File->new( $BNDLROOT . '/Modules/CPAN/Unstable.pm', '+<' ) ||
                                      die "opening Bundle::Modules::CPAN::Unstable:$!\n";

## ------
## Bundle::Modules::Acme::Everything
## ------
my %Bundle__Acme__Everything = ();

my $Bundle__Acme__Everything = IO::File->new( $BNDLROOT . '/Modules/Acme/Everything.pm', '<' ) ||
                               die "opening Bundle::Modules::Acme::Everything:$!\n";

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
   'Bundle::Modules::Acme::Everything::Unique' => 0,
);

$count{'math'} = ( $count{'Bundle::Modules::CPAN'} + $count{'Bundle::Modules::CPAN::Unstable'} )
               - ( $count{'Packages__Details'} + $count{'Bundle::Modules::Acme::Everything::Unique'} )
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
## ##unstable in Bundle::Modules from Bundle::Modules::Unstable
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
## ##unstable in Bundle::Modules::CPAN from Bundle::Modules::CPAN::Unstable
## ------

foreach my $Perln ( keys %Bundle__Modules__CPAN__Unstable )
{
   $Bundle__Modules__CPAN{'##'.$Perln} = $Bundle__Modules__CPAN__Unstable{$Perln};

} ## end foreach

## ------
## Bundle::Modules::Acme::Everything
## ------

$Contents = 0;

while ( my $Perln = <$Bundle__Acme__Everything> )
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
         $Bundle__Acme__Everything{$Perln} = 1;

         $count{'Bundle::Modules::Acme::Everything'}++;

      } ## end if

   } ## end if

} ## end while

$Bundle__Acme__Everything->close();

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

##
## Bundle::Modules::Acme::Everything::Unique -- to eliminate redundancy
##
my %Bundle__Modules__Acme__Everything__Unique = ();

my $Bundle__Modules__Acme__Everything__Unique = IO::File->new( $BNDLROOT . '/Modules/Acme/Unique.pm', '+>' ) ||
                                                die "opening Bundle::Modules::Acme::Everything::Unique:$!\n";

$Bundle__Modules__Acme__Everything__Unique->print( Bundle_head( 'Bundle::Modules::Acme::Everything::Unique',
                                                                'All current unique modules in Bundle::Everything from CPAN',
                                                              )
                                                 );

foreach my $Perln ( keys %Bundle__Acme__Everything )
{
   if ( defined( $Packages__Details{$Perln} ) )
   {
      delete( $Bundle__Acme__Everything{$Perln} );

      $count{'Bundle::Modules::Acme::Everything'}--;

   }
   else
   {
      $Bundle__Modules__Acme__Everything__Unique{$Perln} = 1;

      $count{'Bundle::Modules::Acme::Everything::Unique'}++;

      $Bundle__Modules__Acme__Everything__Unique->print( $Perln ."\n" );

   } ## end if

} ## end foreach

$Bundle__Modules__Acme__Everything__Unique->print( Bundle_foot( 'Bundle::Modules::Acme::Everything::Unique' ) );

$Bundle__Modules__Acme__Everything__Unique->close();


## ------
## modules from sources
## ------

foreach my $Perln ( keys %Packages__Details,
                    keys %Bundle__Modules__Acme__Everything__Unique,
                  )
{
   if ( $Perln =~ m/^Bundle::/ )
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

$Bundle__Modules->print( Bundle_head( 'Bundle::Modules',
                                      'All current stable bundles of modules in CPAN',
                                    )
                       );

foreach my $Perln ( keys %Bundle__Modules )
{
   $Bundle__Modules->print( $Perln . "\n" );

} ## end foreach

$Bundle__Modules->print( Bundle_foot( 'Bundle::Modules' ) );

$Bundle__Modules->close();

## ------
## Bundle::Modules::CPAN
## ------
$Bundle__Modules__CPAN->print( Bundle_head( 'Bundle::Modules::CPAN',
                                            'All current stable modules in CPAN',
                                          )
                             );

foreach my $Perln ( keys %Bundle__Modules__CPAN )
{
   $Bundle__Modules__CPAN->print( $Perln . "\n" );

} ## end foreach

$Bundle__Modules__CPAN->print( Bundle_foot( 'Bundle::Modules::CPAN' ) );

$Bundle__Modules__CPAN->close();

## ------
## ##stable in Bundle::Modules::Unstable from Bundle::Modules
## ------

foreach my $Perln ( keys %Bundle__Modules )
{
   next if ( $Perln =~ m/^[#]/ ); ## don't want unstable

   $Bundle__Modules__Unstable{'##'.$Perln} = 'Bundle::Modules';

} ## end foreach

## ------
## Bundle::Modules::Unstable
## ------
rename ( $BNDLROOT . '/Modules/Unstable.pm', $BNDLROOT . '/Modules/Unstable.pm.bak' );

$Bundle__Modules__Unstable = IO::File->new( $BNDLROOT . '/Modules/Unstable.pm', '+>' ) ||
                             die "opening Bundle::Modules::Unstable:$!\n";

$Bundle__Modules__Unstable->print( Bundle_head( 'Bundle::Modules::Unstable',
                                                'All current unstable bundles of modules in CPAN',
                                              )
                                 );

foreach my $Perln ( keys %Bundle__Modules__Unstable )
{
   $Bundle__Modules__Unstable->print( $Perln . "\n" );

} ## end foreach

$Bundle__Modules__Unstable->print( Bundle_foot( 'Bundle::Modules::Unstable' ) );

$Bundle__Modules__Unstable->close();

## ------
## ##stable in Bundle::Modules::CPAN::Unstable from Bundle::Modules::CPAN
## ------

foreach my $Perln ( keys %Bundle__Modules__CPAN )
{
   next if ( $Perln =~ m/^[#]/ );

   $Bundle__Modules__CPAN__Unstable{'##'.$Perln} = 'Bundle::Modules::CPAN';

} ## end foreach

## ------
## Bundle::Modules::CPAN::Unstable
## ------
rename ( $BNDLROOT . '/Modules/CPAN/Unstable.pm', $BNDLROOT . '/Modules/CPAN/Unstable.pm.bak' );

$Bundle__Modules__CPAN__Unstable = IO::File->new( $BNDLROOT . '/Modules/CPAN/Unstable.pm', '+>' ) ||
                                   die "opening Bundle::Modules::CPAN::Unstable:$!\n";

$Bundle__Modules__CPAN__Unstable->print( Bundle_head( 'Bundle::Modules::CPAN::Unstable',
                                                      'All current unstable modules in CPAN',
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

printf( "count{'%-21s'}=%6d\tcount{'%-31s'}=%6d\n",
        'Packages__Details', $count{'Packages__Details'},
        'Bundle::Modules::Acme::Everything::Unique', $count{'Bundle::Modules::Acme::Everything::Unique'},
      );

printf( "count{'%-21s'}=%6d\tcount{'%-31s'}=%6d\n",
        'Bundle::Modules', $count{'Bundle::Modules'},
        'Bundle::Modules::Unstable', $count{'Bundle::Modules::Unstable'},
      );

$count{'math'} = ( $count{'Bundle::Modules::CPAN'} + $count{'Bundle::Modules::CPAN::Unstable'} )
               - ( $count{'Packages__Details'} + $count{'Bundle::Modules::Acme::Everything::Unique'} )
               + ( $count{'Bundle::Modules'} + $count{'Bundle::Modules::Unstable'} );

printf( "( %d + %d ) - ( %d + %d ) + ( %d + %d ) = %d\n",
        $count{'Bundle::Modules::CPAN'}, $count{'Bundle::Modules::CPAN::Unstable'},
        $count{'Packages__Details'}, $count{'Bundle::Modules::Acme::Everything::Unique'},
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
$b . ' - ' . $d ."\n".
'' ."\n".
'=head1 SYNOPSIS' ."\n".
'' ."\n".
'C<perl -MCPAN -e \'install '. $b . '\'>' ."\n".
'' ."\n".
'C<cpan -i ' . $b . '>' ."\n".
'' ."\n".
'=head1 CONTENTS' ."\n"
); } ## end sub Bundle_head

## ------
## Bundle_foot
## ------
sub Bundle_foot
{ my $b = shift; return (
'=head1 CHANGES' ."\n".
'' ."\n".
'=over 4' ."\n".
'' ."\n".
'=item 0.01' ."\n".
'' ."\n".
'This is '. $b . ' initial version ' . $VERSION . ' (YYYY.MMDD)' . "\n".
'' ."\n".
'This C<Bundle::Modules> component package is in pre-alpha state with hash ordering.' ."\n".
'' ."\n".
'The ordering of listed modules will eventually be prioritized for efficiency and completeness.' ."\n".
'' ."\n".
'Modules commented out of this module list are either unstable or stable in the C<Bundle::Modules> context.' ."\n".
'' ."\n".
'Optimistically, if there are a lot of the modules commented out, then they are stable, and we\'re listing unstable context.' ."\n".
'' ."\n".
'Optimistically, if there are a few of the modules commented out, then they are unstable, and we\'re listing stable context.' ."\n".
'' ."\n".
'=back' ."\n".
'' ."\n".
'=head1 AUTHOR' ."\n".
'' ."\n".
$AUTHOR ."\n"
); } ## end sub Bundle_foot

__END__

