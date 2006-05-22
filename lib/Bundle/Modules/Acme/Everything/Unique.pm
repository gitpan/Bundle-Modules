#!/usr/bin/perl -w
##

package Bundle::Modules::Acme::Everything::Unique;

use 5.005;

our $VERSION = 2006.0521; ## (YYYY.MMDD)

##
## Bundle::Modules::Acme::Everything::Unique
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



push( @module, 'Finance::Bank::Commonwealth' );
push( @module, 'Search::Kinosearch' );
push( @module, 'HtDig::Htsearch' );
push( @module, 'SVN::Look' );
push( @module, 'Watchdog::Service' );
push( @module, 'MSSQL::DBlib' );
push( @module, 'WWW::Scrobbler::Stats' );
push( @module, 'WING' );
push( @module, 'Neural' );
push( @module, 'Class::PublicInternal' );
push( @module, 'Plugin::Language::DML' );
push( @module, 'WebService::BabelFish' );
push( @module, 'Proc::times' );
push( @module, 'MIME::IO' );
push( @module, 'Scalar::Footnote' );
push( @module, 'Data::Dumper::HTML' );
push( @module, 'MSDOS::SysCalls' );
push( @module, 'Oracle::OCI' );
push( @module, 'Getopt::EvaP' );
push( @module, 'GD::Gauge' );
push( @module, 'PGP' );
push( @module, 'NexTrieve::Search' );
push( @module, 'Getopt::Gnu' );
push( @module, 'AI::Categorize' );
push( @module, 'Ioctl' );
push( @module, 'UUID' );
push( @module, 'Net::IPP' );
push( @module, 'X11::XRT' );
push( @module, 'Net::DHCP' );
push( @module, 'VMS::User' );
push( @module, 'Perl6::Doc' );
push( @module, 'Gemstone' );
push( @module, 'Devel::Truth_Table' );
push( @module, 'CGI::FormManager' );
push( @module, 'Lingua::FeatureSet' );
push( @module, 'Device::SerialPort::Xmodem' );
push( @module, 'WWW::ShopBot' );
push( @module, 'CGI::CList' );
push( @module, 'Tie::Plural::Scalar' );
push( @module, 'CGI::SimpleCache' );
push( @module, 'MARC' );
push( @module, 'Filesys::mntent' );
push( @module, 'NexTrieve::Mbox' );
push( @module, 'Lemonolap' );
push( @module, 'Bio::Genex' );
push( @module, 'Slash' );
push( @module, 'POE::Session::GladeXML' );
push( @module, 'Math::FresnalZone' );
push( @module, 'Text::Wrap::Hyphenate' );
push( @module, 'HTML::Formulate' );
push( @module, 'ERG' );
push( @module, 'Math::Geometry' );
push( @module, 'Win32::ODBC' );
push( @module, 'ePortal' );
push( @module, 'Archive::Parity' );
push( @module, 'NexTrieve::Hitlist' );
push( @module, 'Fame' );
push( @module, 'NexTrieve' );
push( @module, 'NetCDF' );
push( @module, 'Authorizenet' );
push( @module, 'Term::Size::Heuristic' );
push( @module, 'Parse::Lexer' );
push( @module, 'Pod::MIF' );
push( @module, 'PerlMenu' );
push( @module, 'Exporter::Import' );
push( @module, 'News::Search' );
push( @module, 'HTML::Demoroniser' );
push( @module, 'NexTrieve::Collection' );
push( @module, 'NexTrieve::Querylog' );
push( @module, 'Tk::FlatCheckbox' );
push( @module, 'Lexical::Typeglob' );
push( @module, 'Font::TTF' );
push( @module, 'Python' );
push( @module, 'Proxy::Tk' );
push( @module, 'GSM::SMS' );
push( @module, 'Boulder' );
push( @module, 'File::Size' );
push( @module, 'File::MultiTail' );
push( @module, 'Getopt::Help' );
push( @module, 'Business::OnlinePayment::Moneris' );
push( @module, 'NexTrieve::Docseq' );
push( @module, 'Text::Wigwam' );
push( @module, 'Text::Substitute' );
push( @module, 'Log::Check' );
push( @module, 'Palm::Magellan::NavCompanion' );
push( @module, 'EventServer::Gettimeofday' );
push( @module, 'RFID::Matrics' );
push( @module, 'MMDS' );
push( @module, 'IO::Redirect' );
push( @module, 'MIME::Latin1' );
push( @module, 'MSSQL::Sqllib' );
push( @module, 'Lingua::PT' );
push( @module, 'Win32::FUtils' );
push( @module, 'IPC::UPDmsg' );
push( @module, 'Convert::Lucene' );
push( @module, 'Tree::List2Tree' );
push( @module, 'NexTrieve::Message' );
push( @module, 'Image::Magick::BarChart' );
push( @module, 'WIN32::MSI::SummaryInfo' );
push( @module, 'VMS::Queue' );
push( @module, 'Algorithm::Munkre' );
push( @module, 'WWW::Lyrics' );
push( @module, 'PostScript::Barcode' );
push( @module, 'NexTrieve::Replay' );
push( @module, 'Text::Banner' );
push( @module, 'Tk::Statusbar' );
push( @module, 'LockFile::Scheme' );
push( @module, 'Tie::Array::Huge' );
push( @module, 'XML' );
push( @module, 'DBD::Altera' );
push( @module, 'Python::Err' );
push( @module, 'Openview::Message' );
push( @module, 'AI::NeuralNet' );
push( @module, 'Date:Jalali' );
push( @module, 'Quiz::Question' );
push( @module, 'NexTrieve::PDF' );
push( @module, 'GSS' );
push( @module, 'VMS::Misc' );
push( @module, 'Win32::Pipe' );
push( @module, 'Solaris::PerlGcc' );
push( @module, 'HTML::BarChart' );
push( @module, 'NexTrieve::Resource' );
push( @module, 'SGML::SPGrove' );
push( @module, 'EventServer::Signal' );
push( @module, 'RFID::EPC' );
push( @module, 'AFS::Command' );
push( @module, 'BnP' );
push( @module, 'App::Config' );
push( @module, 'Chart::Gdchart' );
push( @module, 'ex::caution' );
push( @module, 'PixDraw' );
push( @module, 'ControlX10::CM10' );
push( @module, 'Data::FormValidator::Upload' );
push( @module, 'XMLI' );
push( @module, 'Mail::Maildir' );
push( @module, 'DBD::Recall' );
push( @module, 'Crypt::Schnorr::AuthSign' );
push( @module, 'Win32::MSI' );
push( @module, 'IO::Filter' );
push( @module, 'GISI::MIFMID' );
push( @module, 'VMS::Monitor' );
push( @module, 'Protect' );
push( @module, 'HTML::Debug' );
push( @module, 'PostScript::Basic' );
push( @module, 'DBD::FreeTDS' );
push( @module, 'GISI' );
push( @module, 'String::Ruby' );
push( @module, 'Tern::Size::Heuristic' );
push( @module, 'Regexp::Func' );
push( @module, 'Business::OnlinePayment::E2Payments' );
push( @module, 'NexTrieve::Query' );
push( @module, 'PDL::LAPACK' );
push( @module, 'Tree::Menu' );
push( @module, 'PerlPoint::Package' );
push( @module, 'Devel::PerlySense' );
push( @module, 'Watchdog::MysqlService' );
push( @module, 'Tk::DBIx' );
push( @module, 'Text::Bib' );
push( @module, 'VMS::Priv' );
push( @module, 'Win32::Message' );
push( @module, 'Language::VBParser' );
push( @module, 'Win32::IIS:SMTP' );
push( @module, 'File::sudoers' );
push( @module, 'Tk::Multi' );
push( @module, 'Thread::Group' );
push( @module, 'Tie::RndHash' );
push( @module, 'Frontier::RPC' );
push( @module, 'Persistence::Object' );
push( @module, 'PDF::Report::Table' );
push( @module, 'Tk::Olwm' );
push( @module, 'WWW::Mail::Hotmail' );
push( @module, 'Time::JulianDateTime' );
push( @module, 'Oak' );
push( @module, 'Convert::Base' );
push( @module, 'ElectricArc' );
push( @module, 'Fortran::NameList' );
push( @module, 'NexTrieve::RFC822' );
push( @module, 'Cz::Speak' );
push( @module, 'Orac' );
push( @module, 'PDF::PlainLayout' );
push( @module, 'OpenCA' );
push( @module, 'Mail::MH' );
push( @module, 'Class::TOM' );
push( @module, 'CGI::Session::Encrypted' );
push( @module, 'Remedy::AR' );
push( @module, 'BoxBackup' );
push( @module, 'Carp::CheckArgs' );
push( @module, 'Archive::Cabinet' );
push( @module, 'Template::TagParser' );
push( @module, 'Hardware::Simulator' );
push( @module, 'AFS' );
push( @module, 'Time:Compare' );
push( @module, 'File::Data' );
push( @module, 'FileSys::Tree' );
push( @module, 'NexTrieve::MIME' );
push( @module, 'Proc::ExitStatus' );
push( @module, 'SOOP' );
push( @module, 'DBIx::TableAdapter' );
push( @module, 'RPM::Headers' );
push( @module, 'Attribute::Abstract' );
push( @module, 'SVG::Template' );
push( @module, 'Win32::Perfmon' );
push( @module, 'CGI::Query' );
push( @module, 'MOP' );
push( @module, 'Proc::PID::File::Fcntl' );
push( @module, 'SQL::QueryBroker' );
push( @module, 'RFID::Alien' );
push( @module, 'Devel::Trampoline' );
push( @module, 'DBD::SQLrelay' );
push( @module, 'WWW::Webjay' );
push( @module, 'SQL::Builder' );
push( @module, 'Chart::Pie3d' );
push( @module, 'HTML::Info' );
push( @module, 'Net::ICAP' );
push( @module, 'Widget::FixedWidthFont::Input' );
push( @module, 'GD::Barcode::Code93' );
push( @module, 'Exporter::PkgAlias' );
push( @module, 'Tk::SignOnDialog' );
push( @module, 'CGI::DBTables' );
push( @module, 'CGI::Request' );
push( @module, 'GISI::SHAPE' );
push( @module, 'Smirch' );
push( @module, 'Finance::Bank::DE::SpardaBank' );
push( @module, 'Games::Go::GoPair' );
push( @module, 'Lemonldap::Portal' );
push( @module, 'CfgTie' );
push( @module, 'Bio::SAGE' );
push( @module, 'Finance::Shares::MySQL' );
push( @module, 'NexTrieve::Targz' );
push( @module, 'Text::Parser' );
push( @module, 'Synergy' );
push( @module, 'FameHLI' );
push( @module, 'Bio::Affymetrix' );
push( @module, 'Win32::GUID' );
push( @module, 'Tk::ReportBox' );
push( @module, 'CORBA::Python' );
push( @module, 'Data::Stash' );
push( @module, 'HPUX::Ioscan' );
push( @module, 'Astro::SkyCoords' );
push( @module, 'Math::BigIntFast' );
push( @module, 'Class::Flyweight' );
push( @module, 'Bleach' );
push( @module, 'NexTrieve::UTF8' );
push( @module, 'Interface::Param' );
push( @module, 'Chatbot::RiveScript' );
push( @module, 'W3C::LinkChecker' );
push( @module, 'HTML::Widgets::DateEntry' );
push( @module, 'Mobile::WURFL' );
push( @module, 'DBIx::SchemaView' );
push( @module, 'WWW::TVguide::NL' );
push( @module, 'Sys::Sysconf' );
push( @module, 'Filesys::statfs' );
push( @module, 'File::ManualFlock' );
push( @module, 'SMIMEUtil' );
push( @module, 'NexTrieve::Overview' );
push( @module, 'Class::Holon' );
push( @module, 'WWW::Lunarstorm' );
push( @module, 'CMS::Mediawiki' );
push( @module, 'VMS::System' );
push( @module, 'Physics::Solar::VSO' );
push( @module, 'VMS::smg' );
push( @module, 'Math::Interpolate' );
push( @module, 'Crypt::OpenSSL::BN' );
push( @module, 'Class::Eroot' );
push( @module, 'Getopt::Long::File' );
push( @module, 'DBD::RDB' );
push( @module, 'NexTrieve::Hitlist::Hit' );
push( @module, 'Parse::YALALR' );
push( @module, 'NexTrieve::Collection::Index' );
push( @module, 'Splash::DB' );
push( @module, 'DBA::Backup' );
push( @module, 'NexTrieve::Daemon' );
push( @module, 'Glade' );
push( @module, 'PDL::IO::HDF5' );
push( @module, 'CGI::MiniSvr' );
push( @module, 'Ratpoison' );
push( @module, 'RT' );
push( @module, 'Linksys::Config' );
push( @module, 'SICStus' );
push( @module, 'xDash' );
push( @module, 'VMS::Process' );
push( @module, 'Mail::vpopmaild' );
push( @module, 'WWW::Search::Excite' );
push( @module, 'File::Atomic' );
push( @module, 'Business::Payroll::AU::PAYG' );
push( @module, 'VMS::ICC' );
push( @module, 'Lingua::EN::Cardinal' );
push( @module, 'SQL::Routine' );
push( @module, 'Win32::FileType' );
push( @module, 'Image::ASCII' );
push( @module, 'Net::Mac::Vendor' );
push( @module, 'JUNOS' );
push( @module, 'CGI::Base' );
push( @module, 'RFID::Base' );
push( @module, 'DBD::Google' );
push( @module, 'Config::Ini' );
push( @module, 'Unix::UserAdmin' );
push( @module, 'IPC::Shm::Simple' );
push( @module, 'Tk::PhotoRotate' );
push( @module, 'Fax::DataFax' );
push( @module, 'DBIx::XMLMEssage' );
push( @module, 'Module::MakeDist' );
push( @module, 'Tk::Autoscroll' );
push( @module, 'PDL::Slatec' );
push( @module, 'ToolTalk' );
push( @module, 'Text::Stem' );
push( @module, 'Find::File::Object' );
push( @module, 'VMS::Fileutils::Root' );
push( @module, 'Clips' );
push( @module, 'Tie::Mem' );
push( @module, 'Archive::Tar::Stream' );
push( @module, 'PDA::Pilot' );
push( @module, 'Test::Litmus' );
push( @module, 'Math::Matrix::SVD' );
push( @module, 'Win32::AdminMisc' );
push( @module, 'CGI::WebApp' );
push( @module, 'HTML::Stripper' );
push( @module, 'HtDig' );
push( @module, 'SIL::Shoe' );
push( @module, 'Mac::Spotlight' );
push( @module, 'DBA::Backup::mysql' );
push( @module, 'Watchdog::HTTPService' );
push( @module, 'WWW::Search::Magellan' );
push( @module, 'Tk::ImageButton' );
push( @module, 'Event::tcp' );
push( @module, 'Crypt::ElGamal' );
push( @module, 'Filesys::dfent' );
push( @module, 'Lingua::EN::Ordinal' );
push( @module, 'Crypt::Camellia' );
push( @module, 'Logfile' );
push( @module, 'Tie::Assert' );
push( @module, 'Business::OnlinePayment::Cybersource' );
push( @module, 'Mail::DSN' );
push( @module, 'Religion::Package' );
push( @module, 'DCE::RPC' );
push( @module, 'CORBA::XPIDL' );
push( @module, 'Finance::Shares::Chart' );
push( @module, 'Geo::Projection' );
push( @module, 'CGI::FormFactory' );
push( @module, 'Array::Reform' );
push( @module, 'POE::Component::MPG123' );
push( @module, 'Tie::WarnGlobal' );
push( @module, 'TeX::Convert::Image' );
push( @module, 'NexTrieve::Index' );
push( @module, 'VMS::Persona' );
push( @module, 'Datascope' );
push( @module, 'NexTrieve::Document' );
push( @module, 'Verilog::GetInfo' );
push( @module, 'Mail::Vacation::LDAP' );
push( @module, 'NexTrieve::DBI' );
push( @module, 'EventServer::Functions' );
push( @module, 'PDL::NetCDF' );
push( @module, 'RTF::Generator' );
push( @module, 'XML::Validator::RelaxNG' );
push( @module, 'Gtk::Dialog' );
push( @module, 'NexTrieve::HTML' );
push( @module, 'Devel::DebugAPI' );
push( @module, 'Net::USPS' );
push( @module, 'Win32::GD' );
push( @module, 'VMS::Fileutils::SafeName' );
push( @module, 'BizTalk' );
push( @module, 'Mail::Vacation' );
push( @module, 'Tie::PerfectHash' );
push( @module, 'Sort::PolySort' );
push( @module, 'Sparky' );
push( @module, 'PHP::MySQL_Session' );
push( @module, 'X11::Toolkit' );
push( @module, 'ReleaseAction' );
push( @module, 'Math::Nocarry' );
push( @module, 'Math::SimpleInterest' );
push( @module, 'Zeta' );
push( @module, 'CGI::BasePlus' );
push( @module, 'Mac::Serial' );
push( @module, 'X11::Xforms' );
push( @module, 'Object::Info' );
push( @module, 'Exporter::Options' );
push( @module, 'Concurrent' );
push( @module, 'VMS::Device' );
push( @module, 'Mono' );

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

