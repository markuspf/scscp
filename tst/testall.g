# $Id$
LoadPackage( "scscp" );
scscpdir := DirectoriesPackageLibrary( "scscp", "" );
Print("Looking for SCSCP server already running at port 26133 ... \n");
scscprunning := PingSCSCPservice( "localhost", 26133 );
if scscprunning = fail then
    Exec( Filename( scscpdir, "gapd.sh" ) );
    for i in [1..10] do
        Exec("sleep 15");
        if PingSCSCPservice( "localhost", 26133) <> fail then
            break;
        else
            Print("Waiting for the SCSCP server to be ready to accept incoming connections ... \n");
        fi;    
    od;
else
    Print("There is an SCSCP server already running at port 26133 \n");
fi;        
ReadTest( Filename( scscpdir, "tst/scscp.tst" ) );
