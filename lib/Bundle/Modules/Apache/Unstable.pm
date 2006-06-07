#!/usr/bin/perl -w
##

package Bundle::Modules::Apache::Unstable;

use 5.005;

our $VERSION = 2006.0606; ## (YYYY.MMDD)

##
## Bundle::Modules::Apache::Unstable
##

package main;

use strict;

use warnings;

require File::Spec;

require XML::Dumper;

require CPANPLUS::Backend;

require Bundle::Modules::Test::Reporter;

my $context = 'Bundle::Modules::Apache::Unstable';

$context =~ m/::(\w)$/;

$context = lc( $1 );

$context = 'stable' if ( $context ne 'unstable' );

my $xml = XML::Dumper->new();

$xml->dtd();

my $plus = CPANPLUS::Backend->new( 'conf' => { 'no_update'  => 0,
                                                 'allow_build_interactivity' => 1,
                                                 'verbose' => 1,
                                               } );

my $conf = $plus->configure_object();

$conf->set_conf( 'force' => 0 );

my $osname = $^O;

my $prmt = "[__START__] May I report Security and Stability status via email, about the installations we perform on your $osname system?";

my $perm = ( $conf->get_conf( 'cpantest' ) )? 'Y' : 'N';

$conf->set_conf( 'cpantest' => 0 );

$conf->set_conf( 'prereqs' => 3 ); ## follow

$conf->set_conf( 'signature' => 1 );

$conf->set_conf( 'skiptest' => 0 );

$conf->set_conf( 'timeout' => 1 );

if ( defined( $ENV{'TEST_POD'} ) && ( $ENV{'TEST_POD'} == 1 ) )
{

}
else
{
   $plus->reload_indices( 'update_source' => 1, 'verbose' => 1 );

} ## end if

eval
{
   local $SIG{'ALRM'} = sub { die( "alarm\n" ) };

   alarm 30;

   $perm = ExtUtils::MakeMaker::prompt( $prmt, $perm );

   alarm 0;

}; ## end eval

if ( $@ )
{
   ##
   ## timeout
   ##
   die( $@ ) unless ( $@ eq "alarm\n" );

   print "\n";

} ## end if

if ( $perm =~ /^y/i )
{
   $perm = 1;

}
else
{
   $perm = 0;

} ## end if

my $reporter = Bundle::Modules::Test::Reporter->new(
   'grade' => 'unstable',
   'distribution' => 'TBD',
   'comments' => 'Generated by Bundle::Modules::Apache::Unstable.',
   'via' => 'Bundle::Modules::Apache::Unstable 2006.0606'

   );

my @module = ();

my $basf = 'Bundle::Modules::Apache::Unstable';

$basf =~ s/::/__/g;

my $stab = $basf;

$stab =~ s/__Unstable$//;

$stab .= '__Stability.txt.gz';

open( FH, "GET http://users.adelphia.net/~ermeyers/bundle_modules/$stab | zcat - |" ) ||
       die( "opening bundle's list:$!\n" );

while ( <FH> )
{
   my ( $x, $s ) = split( '=', $_ );

   if ( ( $s && ( $context eq 'stable' ) ) || ( ! $s && ( $context eq 'unstable' ) ) )
   {
      push( @module, $x );

   } ## end if

} ## end while

close( FH );





fisher_yates_shuffle( \@module );