Bundle::Modules::Acme::Everything::Unique - All current I<stable> and unique bundles in Bundles::Everything

=head1 SYNOPSIS

perl -MCPAN -e B<'install Bundle::Modules::Acme::Everything::Unique'>

cpan B<-i Bundle::Modules::Acme::Everything::Unique>

=head1 CONTENTS

Bundle::CPANPLUS

=head1 CHANGES

=over

=item 2006.0510 (YYYY.MMDD)

Initial version of: Bundle::Modules::Acme::Everything::Unique-2006.0510

This B<L<Bundle::Modules>> component package is in pre-alpha state with hash ordering.

The ordering of listed modules will eventually be prioritized for efficiency and completeness.

Modules commented out of this module list are either I<unstable> or I<stable> in the B<L<Bundle::Modules>> context.

Optimistically, if there are a lot of the modules commented out, then they are I<stable>, and we're listing I<unstable> context.

Optimistically, if there are a few of the modules commented out, then they are I<unstable>, and we're listing I<stable> context.

If you use the command C<B<man Bundle::Modules::Acme::Everything::Unique>>, type C<B</#>> to see the commented out modules as they're higlighted for you by B<man>.

=back

=head1 DESCRIPTION

This Bundle package will install all of the modules listed, if they're not commented out of the B<L<Bundle::Modules>> context.

=head1 SEE ALSO

I<L<Bundle::Modules>>, I<L<Bundle::Modules::Unstable>>, I<L<Bundle::Modules::CPAN>>, I<L<Bundle::Modules::CPAN::Unstable>>, I<L<Bundle::Modules::Apache>>, I<L<Bundle::Modules::Apache::Unstable>>, I<L<Bundle::Modules::Acme::Everything::Unique::Unstable>>

=head1 AUTHORS

Eric R. Meyers E<lt>ermeyers@adelphia.netE<gt>

=head1 LICENSE for http://www.cpan.org/authors/id/E/ER/ERMEYERS/Bundle-Modules-2006.0521

perl

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=head1 COPYRIGHT

Copyright (C) 2006 by Eric R. Meyers E<lt>ermeyers@adelphia.netE<gt>


