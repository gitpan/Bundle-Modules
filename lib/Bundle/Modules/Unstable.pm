#!/usr/bin/perl -w
##

package Bundle::Modules::Unstable;

use 5.005;

our $VERSION = 2006.0521; ## (YYYY.MMDD)

##
## Bundle::Modules::Unstable
##

package main;

use strict;

use warnings;

use CPANPLUS::Backend;

my $plus = CPANPLUS::Backend->new();

my $conf = $plus->configure_object();

$conf->set_conf( 'force' => 0 );

$conf->set_conf( 'timeout' => 1 );

$plus->reload_indices( 'update_source' => 1, 'verbose' => 1 );

my @module = ();



push( @module, '##Bundle::Rose' );
push( @module, '##Bundle::DateTime::Complete' );
push( @module, '##Bundle::InterchangeKitchenSink' );
push( @module, '##Bundle::HTMLWikiConverter' );
push( @module, '##Bundle::Pugs::SmokeKit' );
push( @module, '##Bundle::WormBase' );
push( @module, '##Bundle::Maypole' );
push( @module, '##Bundle::Wizard::LDAP' );
push( @module, '##Bundle::W3C::Validator' );
push( @module, '##Bundle::OS2_default' );
push( @module, '##Bundle::Schwern' );
push( @module, '##Bundle::Math::Expression' );
push( @module, '##Bundle::Catalog' );
push( @module, '##Bundle::OS2_default4' );
push( @module, '##Bundle::Delivery' );
push( @module, '##Bundle::Alphamail' );
push( @module, '##Bundle::OurNet' );
push( @module, '##Bundle::WING' );
push( @module, '##Bundle::CPANPLUS::Test::Reporter' );
push( @module, '##Bundle::Wizard' );
push( @module, '##Bundle::Math::Numeric' );
push( @module, 'Bundle::WWW::Scraper::Housing' );
push( @module, '##Bundle::Sledge::I18N' );
push( @module, '##Bundle::KohaSupport' );
push( @module, '##Bundle::BricolagePlus' );
push( @module, '##Bundle::Sledge' );
push( @module, '##Bundle::Everything' );
push( @module, '##Bundle::Math::Interface' );
push( @module, '##Bundle::MyLibrary' );
push( @module, '##Bundle::Sites::BetterScm' );
push( @module, '##Bundle::TreeDumper' );
push( @module, '##Bundle::MP3' );
push( @module, '##Bundle::Knetrix' );
push( @module, '##Bundle::MusicBrainz::Client' );
push( @module, '##Bundle::Minivend' );
push( @module, '##Bundle::Egrail' );
push( @module, '##Bundle::OS2_default7' );
push( @module, '##Bundle::DBD::JDBC' );
push( @module, '##Bundle::Test' );
push( @module, '##Bundle::Lingua::PT' );
push( @module, '##Bundle::MusicBrainz::Server' );
push( @module, '##Bundle::PlRPC' );
push( @module, '##Bundle::CpanTestDummies' );
push( @module, '##Bundle::Math::Base' );
push( @module, '##Bundle::RT' );
push( @module, '##Bundle::myxCal' );
push( @module, '##Bundle::Combust' );
push( @module, '##Bundle::Wombat' );
push( @module, '##Bundle::Bugzilla' );
push( @module, '##Bundle::Business::Shipping' );
push( @module, '##Bundle::COG' );
push( @module, '##Bundle::HTML::Mason' );
push( @module, '##Bundle::Application::Magic' );
push( @module, '##Bundle::Devel' );
push( @module, '##Bundle::Expect' );
push( @module, '##Bundle::Pgreet' );
push( @module, '##Bundle::Phalanx100' );
push( @module, '##Bundle::Ovid' );
push( @module, '##Bundle::Msql' );
push( @module, '##Bundle::Tree::Simple' );
push( @module, '##Bundle::ParallelUA' );
push( @module, '##Bundle::Zoidberg' );
push( @module, '##Bundle::OpenSRF' );
push( @module, '##Bundle::Business::Shipping::UPS_Offline' );
push( @module, '##Bundle::Olive' );
push( @module, '##Bundle::Latemp' );
push( @module, '##Bundle::Tie::FormA' );
push( @module, '##Bundle::Search::InvertedIndex' );
push( @module, '##Bundle::OS2_default6' );
push( @module, '##Bundle::Template::Magic' );
push( @module, 'Bundle::Kwiki' );
push( @module, '##Bundle::Slash' );
push( @module, '##Bundle::CPAN' );
push( @module, '##Bundle::LWP' );
push( @module, '##Bundle::Math::Calculus' );
push( @module, '##Bundle::Math::Geometry' );
push( @module, '##Bundle::DataMint' );
push( @module, '##Bundle::Xmms' );
push( @module, '##Bundle::CPANPLUS' );
push( @module, '##Bundle::OS2_default2' );
push( @module, '##Bundle::Math::Symbolic' );
push( @module, '##Bundle::OpenILS' );
push( @module, '##Bundle::ABH' );
push( @module, '##Bundle::PPT' );
push( @module, '##Bundle::Markup' );
push( @module, '##Bundle::DBD::Informix' );
push( @module, '##Bundle::SDK::COG' );
push( @module, 'Bundle::POE::All' );
push( @module, '##Bundle::SNMP::MIB::Compiler' );
push( @module, '##Bundle::CVSMonitor' );
push( @module, '##Bundle::BioPerl' );
push( @module, '##Bundle::SQL::Translator' );
push( @module, '##Bundle::AMBS' );
push( @module, '##Bundle::Business::Shipping::USPS_Online' );
push( @module, '##Bundle::Net::LDAP' );
push( @module, '##Bundle::OS2_default1' );
push( @module, '##Bundle::CUFTS' );
push( @module, '##Bundle::Bricolage' );
push( @module, '##Bundle::Math::Big' );
push( @module, '##Bundle::ePortal' );
push( @module, '##Bundle::DBD::DB2' );
push( @module, '##Bundle::HTML::EP' );
push( @module, '##Bundle::SNMP::Monitor' );
push( @module, '##Bundle::Interchange4' );
push( @module, '##Bundle::Interchange' );
push( @module, '##Bundle::DBD::mSQL' );
push( @module, '##Bundle::CGI::Builder::Complete' );
push( @module, '##Bundle::Combust::Extras' );
push( @module, '##Bundle::Perl6' );
push( @module, '##Bundle::OS2_default1_2' );
push( @module, '##Bundle::SDK::SIMON' );
push( @module, '##Bundle::Net::SXIP::Homesite' );
push( @module, '##Bundle::Net::Nessus' );
push( @module, '##Bundle::Link_Controller' );
push( @module, '##Bundle::Query' );
push( @module, '##Bundle::Tie::DB_File::SplitHash' );
push( @module, '##Bundle::Text::Query::BuildSQL' );
push( @module, '##Bundle::DBD::InterBase' );
push( @module, '##Bundle::ebx' );
push( @module, '##Bundle::Mail::IspMailGate' );
push( @module, '##Bundle::Posy' );
push( @module, '##Bundle::Email' );
push( @module, '##Bundle::Cisco::Conf' );
push( @module, '##Bundle::Mysql' );
push( @module, '##Bundle::IspMailGate' );
push( @module, '##Bundle::SSH' );
push( @module, '##Bundle::MMS::Mail::Parser' );
push( @module, '##Bundle::OS2_default3' );
push( @module, '##Bundle::XML' );
push( @module, '##Bundle::libservlet' );
push( @module, '##Bundle::BDFOY' );
push( @module, '##Bundle::Business::Shipping::UPS_Online' );
push( @module, '##Bundle::GMOD' );
push( @module, '##Bundle::Math::Approx' );
push( @module, '##Bundle::Gnome2' );
push( @module, '##Bundle::Math::Fractal' );
push( @module, '##Bundle::Urchin' );
push( @module, '##Bundle::Business::Shipping::Basic' );
push( @module, '##Bundle::DBD::Yaswi' );
push( @module, '##Bundle::Pipe' );
push( @module, '##Bundle::libnet' );
push( @module, '##Bundle::Math::Random' );
push( @module, '##Bundle::OpenInteract2' );
push( @module, '##Bundle::perlWebSite' );
push( @module, '##Bundle::OpenInteract' );
push( @module, '##Bundle::PerlPoint' );
push( @module, '##Bundle::Zavitan' );
push( @module, '##Bundle::LawMonkey' );
push( @module, '##Bundle::Math::Matrix' );
push( @module, '##Bundle::Math::Statistics' );
push( @module, '##Bundle::Math::Financial' );
push( @module, '##Bundle::Tk_OS2src' );
push( @module, '##Bundle::SPOPS' );
push( @module, '##Bundle::HTTP::WebTest' );
push( @module, '##Bundle::CPANPLUS::Dependencies' );
push( @module, '##Bundle::QuadPres' );
push( @module, '##Bundle::DBD::mysql' );
push( @module, '##Bundle::NiceSleep' );
push( @module, 'Bundle::Cobalt' );
push( @module, '##Bundle::Starlink::Base' );
push( @module, '##Bundle::DBD::CSV' );
push( @module, '##Bundle::Business::Shipping::DataTools' );
push( @module, '##Bundle::Cascade' );
push( @module, '##Bundle::OS2_default5' );
push( @module, '##Bundle::Math' );
push( @module, '##Bundle::DBI' );
push( @module, '##Bundle::WWW::Mechanize::Shell' );
push( @module, '##Bundle::Bonsai' );
push( @module, 'Bundle::WWW::Search::Scraper::Housing' );

