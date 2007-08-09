#############################################################################
##
#W PackageInfo.g            The SCSCP package             Alexander Konovalov
#W                                                               Steve Linton
##
#H $Id$
##
#############################################################################

SetPackageInfo( rec(

PackageName := "SCSCP",
Subtitle := "Symbolic Computation Software Composability Protocol for GAP",
Version := "0.2",
Date := "09/08/2007",
ArchiveURL := "http://www.cs.st-andrews.ac.uk/~alexk",
ArchiveFormats := ".tar.gz .tar.bz2 -win.zip",

#TextFiles := ["init.g", ......],
#BinaryFiles := ["doc/manual.dvi", ......],

Persons := [
  rec(
    LastName      := "Konovalov",
    FirstNames    := "Alexander",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "konovalov@member.ams.org",
    WWWHome       := "http://www.cs.st-andrews.ac.uk/~alexk/",
    PostalAddress := Concatenation( [
                     "School of Computer Science\n",
                     "University of St Andrews\n",
                     "Jack Cole Building, North Haugh,\n",
                     "St Andrews, Fife, KY16 9SX, Scotland" ] ),
    Place         := "St Andrews",
    Institution   := "University of St Andrews"
     ),
  rec(
    LastName      := "Linton",
    FirstNames    := "Steve",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "sal@dcs.st-and.ac.uk",
    WWWHome       := "http://www.cs.st-and.ac.uk/~sal/",
    PostalAddress := Concatenation( [
                     "School of Computer Science\n",
                     "University of St Andrews\n",
                     "Jack Cole Building, North Haugh,\n",
                     "St Andrews, Fife, KY16 9SX, Scotland" ] ),
    Place         := "St Andrews",
    Institution   := "University of St Andrews"
     )
],

Status := "dev",
#CommunicatedBy := "",
#AcceptDate := "",

README_URL := "",
PackageInfoURL := "",
AbstractHTML := "",
PackageWWWHome := "",
                  
PackageDoc := rec(
  BookName := "SCSCP",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile := "doc/manual.pdf",
  SixFile := "doc/manual.six",
  LongTitle := "Symbolic Computation Software Composability Protocol",
  Autoload := false
),

Dependencies := rec(
  GAP := ">=4.4",
  NeededOtherPackages := [ ["GAPDoc", ">= 0.99999"], 
                           ["IO", ">=2.0"],
                           ["openmath", ">=06.03.02"] ],
  SuggestedOtherPackages := [],
  ExternalConditions := []
),

AvailabilityTest := ReturnTrue,
Autoload := false,
#TestFile := "tst/testall.g",

Keywords := [ "symbolic computation" , "OpenMath" ]
));