for ( my $i = 0; $i <= $#module; $i++ )
{
   my $name = $module[$i];

   $name =~ s/[:][:]/-/g;

   my $mi = $plus->module_tree( $module[$i] );


   eval( '$mi->package_name()' );

   next if ( @$ );

   next if ( $name ne $mi->package_name() );

   my $xml_gz = undef;

   my $context_pl = undef;

   my $mid = $mi->package_name() . '-' . $mi->package_version();

   printf( "[BEGINNING] Distribution named %s is to be installed.\n", $mid );

   $conf->set_conf( 'force' => 0 );

   $mi->install();

   my $mist = $mi->status();

   $reporter->distribution( $mid );

   if ( -d '_dat' && $mist->installed && ! defined( $mist->extract() ) )
   {
      $conf->set_conf( 'force' => 1 );

      $mi->fetch();

      $mi->extract();

      $mist = $mi->status();

      $conf->set_conf( 'force' => 0 );

   } ## end if

   if ( defined( $mist->extract() ) )
   {
      if ( $perm && ! -f File::Spec->catfile( $mist->extract(), 'SIGNATURE' ) )
      {
         printf( "[REPORTING] Distribution named %s missing SIGNATURE, sending insecurity message.\n", $mid );

         $reporter->grade( 'unsigned' );

         $reporter->send() || die $reporter->errstr();

      } ## end if

      if ( -d '_dat' )
      {
         if ( ! -f File::Spec->catfile( $mist->extract(), 'SIGNATURE' ) )
         {
            printf( "[REPORTING] Distribution named %s missing SIGNATURE, saving insecurity data.\n", $mid );

            $xml_gz = File::Spec->catfile( '_dat',  $basf . '__unsigned.xml.gz' );

            $context_pl = undef;

            $context_pl = $xml->xml2pl( $xml_gz ) if ( -f $xml_gz );

            my $author = $mi->author();

            $context_pl->{$module[$i]} = { 'author' => $author->author(),
                                           'cpanid' => $author->cpanid(),
                                           'email' => $author->email(),
                                           ##'distributions' => [ $author->distributions() ],
                                         };

            $xml->pl2xml( $context_pl, $xml_gz );

         } ## end if

         $xml_gz = File::Spec->catfile( '_dat',  $basf . '__prereqs.xml.gz' );

         $context_pl = undef;

         $context_pl = $xml->xml2pl( $xml_gz ) if ( -f $xml_gz );

         if ( ! defined( $context_pl->{$module[$i]} ) )
         {
            printf( "[REPORTING] Distribution named %s, saving prereqs data.\n", $mid );

            $context_pl->{$module[$i]} = $mist->prereqs();

            $xml->pl2xml( $context_pl, $xml_gz );

            foreach my $x ( keys %{$context_pl->{$module[$i]}} )
            {
               printf( "\t'%s' => '%s'\n", $x, $context_pl->{$module[$i]}->{$x} );

            } ## end foreach

         } ## end if

      } ## end if

   } ## end if

   if ( ( $context eq 'stable' ) && ! $mist->installed() )
   {
      if ( $perm )
      {
         printf( "[REPORTING] Distribution named %s failed to install, sending instablity message.\n", $mid );

         $reporter->grade( 'unstable' );

         $reporter->send() || die $reporter->errstr();

      } ## end if

      if ( -d '_dat' )
      {
         printf( "[REPORTING] Distribution named %s failed to install, saving instablity data.\n", $mid );

         $xml_gz = File::Spec->catfile( '_dat', $basf . '__Unstable.xml.gz' );

         $context_pl = undef;

         $context_pl = $xml->xml2pl( $xml_gz ) if ( -f $xml_gz );

         $context_pl->{$module[$i]} = 1;

         $xml->pl2xml( $context_pl, $xml_gz );

      } ## end if

      printf( "[COMPLETED] Distribution named %s is not installed.\n", $mid );

   }
   elsif ( ( $context eq 'unstable' ) && $mist->installed() )
   {
      if ( ( $mist->signature() && $mist->checksum_ok() && -f File::Spec->catfile( $mist->extract(), 'SIGNATURE' ) ) || ! $mist->created() )
      {
         if ( defined( $mist->extract() ) )
         {
            if ( $perm )
            {
               printf( "[REPORTING] Distribution named %s is installed with a trusted signature, sending stablity message.\n", $mid );

               $reporter->grade( 'stable' );

            } ## end if

            if ( -d '_dat' )
            {
               printf( "[REPORTING] Distribution named %s is installed with a trusted signature, saving stablity data.\n", $mid );

               $xml_gz = File::Spec->catfile( '_dat', $basf . '.xml.gz' );

               $context_pl = undef;

               $context_pl = $xml->xml2pl( $xml_gz ) if ( -f $xml_gz );

               $context_pl->{$module[$i]} = 0;

               $xml->pl2xml( $context_pl, $xml_gz );

            } ## end if

         }
         else
         {
            if ( $perm )
            {
               printf( "[REPORTING] Distribution named %s is already installed, sending installed message.\n", $mid );

               $reporter->grade( 'installed' );

            } ## end if

         } ## end if

      }
      else
      {
         if ( $perm )
         {
            printf( "[REPORTING] Distribution named %s is installed without a trusted signature, sending insecurity message.\n", $mid );

         $reporter->grade( 'signature' );

         } ## end if

      } ## end if

      if ( $perm )
      {
         $reporter->send() || die $reporter->errstr();

      } ## end if

      printf( "[COMPLETED] Distribution named %s is installed.\n", $mid );

   }
   elsif ( ( $context eq 'stable' ) && $mist->installed() )
   {
      printf( "[COMPLETED] Distribution named %s is installed.\n", $mid );

   }
   elsif ( ( $context eq 'unstable' ) && ! $mist->installed() )
   {
      printf( "[COMPLETED] Distribution named %s is not installed.\n", $mid );

   } ## end if

   if ( defined( $mist->extract() ) )
   {
      remove_directory(  $mist->extract() );

   } ## end if

   $mi->parent->flush('lib');

} ## end for

##
## fisher_yates_shuffle - Perl Cookbook's in-place array permutation
##
sub fisher_yates_shuffle
{
   my $a = shift;

   for ( my $i = @$a; $i--; )
   {
      my $j = int( rand( $i + 1 ) );

      next if ( $i == $j );

      @$a[$i,$j] = @$a[$j,$i];

   } ## end for

} ## end sub fisher_yates_shuffle

##
## remove_directory
##
sub remove_directory
{
   my $dir = shift;

   opendir( DH, $dir ) || die( "opening dir=$dir:$!\n" );

   while ( defined( my $item = readdir( DH ) ) )
   {
      next if ( ( $item eq '.' ) || ( $item eq '..' ) );

      my $dir_item = File::Spec->catfile( $dir, $item );

      ##debug##print $dir_item ."\n";

      if ( -d  $dir_item )
      {
         ##debug##print 'call is ' . $dir_item ."\n";

         remove_directory( $dir_item );

      }
      elsif ( -f $dir_item )
      {

         unlink( $dir_item );

      } ## end if

   } ## end foreach

   closedir( DH );

   rmdir( $dir );

} ## end sub remove_directory

1;

__END__

=head1 NAME

Bundle::Modules::Apache::Unstable - All current I<unstable> Apache modules in CPAN

=head1 SYNOPSIS

cpanp B<-i Bundle::Modules::Apache::Unstable> ## This installs it

perl B<-MBundle::Modules::Apache::Unstable> ## This runs it

NOTE[1]: B<This is a VERY NEW and DIFFERENT TYPE of bundle>, and it's completely unlike previously known bundles.

NOTE[2]: perl -MCPAN -e 'install Bundle::Modules::Apache::Unstable' ## This will look like an old bundle, and simply loads the Pod's few 'CONTENTS' as listed.

NOTE[3]: perl -MCPANPLUS -e 'install Bundle::Modules::Apache::Unstable' ## This behaves like a new bundle, and actually installs B<The L<Bundle::Modules> suite>.

NOTE[4]: perl -MBundle::Modules::Apache::Unstable ## This will behave much differently, like a 'new type' of bundle should, and installs modules according to its B<L<Bundle::Modules>> context.

NOTE[5]: Please READ this document fully, before criticizing B<The L<Bundle::Modules> suite>, something new and much different than what you've expected to find in a bundle.

=head1 CONTENTS
Bundle::CPAN
Bundle::CPANPLUS
Bundle::Expect
Bundle::Test

=head1 CHANGES

=over

=item 2006.0510 (YYYY.MMDD)

Initial version of: Bundle::Modules::Apache::Unstable-2006.0510

This B<L<Bundle::Modules>> component package is in pre-alpha state with hash ordering.

The ordering of listed modules will eventually be prioritized for efficiency and completeness.

Modules excluded from this module list are either I<unstable> or I<stable> in the B<L<Bundle::Modules>> context.

Optimistically, if there are a lot of modules excluded, then they are I<stable>, and we're listing I<unstable> context.

Optimistically, if there are a few of modules excluded, then they are I<unstable>, and we're listing I<stable> context.

=item 2006.0520

This contains a newly refined concept of: Bundle::Modules::Apache::Unstable-2006.0520

This B<L<Bundle::Modules>> component package is in pre-alpha state with randomized hash ordering.

The ordering of listed modules is now shuffled randomly on each run for better efficiency and completeness.

Modules are no longer listed in CONTENTS, like other 'Bundle::' bundles out there.  I just list a few like Bundle::CPANPLUS.

I support the idea of testing installations in mass, and I'll use the information provided by CPANPLUS test reports.

The B<L<Bundle::Modules>> suite has I<stable> and I<unstable> listings that will be updated using the information provided by the testers.db

The B<L<Bundle::Modules>> suite uses Module::Build in its Build.PL, and generates a compatible Makefile.PL.

The B<L<Bundle::Modules>> suite uses the CPANPLUS::Backend to create its own random-ordered installations.

=item 2006.0605

This now contains a derivative of Test::Reporter, called Bundle::Modules::Test::Reporter.

Bundle::Modules::Test::Reporter sends reports used to create an install.db, like the testers.db.

The install.db will keep track of Installation Security and Stability Issues affecting user installations.

      fetch()                   install.db
      extract()                 |        |
      create()                  |        |
      test()         testers.db |        |
      install()                 install.db

Did the fetch()   result with a good CHECKSUM?

Did the extract() result with a good SIGNATURE and a good MANIFEST?

Did the create()  succeed in order to proceed into testing?

Did the test()    result really deserve the grade('pass') in testers.db, or was that FAILED just the user's imagination?

Did the install() result in the user having succeeded in actually getting the distribution, or were we just throwing electron's around?

Basically, I'm trying to capture whatever can be captured, so as to characterize the distribution's Security and Stability.

The Stable bundles will go into Bundle::Modules; and, the Unstable bundles will go into Bundle::Modules::Unstable.
The Stable modules will go into Bundle::Modules::CPAN; and, the Unstable modules will go into Bundle::Modules::CPAN::Unstable.

I'll be focusing large groups of modules out of Bundle::Modules::CPAN into Bundle::Modules::Apache, Win32, etc.

The Stable modules will go into Bundle::Modules::Apache; and, the Unstable modules will go into Bundle::Modules::Apache::Unstable.
The Stable modules will go into Bundle::Modules::Win32; and, the Unstable modules will go into Bundle::Modules::Win32::Unstable.

Since I'm not a Win32 user, I'll depend on the install.db data, generated from the automated reports I get from the Win32 installers.

=back

=head1 DESCRIPTION

This B<L<Bundle::Modules>> component will install all of the modules listed, based on the stability/instability context.

=head1 SEE ALSO

I<L<Bundle::Modules>>, I<L<Bundle::Modules::Unstable>>, I<L<Bundle::Modules::CPAN>>, I<L<Bundle::Modules::CPAN::Unstable>>, I<L<Bundle::Modules::Apache>>

=head1 AUTHORS

Eric R. Meyers E<lt>ermeyers@adelphia.netE<gt>

=head1 LICENSE

perl

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=head1 COPYRIGHT

Copyright (C) 2006 by Eric R. Meyers E<lt>ermeyers@adelphia.netE<gt>


