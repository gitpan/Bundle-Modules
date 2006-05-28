#!/usr/bin/perl -w
##

package Bundle::Modules;

use 5.005;

our $VERSION = 2006.0528; ## (YYYY.MMDD)

##
## Bundle::Modules
##

package main;

use strict;

use warnings;

require Shell;

require XML::Dumper;

require CPANPLUS::Backend;

require Bundle::Modules::Test::Reporter;

my $context = 'Bundle::Modules';

$context =~ m/::(\w)$/;

$context = lc( $1 );

$context = 'stable' if ( $context ne 'unstable' );

my $xml = XML::Dumper->new();

$xml->dtd();

my $sh = Shell->new();

my $plus = CPANPLUS::Backend->new( 'conf' => { 'no_update'  => 0,
                                                 'allow_build_interactivity' => 1,
                                                 'verbose' => 1,
                                               } );

my $conf = $plus->configure_object();

$conf->set_conf( 'force' => 0 );

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

   $perm = ExtUtils::MakeMaker::prompt( "May I report installation security and stability statistics, via email, about the installs performed on your system?", $perm );

   alarm 0;

}; ## end eval

if ( $@ )
{
   ##
   ## timeout
   ##
   die( $@ ) unless ( $@ eq "alarm\n" );

   $perm = 'y';

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
   'comments' => 'Generated by Bundle::Modules.',
   'via' => 'Bundle::Modules 2006.0528'

   );

my @module = ();



push( @module, 'Bundle::libservlet' );
push( @module, 'Bundle::Math::Financial' );
push( @module, 'Bundle::SDK::COG' );
push( @module, 'Bundle::WWW::Mechanize::Shell' );
push( @module, 'Bundle::BDFOY' );
push( @module, 'Bundle::Tree::Simple' );
push( @module, 'Bundle::Gnome2' );
push( @module, 'Bundle::Slash' );
push( @module, 'Bundle::SDK::SIMON' );
push( @module, 'Bundle::MusicBrainz::Server' );
push( @module, 'Bundle::Expect' );
push( @module, 'Bundle::NiceSleep' );
push( @module, 'Bundle::Perl6' );
push( @module, 'Bundle::Math::Calculus' );
push( @module, 'Bundle::HTMLWikiConverter' );
push( @module, 'Bundle::Zavitan' );
push( @module, 'Bundle::Test' );
push( @module, 'Bundle::Math::Matrix' );
push( @module, 'Bundle::TreeDumper' );
push( @module, 'Bundle::perlWebSite' );
push( @module, 'Bundle::COG' );
push( @module, 'Bundle::WWW::Scraper::Housing' );
push( @module, 'Bundle::InterchangeKitchenSink' );
push( @module, 'Bundle::Devel' );
push( @module, 'Bundle::XML' );
push( @module, 'Bundle::Rose' );
push( @module, 'Bundle::Math::Numeric' );
push( @module, 'Bundle::Maypole' );
push( @module, 'Bundle::DataMint' );
push( @module, 'Bundle::Minivend' );
push( @module, 'Bundle::AMBS' );
push( @module, 'Bundle::Interchange4' );
push( @module, 'Bundle::GMOD' );
push( @module, 'Bundle::Ovid' );
push( @module, 'Bundle::WING' );
push( @module, 'Bundle::Latemp' );
push( @module, 'Bundle::OpenILS' );
push( @module, 'Bundle::OS2_default' );
push( @module, 'Bundle::Delivery' );
push( @module, 'Bundle::DateTime::Complete' );
push( @module, 'Bundle::KohaSupport' );
push( @module, 'Bundle::Email' );
push( @module, 'Bundle::Wombat' );
push( @module, 'Bundle::Everything' );
push( @module, 'Bundle::Search::InvertedIndex' );
push( @module, 'Bundle::SSH' );
push( @module, 'Bundle::Math::Base' );
push( @module, 'Bundle::Alphamail' );
push( @module, 'Bundle::Pgreet' );
push( @module, 'Bundle::Bricolage' );
push( @module, 'Bundle::OpenSRF' );
push( @module, 'Bundle::Pugs::SmokeKit' );
push( @module, 'Bundle::OpenInteract' );
push( @module, 'Bundle::BricolagePlus' );
push( @module, 'Bundle::Combust' );
push( @module, 'Bundle::myxCal' );
push( @module, 'Bundle::CPANPLUS' );
push( @module, 'Bundle::CPANPLUS::Test::Reporter' );
push( @module, 'Bundle::Cascade' );
push( @module, 'Bundle::Math::Random' );
push( @module, 'Bundle::Lingua::PT' );
push( @module, 'Bundle::MMS::Mail::Parser' );
push( @module, 'Bundle::Starlink::Base' );
push( @module, 'Bundle::MP3' );
push( @module, 'Bundle::Pipe' );
push( @module, 'Bundle::Egrail' );
push( @module, 'Bundle::SQL::Translator' );
push( @module, 'Bundle::Urchin' );
push( @module, 'Bundle::Bugzilla' );
push( @module, 'Bundle::QuadPres' );
push( @module, 'Bundle::ABH' );
push( @module, 'Bundle::RT' );
push( @module, 'Bundle::Tie::DB_File::SplitHash' );
push( @module, 'Bundle::WormBase' );
push( @module, 'Bundle::Net::SXIP::Homesite' );
push( @module, 'Bundle::CPANPLUS::Dependencies' );
push( @module, 'Bundle::Math::Fractal' );
push( @module, 'Bundle::Math::Big' );
push( @module, 'Bundle::Math::Symbolic' );
push( @module, 'Bundle::Interchange' );
push( @module, 'Bundle::Math::Approx' );
push( @module, 'Bundle::SPOPS' );
push( @module, 'Bundle::Markup' );
push( @module, 'Bundle::Colloquy::BotBot2' );
push( @module, 'Bundle::Kwiki' );
push( @module, 'Bundle::LawMonkey' );
push( @module, 'Bundle::Sledge::I18N' );
push( @module, 'Bundle::Math' );
push( @module, 'Bundle::Sites::BetterScm' );
push( @module, 'Bundle::Math::Geometry' );
push( @module, 'Bundle::BioPerl' );
push( @module, 'Bundle::Tk_OS2src' );
push( @module, 'Bundle::CUFTS' );
push( @module, 'Bundle::OpenInteract2' );
push( @module, 'Bundle::MyLibrary' );
push( @module, 'Bundle::Business::Shipping' );
push( @module, 'Bundle::Sledge' );
push( @module, 'Bundle::Schwern' );
push( @module, 'Bundle::Bonsai' );
push( @module, 'Bundle::Math::Statistics' );
push( @module, 'Bundle::Posy' );
push( @module, 'Bundle::ePortal' );
push( @module, 'Bundle::Cobalt' );
push( @module, 'Bundle::Math::Interface' );
push( @module, 'Bundle::MusicBrainz::Client' );
push( @module, 'Bundle::Olive' );
push( @module, 'Bundle::CPAN' );
push( @module, 'Bundle::POE::All' );
push( @module, 'Bundle::libnet' );
push( @module, 'Bundle::W3C::Validator' );
push( @module, 'Bundle::CVSMonitor' );
push( @module, 'Bundle::Math::Expression' );
push( @module, 'Bundle::Knetrix' );
push( @module, 'Bundle::WWW::Search::Scraper::Housing' );

