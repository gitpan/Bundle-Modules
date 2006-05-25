#!/usr/bin/perl -w
##

package Bundle::Modules::Acme::Everything::Unique::Unstable;

use 5.005;

our $VERSION = 2006.0524; ## (YYYY.MMDD)

##
## Bundle::Modules::Acme::Everything::Unique::Unstable
##

package main;

use strict;

use warnings;

use CPANPLUS::Backend;

use Bundle::Modules::Test::Reporter;

my $plus = CPANPLUS::Backend->new( 'conf' => { 'no_update'  => 1,
                                                 'allow_build_interactivity' => 0,
                                                 'cpantest' => 0,
                                                 'verbose' => 1,
                                               } );

my $conf = $plus->configure_object();

$conf->set_conf( 'force' => 0 );

$conf->set_conf( 'timeout' => 1 );

if ( defined( $ENV{'TEST_POD'} ) && ( $ENV{'TEST_POD'} == 1 ) )
{

}
else
{
   $plus->reload_indices( 'update_source' => 1, 'verbose' => 1 );

} ## end if

my $reporter = Bundle::Modules::Test::Reporter->new(
   'grade' => 'unstable',
   'distribution' => 'TBD',
   'from' => '<ermeyers@adelphia.net> (Bundle::Modules::Acme::Everything::Unique::Unstable)',
   'comments' => 'Generated by Bundle::Modules::Acme::Everything::Unique::Unstable.',
   'via' => 'Bundle::Modules::Acme::Everything::Unique::Unstable 2006.0524'

   );

my @module = ();