fisher_yates_shuffle( \@module );

for ( my $i = 0; $i <= $#module; $i++ )
{
   my $mi = $plus->module_tree( $module[$i] ); $mi->install();

} ## end for

##
## fisher_yates_shuffle - cookbook's inplace array permutation
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

Bundle::Modules::Unstable - All current I<unstable> bundles of modules in CPAN

=head1 SYNOPSIS

perl -MCPAN -e B<'install Bundle::Modules::Unstable'>

cpan B<-i Bundle::Modules::Unstable>

=head1 CONTENTS

Bundle::CPANPLUS

=head1 CHANGES

=over

=item 2006.0510 (YYYY.MMDD)

Initial version of: Bundle::Modules::Unstable-2006.0510

This B<L<Bundle::Modules>> component package is in pre-alpha state with hash ordering.

The ordering of listed modules will eventually be prioritized for efficiency and completeness.

Modules commented out of this module list are either I<unstable> or I<stable> in the B<L<Bundle::Modules>> context.

Optimistically, if there are a lot of the modules commented out, then they are I<stable>, and we're listing I<unstable> context.

Optimistically, if there are a few of the modules commented out, then they are I<unstable>, and we're listing I<stable> context.

If you use the command C<B<man Bundle::Modules::Unstable>>, type C<B</#>> to see the commented out modules as they're higlighted for you by B<man>.

=back

=head1 DESCRIPTION

This Bundle package will install all of the modules listed, if they're not commented out of the B<L<Bundle::Modules>> context.

=head1 SEE ALSO

I<L<Bundle::Modules>>, I<L<Bundle::Modules::CPAN>>, I<L<Bundle::Modules::CPAN::Unstable>>, I<L<Bundle::Modules::Apache>>, I<L<Bundle::Modules::Apache::Unstable>>, I<L<Bundle::Modules::Acme::Everything::Unique>>, I<L<Bundle::Modules::Acme::Everything::Unique::Unstable>>

=head1 AUTHORS

Eric R. Meyers E<lt>ermeyers@adelphia.netE<gt>

=head1 LICENSE for http://www.cpan.org/authors/id/E/ER/ERMEYERS/Bundle-Modules-2006.0521

perl

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=head1 COPYRIGHT

Copyright (C) 2006 by Eric R. Meyers E<lt>ermeyers@adelphia.netE<gt>