fisher_yates_shuffle( \@module );

for ( my $i = 0; $i <= $#module; $i++ )
{
   my $name = $module[$i];

   $name =~ s/[:][:]/-/g;

   my $mi = $plus->module_tree( $module[$i] );


   eval( '$mi->package_name()' );

   next if ( @$ );

   next if ( $name ne $mi->package_name() );

   my $mid = $mi->package_name() . '-' . $mi->package_version();

   printf( "[BEGINNING] Distribution named %s is to be installed.\n", $mid );

   $mi->install();

   my $mist = $mi->status();

   my $xml_gz = undef;

   my $context_pl = undef;

   $reporter->distribution( $mid );

   if ( defined( $mist->extract() ) )
   {
      if ( $perm && ! -f $mist->extract().'/SIGNATURE' )
      {
         printf( "[REPORTING] %s missing SIGNATURE, sending insecurity message.\n", $mid );

         $reporter->grade( 'unsigned' );

         $reporter->send() || die $reporter->errstr();

      } ## end if

   } ## end if

   if ( ( $context eq 'stable' ) && ! $mist->installed() )
   {
      if ( $perm )
      {
         printf( "[REPORTING] %s failed to install, sending instablity message.\n", $mid );

         $reporter->grade( 'unstable' );

         $reporter->send() || die $reporter->errstr();

      } ## end if

      if ( -d '_dat' )
      {
         $xml_gz = 'Bundle::Modules::Unstable.xml.gz';

         $xml_gz =~ s/[:][:]/__/g;

         $context_pl = $xml->xml2pl( $xml_gz );

         $context_pl->{$module[$i]} = 1;

         $xml->pl2xml( $context_pl, $xml_gz );

      } ## end if

      printf( "[COMPLETED] Distribution named %s is not installed.\n", $mid );

   }
   elsif ( ( $context eq 'unstable' ) && $mist->installed() )
   {
      if ( ( $mist->signature() && $mist->checksum_ok() && -f $mist->extract().'/SIGNATURE' ) || ! $mist->created() )
      {
         if ( defined( $mist->extract() ) )
         {
            if ( $perm )
            {
               printf( "[REPORTING] %s is installed with a trusted signature, sending stablity message.\n", $mid );

               $reporter->grade( 'stable' );

            } ## end if

            if ( -d '_dat' )
            {
               $xml_gz = 'Bundle::Modules.xml.gz';

               $xml_gz =~ s/[:][:]/__/g;

               $context_pl = $xml->xml2pl( $xml_gz );

               $context_pl->{$module[$i]} = 0;

               $xml->pl2xml( $context_pl, $xml_gz );

            } ## end if

         }
         else
         {
            if ( $perm )
            {
               printf( "[REPORTING] %s is already installed, sending installed message.\n", $mid );

               $reporter->grade( 'installed' );

            } ## end if

         } ## end if

      }
      else
      {
         if ( $perm )
         {
            printf( "[REPORTING] %s is installed without a trusted signature, sending insecurity message.\n", $mid );

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
      $sh->rm( '-Rf ' . $mist->extract() );

   } ## end if

} ## end for

##
## fisher_yates_shuffle - cookbook's in-place array permutation
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

1;

__END__

=head1 NAME

Bundle::Modules - All current I<stable> bundles of modules in CPAN

=head1 SYNOPSIS

perl -MCPAN -e B<'install Bundle::Modules'>

cpan B<-i Bundle::Modules>

perl -MBundle::Modules

=head1 CONTENTS
Bundle::CPAN
Bundle::CPANPLUS
Bundle::Expect
Bundle::Test
Shell
=head1 CHANGES

=over

=item 2006.0510 (YYYY.MMDD)

Initial version of: Bundle::Modules-2006.0510

This B<L<Bundle::Modules>> component package is in pre-alpha state with hash ordering.

The ordering of listed modules will eventually be prioritized for efficiency and completeness.

Modules commented out of this module list are either I<unstable> or I<stable> in the B<L<Bundle::Modules>> context.

Optimistically, if there are a lot of the modules commented out, then they are I<stable>, and we're listing I<unstable> context.

Optimistically, if there are a few of the modules commented out, then they are I<unstable>, and we're listing I<stable> context.

If you use the command C<B<man Bundle::Modules>>, type C<B</#>> to see the commented out modules as they're higlighted for you by B<man>.

=item 2006.0520

This contains a newly refined concept of: Bundle::Modules-2006.0520

This B<L<Bundle::Modules>> component package is in pre-alpha state with randomized hash ordering.

The ordering of listed modules is now shuffled randomly on each run for better efficiency and completeness.

Modules are no longer listed in CONTENTS, like other 'Bundle::' bundles out there.  I just list Bundle::CPANPLUS.

I support the idea of testing of installations in mass, and I use the information provided by CPANPLUS test reports.

The B<L<Bundle::Modules>> suite has I<stable> and I<unstable> listings that will be updated using the information provided by the testers.db

The B<L<Bundle::Modules>> suite uses Module::Build in its Build.PL, and generates a compatible Makefile.PL.

The B<L<Bundle::Modules>> suite uses the CPANPLUS::Backend to create its own random-ordered installations.

=back

=head1 DESCRIPTION

This Bundle package will install all of the modules listed, if they're not commented out of the B<L<Bundle::Modules>> context.

=head1 SEE ALSO

I<L<Bundle::Modules::Unstable>>, I<L<Bundle::Modules::CPAN>>, I<L<Bundle::Modules::CPAN::Unstable>>, I<L<Bundle::Modules::Apache>>, I<L<Bundle::Modules::Apache::Unstable>>

=head1 AUTHORS

Eric R. Meyers E<lt>ermeyers@adelphia.netE<gt>

=head1 LICENSE for http://www.cpan.org/authors/id/E/ER/ERMEYERS/Bundle-Modules-2006.0528

perl

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=head1 COPYRIGHT

Copyright (C) 2006 by Eric R. Meyers E<lt>ermeyers@adelphia.netE<gt>