push( @module, '##SQL::Routine' );
push( @module, '##Array::Reform' );
push( @module, '##VMS::ICC' );
push( @module, '##NexTrieve::Index' );
push( @module, '##HtDig::Htsearch' );
push( @module, '##DBA::Backup' );
push( @module, '##POE::Component::MPG123' );
push( @module, '##News::Search' );
push( @module, '##Parse::YALALR' );
push( @module, '##Log::Check' );
push( @module, '##Carp::CheckArgs' );
push( @module, '##Config::Ini' );
push( @module, '##Business::OnlinePayment::E2Payments' );
push( @module, '##VMS::Device' );
push( @module, '##DBD::RDB' );
push( @module, '##VMS::Priv' );
push( @module, '##RFID::EPC' );
push( @module, '##Religion::Package' );
push( @module, '##NexTrieve::Querylog' );
push( @module, '##Astro::SkyCoords' );
push( @module, '##TeX::Convert::Image' );
push( @module, '##Date:Jalali' );
push( @module, '##Sparky' );
push( @module, '##RT' );
push( @module, '##DBD::Recall' );
push( @module, '##LockFile::Scheme' );
push( @module, '##GISI' );
push( @module, '##WWW::Mail::Hotmail' );
push( @module, '##Getopt::EvaP' );
push( @module, '##Tie::RndHash' );
push( @module, '##Ratpoison' );
push( @module, '##SIL::Shoe' );
push( @module, '##PDA::Pilot' );
push( @module, '##Data::FormValidator::Upload' );
push( @module, '##Mono' );
push( @module, '##DCE::RPC' );
push( @module, '##Fame' );
push( @module, '##Win32::FileType' );
push( @module, '##File::sudoers' );
push( @module, '##HTML::Widgets::DateEntry' );
push( @module, '##Lingua::EN::Cardinal' );
push( @module, '##ControlX10::CM10' );
push( @module, '##Sys::Sysconf' );
push( @module, '##Text::Wrap::Hyphenate' );
push( @module, '##Lemonolap' );
push( @module, '##Solaris::PerlGcc' );
push( @module, '##Win32::GUID' );
push( @module, '##Win32::AdminMisc' );
push( @module, '##Text::Substitute' );
push( @module, '##PostScript::Basic' );
push( @module, '##CORBA::XPIDL' );
push( @module, '##Archive::Cabinet' );
push( @module, '##Oak' );
push( @module, '##VMS::Queue' );
push( @module, '##Filesys::mntent' );
push( @module, '##CGI::SimpleCache' );
push( @module, '##ReleaseAction' );
push( @module, '##GISI::MIFMID' );
push( @module, '##VMS::smg' );
push( @module, '##VMS::System' );
push( @module, '##MIME::IO' );
push( @module, '##Finance::Shares::MySQL' );
push( @module, '##MOP' );
push( @module, '##Object::Info' );
push( @module, '##SGML::SPGrove' );
push( @module, '##Tie::PerfectHash' );
push( @module, '##BizTalk' );
push( @module, '##Tk::DBIx' );
push( @module, '##IPC::UPDmsg' );
push( @module, '##Devel::PerlySense' );
push( @module, '##Boulder' );
push( @module, '##PDL::NetCDF' );
push( @module, '##W3C::LinkChecker' );
push( @module, '##Class::Flyweight' );
push( @module, '##Concurrent' );
push( @module, '##Test::Litmus' );
push( @module, '##ERG' );
push( @module, '##UUID' );
push( @module, '##Tk::ReportBox' );
push( @module, '##Tk::Autoscroll' );
push( @module, '##File::Data' );
push( @module, '##X11::Xforms' );
push( @module, '##Linksys::Config' );
push( @module, '##Find::File::Object' );
push( @module, '##Glade' );
push( @module, '##NexTrieve::Resource' );
push( @module, '##Device::SerialPort::Xmodem' );
push( @module, '##MMDS' );
push( @module, '##Exporter::PkgAlias' );
push( @module, '##Net::IPP' );
push( @module, '##Term::Size::Heuristic' );
push( @module, '##IPC::Shm::Simple' );
push( @module, '##NexTrieve::Query' );
push( @module, '##HTML::BarChart' );
push( @module, '##GSM::SMS' );
push( @module, '##App::Config' );
push( @module, '##Tk::Statusbar' );
push( @module, '##NexTrieve::Document' );
push( @module, '##Lexical::Typeglob' );
push( @module, '##JUNOS' );
push( @module, '##NexTrieve::HTML' );
push( @module, '##Math::Matrix::SVD' );
push( @module, '##Search::Kinosearch' );
push( @module, '##Cz::Speak' );
push( @module, '##CfgTie' );
push( @module, '##Tie::Assert' );
push( @module, '##Language::VBParser' );
push( @module, '##Chart::Pie3d' );
push( @module, '##DBD::Google' );
push( @module, '##Finance::Shares::Chart' );
push( @module, '##Exporter::Import' );
push( @module, '##PDF::PlainLayout' );
push( @module, '##NexTrieve::DBI' );
push( @module, '##PostScript::Barcode' );
push( @module, '##Interface::Param' );
push( @module, '##Archive::Parity' );
push( @module, '##NexTrieve::Docseq' );
push( @module, '##Image::ASCII' );
push( @module, '##BoxBackup' );
push( @module, '##WebService::BabelFish' );
push( @module, '##SVN::Look' );
push( @module, '##PerlMenu' );
push( @module, '##Mac::Spotlight' );
push( @module, '##Plugin::Language::DML' );
push( @module, '##CORBA::Python' );
push( @module, '##Font::TTF' );
push( @module, '##NexTrieve::PDF' );
push( @module, '##Data::Dumper::HTML' );
push( @module, '##Net::USPS' );
push( @module, '##Mobile::WURFL' );
push( @module, '##X11::Toolkit' );
push( @module, '##AFS' );
push( @module, '##File::ManualFlock' );
push( @module, '##Games::Go::GoPair' );
push( @module, '##Getopt::Long::File' );
push( @module, '##Mail::MH' );
push( @module, '##Algorithm::Munkre' );
push( @module, '##CGI::Query' );
push( @module, '##HtDig' );
push( @module, '##Class::Eroot' );
push( @module, '##Tk::SignOnDialog' );
push( @module, '##NexTrieve::Collection::Index' );
push( @module, '##VMS::Persona' );
push( @module, '##CGI::Base' );
push( @module, '##Math::Geometry' );
push( @module, '##PDF::Report::Table' );
push( @module, '##Math::FresnalZone' );
push( @module, '##Fax::DataFax' );
push( @module, '##Text::Parser' );
push( @module, '##Math::Nocarry' );
push( @module, '##Palm::Magellan::NavCompanion' );
push( @module, '##Convert::Lucene' );
push( @module, '##CGI::WebApp' );
push( @module, '##NexTrieve' );
push( @module, '##Mail::DSN' );
push( @module, '##HPUX::Ioscan' );
push( @module, '##ex::caution' );
push( @module, '##Mail::vpopmaild' );
push( @module, '##GISI::SHAPE' );
push( @module, '##AFS::Command' );
push( @module, '##Regexp::Func' );
push( @module, '##Authorizenet' );
push( @module, '##Filesys::dfent' );
push( @module, '##Lingua::PT' );
push( @module, '##Lingua::FeatureSet' );
push( @module, '##CGI::Session::Encrypted' );
push( @module, '##Tk::Multi' );
push( @module, '##Net::DHCP' );
push( @module, '##RFID::Matrics' );
push( @module, '##NexTrieve::Hitlist' );
push( @module, '##VMS::Process' );
push( @module, '##Mail::Vacation' );
push( @module, '##Python::Err' );
push( @module, '##HTML::Formulate' );
push( @module, '##Tk::Olwm' );
push( @module, '##RFID::Base' );
push( @module, '##WWW::Scrobbler::Stats' );
push( @module, '##Tree::List2Tree' );
push( @module, '##Proxy::Tk' );
push( @module, '##WWW::Search::Magellan' );
push( @module, '##ePortal' );
push( @module, '##Thread::Group' );
push( @module, '##String::Ruby' );
push( @module, '##Gemstone' );
push( @module, '##Tie::Plural::Scalar' );
push( @module, '##Bleach' );
push( @module, '##Bio::SAGE' );
push( @module, '##MSSQL::DBlib' );
push( @module, '##Datascope' );
push( @module, '##OpenCA' );
push( @module, '##Time::JulianDateTime' );
push( @module, '##BnP' );
push( @module, '##Net::ICAP' );
push( @module, '##Lingua::EN::Ordinal' );
push( @module, '##Geo::Projection' );
push( @module, '##GSS' );
push( @module, '##Tk::ImageButton' );
push( @module, '##Fortran::NameList' );
push( @module, '##Tk::FlatCheckbox' );
push( @module, '##SOOP' );
push( @module, '##Net::Mac::Vendor' );
push( @module, '##VMS::Fileutils::Root' );
push( @module, '##SICStus' );
push( @module, '##PerlPoint::Package' );
push( @module, '##NexTrieve::RFC822' );
push( @module, '##Win32::ODBC' );
push( @module, '##NexTrieve::Hitlist::Hit' );
push( @module, '##RFID::Alien' );
push( @module, '##DBD::Altera' );
push( @module, '##DBD::FreeTDS' );
push( @module, '##NexTrieve::Targz' );
push( @module, '##Hardware::Simulator' );
push( @module, '##Win32::Perfmon' );
push( @module, '##Tie::Mem' );
push( @module, '##Attribute::Abstract' );
push( @module, '##HTML::Info' );
push( @module, '##Pod::MIF' );
push( @module, '##Verilog::GetInfo' );
push( @module, '##HTML::Stripper' );
push( @module, '##Orac' );
push( @module, '##Win32::FUtils' );
push( @module, '##Tern::Size::Heuristic' );
push( @module, '##WING' );
push( @module, '##Business::Payroll::AU::PAYG' );
push( @module, '##Protect' );
push( @module, '##Win32::IIS:SMTP' );
push( @module, '##SMIMEUtil' );
push( @module, '##Openview::Message' );
push( @module, '##XML' );
push( @module, '##Proc::times' );
push( @module, '##Text::Banner' );
push( @module, '##PDL::IO::HDF5' );
push( @module, '##Class::PublicInternal' );
push( @module, '##XMLI' );
push( @module, '##AI::Categorize' );
push( @module, '##NexTrieve::Mbox' );
push( @module, '##Smirch' );
push( @module, '##Proc::PID::File::Fcntl' );
push( @module, '##Filesys::statfs' );
push( @module, '##NexTrieve::Collection' );
push( @module, '##Mac::Serial' );
push( @module, '##RTF::Generator' );
push( @module, '##PixDraw' );
push( @module, '##xDash' );
push( @module, '##Tk::PhotoRotate' );
push( @module, '##WIN32::MSI::SummaryInfo' );
push( @module, '##Win32::GD' );
push( @module, '##ToolTalk' );
push( @module, '##SQL::Builder' );
push( @module, '##Bio::Affymetrix' );
push( @module, '##CGI::FormManager' );
push( @module, '##Sort::PolySort' );
push( @module, '##MSSQL::Sqllib' );
push( @module, '##VMS::Monitor' );
push( @module, '##Tree::Menu' );
push( @module, '##MARC' );
push( @module, '##Oracle::OCI' );
push( @module, '##PDL::LAPACK' );
push( @module, '##Proc::ExitStatus' );
push( @module, '##DBIx::TableAdapter' );
push( @module, '##GD::Barcode::Code93' );
push( @module, '##WWW::Lyrics' );
push( @module, '##Business::OnlinePayment::Cybersource' );
push( @module, '##Devel::Trampoline' );
push( @module, '##Logfile' );
push( @module, '##Mail::Maildir' );
push( @module, '##POE::Session::GladeXML' );
push( @module, '##Template::TagParser' );
push( @module, '##SVG::Template' );
push( @module, '##FileSys::Tree' );
push( @module, '##Ioctl' );
push( @module, '##Neural' );
push( @module, '##Synergy' );
push( @module, '##Text::Wigwam' );
push( @module, '##VMS::Fileutils::SafeName' );
push( @module, '##MSDOS::SysCalls' );
push( @module, '##Tie::WarnGlobal' );
push( @module, '##VMS::Misc' );
push( @module, '##Unix::UserAdmin' );
push( @module, '##Time:Compare' );
push( @module, '##Finance::Bank::Commonwealth' );
push( @module, '##Watchdog::HTTPService' );
push( @module, '##Chart::Gdchart' );
push( @module, '##File::Size' );
push( @module, '##Math::BigIntFast' );
push( @module, '##Text::Stem' );
push( @module, '##Crypt::Schnorr::AuthSign' );
push( @module, '##WWW::TVguide::NL' );
push( @module, '##Convert::Base' );
push( @module, '##Image::Magick::BarChart' );
push( @module, '##DBD::SQLrelay' );
push( @module, '##NexTrieve::Daemon' );
push( @module, '##EventServer::Signal' );
push( @module, '##Exporter::Options' );
push( @module, '##EventServer::Functions' );
push( @module, '##CGI::FormFactory' );
push( @module, '##Win32::Pipe' );
push( @module, '##CGI::Request' );
push( @module, '##GD::Gauge' );
push( @module, '##Persistence::Object' );
push( @module, '##HTML::Demoroniser' );
push( @module, '##ElectricArc' );
push( @module, '##IO::Redirect' );
push( @module, '##Watchdog::Service' );
push( @module, '##XML::Validator::RelaxNG' );
push( @module, '##Parse::Lexer' );
push( @module, '##NetCDF' );
push( @module, '##Data::Stash' );
push( @module, '##Class::Holon' );
push( @module, '##SQL::QueryBroker' );
push( @module, '##NexTrieve::Overview' );
push( @module, '##Zeta' );
push( @module, '##Win32::Message' );
push( @module, '##CMS::Mediawiki' );
push( @module, '##MIME::Latin1' );
push( @module, '##WWW::Lunarstorm' );
push( @module, '##Text::Bib' );
push( @module, '##DBIx::XMLMEssage' );
push( @module, '##Tie::Array::Huge' );
push( @module, '##PHP::MySQL_Session' );
push( @module, '##Math::SimpleInterest' );
push( @module, '##PDL::Slatec' );
push( @module, '##WWW::ShopBot' );
push( @module, '##HTML::Debug' );
push( @module, '##Crypt::OpenSSL::BN' );
push( @module, '##X11::XRT' );
push( @module, '##Finance::Bank::DE::SpardaBank' );
push( @module, '##Python' );
push( @module, '##NexTrieve::Replay' );
push( @module, '##NexTrieve::Search' );
push( @module, '##CGI::BasePlus' );
push( @module, '##NexTrieve::Message' );
push( @module, '##CGI::MiniSvr' );
push( @module, '##Frontier::RPC' );
push( @module, '##Win32::MSI' );
push( @module, '##Lemonldap::Portal' );
push( @module, '##Perl6::Doc' );
push( @module, '##PGP' );
push( @module, '##CGI::DBTables' );
push( @module, '##NexTrieve::MIME' );
push( @module, '##CGI::CList' );
push( @module, '##Physics::Solar::VSO' );
push( @module, '##Class::TOM' );
push( @module, '##FameHLI' );
push( @module, '##Mail::Vacation::LDAP' );
push( @module, '##WWW::Search::Excite' );
push( @module, '##VMS::User' );
push( @module, '##Business::OnlinePayment::Moneris' );
push( @module, '##Clips' );
push( @module, '##Bio::Genex' );
push( @module, '##AI::NeuralNet' );
push( @module, '##Getopt::Help' );
push( @module, '##Chatbot::RiveScript' );
push( @module, '##Gtk::Dialog' );
push( @module, '##Getopt::Gnu' );
push( @module, '##DBA::Backup::mysql' );
push( @module, '##Splash::DB' );
push( @module, '##Math::Interpolate' );
push( @module, '##Watchdog::MysqlService' );
push( @module, '##Remedy::AR' );
push( @module, '##File::MultiTail' );
push( @module, '##RPM::Headers' );
push( @module, '##Devel::DebugAPI' );
push( @module, '##File::Atomic' );
push( @module, '##Quiz::Question' );
push( @module, '##Scalar::Footnote' );
push( @module, '##Slash' );
push( @module, '##Crypt::Camellia' );
push( @module, '##WWW::Webjay' );
push( @module, '##Archive::Tar::Stream' );
push( @module, '##IO::Filter' );
push( @module, '##EventServer::Gettimeofday' );
push( @module, '##Devel::Truth_Table' );
push( @module, '##Widget::FixedWidthFont::Input' );
push( @module, '##Module::MakeDist' );
push( @module, '##Event::tcp' );
push( @module, '##NexTrieve::UTF8' );
push( @module, '##DBIx::SchemaView' );
push( @module, '##Crypt::ElGamal' );

