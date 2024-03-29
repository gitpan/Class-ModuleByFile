package Class::ModuleByFile; ## Can read the module name from file

use 5.006; 
use strict;
use FileHandle;
use vars qw(@ISA @EXPORT %EXPORT_TAGS $VERSION);

our $VERSION = '0.01';

use Exporter;

@ISA = qw(Exporter);

%EXPORT_TAGS = ( all => [qw( 
                                get_name
                                get_module_by_file
                         )] );

Exporter::export_ok_tags('all'); 

# You can use that class to get the module name (package) by filename.
# It reads the file and returns the package entry.
#
#
# SYNOPSIS
# ========
# 
#  use Class::ModuleByFile;
#  print Class::ModuleByFile::get_name('/tmp/Local/Bar.pm');
#  # may print 'Local::Bar'
#
#  use Class::ModuleByFile 'get_module_by_file';
#  # imports the function get_module_by_file()
#  # to use it directly.
#
# LICENSE
# =======   
# You can redistribute it and/or modify it under the conditions of LGPL.
# 
# AUTHOR
# ======
# Andreas Hernitscheck  ahernit(AT)cpan.org







# Returns the modulename for the given file.
# It reads the text of the file and returns
# the package entry
sub get_name { # $modulename ($filename)
  my $file = shift or die 'requires filename';

  if (!-e $file){die "file $file does not exist"};

  my $fh = FileHandle->new($file, "r");
  if (defined $fh) {
    while (my $line = <$fh>){

      if ( $line=~ m/\s*package\s+([^ ;]+)/ ){
        return $1;
      }
    }

    $fh->close();
  }
   

}

# alias for get_name()
sub get_module_by_file {
  return get_name(@_);
}



1;

#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME

Class::ModuleByFile - Can read the module name from file


=head1 SYNOPSIS


 use Class::ModuleByFile;
 print Class::ModuleByFile::get_name('/tmp/Local/Bar.pm');
 # may print 'Local::Bar'

 use Class::ModuleByFile 'get_module_by_file';
 # imports the function get_module_by_file()
 # to use it directly.



=head1 DESCRIPTION

You can use that class to get the module name (package) by filename.
It reads the file and returns the package entry.




=head1 REQUIRES

L<Exporter> 

L<FileHandle> 

L<5.006> 


=head1 METHODS

=head2 get_module_by_file

 get_module_by_file();

alias for get_name()


=head2 get_name

 my $modulename = get_name($filename);

Returns the modulename for the given file.
It reads the text of the file and returns
the package entry



=head1 AUTHOR

Andreas Hernitscheck  ahernit(AT)cpan.org


=head1 LICENSE

You can redistribute it and/or modify it under the conditions of LGPL.



=cut

