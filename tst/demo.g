# $Id$
#
# This is a GAP demonstration file
# To run a demonstration enter the following:
# gap> LogTo(); # (if you are logging to a file)
# gap> ReadLib("demo.g");
# gap> Demonstration("demo.g");
# (probably you will need the full path in the last 
# command). Then you may press <Enter> to go to the 
# next step or press <q> to terminate demonstration
#
# -------------------------------------------------
#
port:=26133;
stream:=InputOutputTCPStream( "localhost", port );
ReadLine( stream );
WriteLine( stream, "<OMOBJ><OMI>1</OMI></OMOBJ>");
s:=OMGetObjectWithAttributes( stream );
WriteLine( stream, "<OMOBJ><OMA><OMS cd=\"cascall1\" name=\"procedure_call\"/><OMSTR>WS_factorial</OMSTR><OMI>5</OMI></OMA></OMOBJ>" );
s:=OMGetObjectWithAttributes( stream );
WriteLine( stream, "<OMOBJ><OMATTR><OMATP><OMS cd=\"cascall1\" name=\"call_ID\"/><OMSTR>alexk_9053</OMSTR></OMATP><OMA><OMS cd=\"cascall1\" name=\"procedure_call\" /><OMSTR>WS_factorial</OMSTR><OMI>1713</OMI></OMA></OMATTR></OMOBJ>" );
s:=OMGetObjectWithAttributes( stream );
OMPutProcedureCall ( stream, "WS_factorial", rec( object:= [5] ) );
s:=OMGetObjectWithAttributes( stream );
OMPutProcedureCall ( stream, "WS_factorial", rec( object:=[ 120 ] ) );
s:=OMGetObjectWithAttributes( stream );
OMPutProcedureCall ( stream, "GroupIdentificationService", rec( object:=[ [(1,2),(1,2,3)] ] ) );
s:=OMGetObjectWithAttributes( stream );
OMPutProcedureCall( stream, 
    "WS_factorial", 
    rec( object:= [ 5 ], 
         attributes:=[ [ "call_ID", "user007" ],
                       ["option_runtime",1000],
                       ["option_min_memory",1024],
                       ["option_max_memory",2048],
                       ["option_debuglevel",1],
                       ["option_return_object"] ] ) );;
s:=OMGetObjectWithAttributes( stream );
OMPutProcedureCall( stream, 
    "GroupIdentificationService",
    rec( object:= [ [(2,3,1),(1,2,4,3)] ],
         attributes:=[ [ "call_ID", "user007" ],
                       ["option_runtime",5000],
                       ["option_min_memory",2048],
                       ["option_max_memory",4096],
                       ["option_debuglevel",2],
                       ["option_return_object"] ] ) );;
s:=OMGetObjectWithAttributes( stream );
CloseStream( stream );

Read("idperm.g");
IdGroupWS(SymmetricGroup(3));
IdGroupWS(SymmetricGroup(4));
IdGroupWS(SymmetricGroup(5));
IdGroupWS(SymmetricGroup(6));

EvaluateBySCSCP( "Store", [SymmetricGroup(3)], "localhost", 26133 );
stream:=InputOutputTCPStream("localhost",26133);
ReadLine(stream);
WriteLine(stream, "<OMOBJ><OMA><OMS cd=\"cascall1\" name=\"procedure_call\"/><OMSTR>WS_IdGroup</OMSTR><OMR xref=\"TEMPVarSCSCP\" /></OMA></OMOBJ>\n");
OMGetObjectWithAttributes(stream);
CloseStream(stream);
stream:=InputOutputTCPStream("localhost",26133);
ReadLine(stream);
WriteLine(stream, "<OMOBJ><OMA><OMS cd=\"cascall1\" name=\"procedure_call\"/><OMSTR>Retrieve</OMSTR><OMR xref=\"TEMPVarSCSCP\" /></OMA></OMOBJ>\n");
OMGetObjectWithAttributes(stream);
CloseStream(stream);
ParEvaluateBySCSCP( [ "WS_FactorsECM", "WS_FactorsMPQS" ], [ 2^150+1 ], [ "localhost", "localhost" ], [ 26133, 26134 ] );
ParEvaluateBySCSCP( [ "WS_FactorsECM", "WS_FactorsMPQS" ], [ 2^150+1 ], [ "localhost", "localhost" ], [ 26133, 26134 ] );
ParEvaluateBySCSCP( [ "WS_FactorsECM", "WS_FactorsMPQS" ], [ 2^150+1 ], [ "localhost", "localhost" ], [ 26133, 26134 ] );
ParEvaluateBySCSCP( [ "WS_FactorsECM", "WS_FactorsMPQS" ], [ 2^150+1 ], [ "localhost", "localhost" ], [ 26133, 26134 ] );