fisher_yates_shuffle( \@module );

for ( my $i = 0; $i <= $#module; $i++ )
{
   my $mi = $plus->module_tree( $module[$i] );

   my $mid = $mi->package_name() . '-' . $mi->package_version();

   $mi->install();

   my $mist = $mi->status();

   $reporter->distribution( $mid );

   if ( $mist->installed() )
   {
      printf( "##\n## Says %s is installed, so send stable message.\n##\n", $mid );

      printf( "##\n## SIGNATURE CHECK=%d\n##\n",
              ( $mist->signature() && $mist->checksum_ok() && -f $mist->extract().'/SIGNATURE' ) || ! $mist->created(),
            );

      $reporter->grade( 'stable' );

   }
   else
   {
      printf( "##\n## Says %s failed to install, so send unstable message.\n##\n", $mi->name() );

      $reporter->grade( 'unstable' );

   } ## end if

   $reporter->send() || die $reporter->errstr();

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

Bundle::Modules::Acme::Everything::Unique::Unstable - All current I<unstable> and unique bundles in Bundles::Everything

=head1 SYNOPSIS

perl -MCPAN -e B<'install Bundle::Modules::Acme::Everything::Unique::Unstable'>

cpan B<-i Bundle::Modules::Acme::Everything::Unique::Unstable>

perl -MBundle::Modules::Acme::Everything::Unique::Unstable

=head1 CONTENTS

Bundle::CPANPLUS

=head1 CHANGES

=over

=item 2006.0510 (YYYY.MMDD)

Initial version of: Bundle::Modules::Acme::Everything::Unique::Unstable-2006.0510

This B<L<Bundle::Modules>> component package is in pre-alpha state with hash ordering.

The ordering of listed modules will eventually be prioritized for efficiency and completeness.

Modules commented out of this module list are either I<unstable> or I<stable> in the B<L<Bundle::Modules>> context.

Optimistically, if there are a lot of the modules commented out, then they are I<stable>, and we're listing I<unstable> context.

Optimistically, if there are a few of the modules commented out, then they are I<unstable>, and we're listing I<stable> context.

If you use the command C<B<man Bundle::Modules::Acme::Everything::Unique::Unstable>>, type C<B</#>> to see the commented out modules as they're higlighted for you by B<man>.

=item 2006.0520

This contains a newly refined concept of: Bundle::Modules::Acme::Everything::Unique::Unstable-2006.0520

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

I<L<Bundle::Modules>>, I<L<Bundle::Modules::Unstable>>, I<L<Bundle::Modules::CPAN>>, I<L<Bundle::Modules::CPAN::Unstable>>, I<L<Bundle::Modules::Apache>>, I<L<Bundle::Modules::Apache::Unstable>>, I<L<Bundle::Modules::Acme::Everything::Unique>>

=head1 AUTHORS

Eric R. Meyers E<lt>ermeyers@adelphia.netE<gt>

=head1 LICENSE for http://www.cpan.org/authors/id/E/ER/ERMEYERS/Bundle-Modules-2006.0524

perl

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=head1 COPYRIGHT

Copyright (C) 2006 by Eric R. Meyers E<lt>ermeyers@adelphia.netE<gt>


