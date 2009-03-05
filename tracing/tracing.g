SCSCP_TRACE_FILE          := 0;
SCSCP_TRACE_MACHINE_ID    := "0";
SCSCP_TRACE_PROCESS_COUNT :=0;
SCSCP_TRACE_THREAD_COUNT  :=0;
SCSCP_RESTORE_INFO_LEVEL  :=0;

SCSCPTraceStartTracing := function()
local t;
t := IO_gettimeofday();
PrintTo( SCSCP_TRACE_FILE, 
	Concatenation( "\"Start Tracing\"{[2]{0,0},", String(t.tv_sec), ".", String(t.tv_usec), ", 137, ", 
	SCSCP_TRACE_MACHINE_ID, "};;\n" ) );
end;

SCSCPTraceEndTracing := function()
local t;
t := IO_gettimeofday();
AppendTo( SCSCP_TRACE_FILE, 
	Concatenation( "\"End Tracing\"{[2]{0,0},", String(t.tv_sec), ".", String(t.tv_usec), ", 145, ", 
	SCSCP_TRACE_MACHINE_ID, "};;\n" ) );
end;

SCSCPTraceNewProcess := function()
local t;
t := IO_gettimeofday();
SCSCP_TRACE_PROCESS_COUNT:=SCSCP_TRACE_PROCESS_COUNT+1;
AppendTo( SCSCP_TRACE_FILE, 
	Concatenation( "\"New Process\"{[2]{0,0},", String(t.tv_sec), ".", String(t.tv_usec), ", 153, ", 
	SCSCP_TRACE_MACHINE_ID, ",", String(SCSCP_TRACE_PROCESS_COUNT), "};;\n" ) );
end;

SCSCPTraceEndProcess := function()
local t;
t := IO_gettimeofday();
AppendTo( SCSCP_TRACE_FILE, 
	Concatenation( "\"End Process\"{[2]{0,0},", String(t.tv_sec), ".", String(t.tv_usec), ", 161, ", 
	SCSCP_TRACE_MACHINE_ID, ",", String(SCSCP_TRACE_PROCESS_COUNT), "};;\n" ) );
end;

SCSCPTraceNewThread := function()
local t;
t := IO_gettimeofday();
SCSCP_TRACE_THREAD_COUNT:=SCSCP_TRACE_THREAD_COUNT+1;
AppendTo( SCSCP_TRACE_FILE, 
	Concatenation( "\"New Thread\"{[2]{0,0},", String(t.tv_sec), ".", String(t.tv_usec), ", 169, ", 
	SCSCP_TRACE_MACHINE_ID, ",", 
	String(SCSCP_TRACE_PROCESS_COUNT), ",",
	String(SCSCP_TRACE_THREAD_COUNT), ",0};;\n" ) );
end;

SCSCPTraceRunThread := function()
local t;
t := IO_gettimeofday();
AppendTo( SCSCP_TRACE_FILE, 
	Concatenation( "\"Run Thread\"{[2]{0,0},", String(t.tv_sec), ".", String(t.tv_usec), ", 185, ", 
	SCSCP_TRACE_MACHINE_ID, ",", 
	String(SCSCP_TRACE_PROCESS_COUNT), ",",
	String(SCSCP_TRACE_THREAD_COUNT), "};;\n" ) );
end;

SCSCPTraceSuspendThread := function()
local t;
t := IO_gettimeofday();
AppendTo( SCSCP_TRACE_FILE, 
	Concatenation( "\"Suspend Thread\"{[2]{0,0},", String(t.tv_sec), ".", String(t.tv_usec), ", 193, ", 
	SCSCP_TRACE_MACHINE_ID, ",", 
	String(SCSCP_TRACE_PROCESS_COUNT), ",",
	String(SCSCP_TRACE_THREAD_COUNT), "};;\n" ) );
end;

SCSCPTraceBlockThread := function()
local t;
t := IO_gettimeofday();
AppendTo( SCSCP_TRACE_FILE, 
	Concatenation( "\"Block Thread\"{[2]{0,0},", String(t.tv_sec), ".", String(t.tv_usec), ", 201, ", 
	SCSCP_TRACE_MACHINE_ID, ",", 
	String(SCSCP_TRACE_PROCESS_COUNT), ",",
	String(SCSCP_TRACE_THREAD_COUNT), ",0,0};;\n" ) );
end;

SCSCPTraceDeblockThread := function()
local t;
t := IO_gettimeofday();
AppendTo( SCSCP_TRACE_FILE, 
	Concatenation( "\"Deblock Thread\"{[2]{0,0},", String(t.tv_sec), ".", String(t.tv_usec), ", 209, ", 
	SCSCP_TRACE_MACHINE_ID, ",", 
	String(SCSCP_TRACE_PROCESS_COUNT), ",",
	String(SCSCP_TRACE_THREAD_COUNT), "};;\n" ) );
end;

SCSCPTraceEndThread := function()
local t;
t := IO_gettimeofday();
AppendTo( SCSCP_TRACE_FILE, 
	Concatenation( "\"End Thread\"{[2]{0,0},", String(t.tv_sec), ".", String(t.tv_usec), ", 177, ", 
	SCSCP_TRACE_MACHINE_ID, ",", 
	String(SCSCP_TRACE_PROCESS_COUNT), ",",
	String(SCSCP_TRACE_THREAD_COUNT), "};;\n" ) );
end;

SCSCPTraceSendMessage := function( recipient )
local t;
t := IO_gettimeofday();
AppendTo( SCSCP_TRACE_FILE, 
	Concatenation( "\"Send Message\"{[2]{0,0},", String(t.tv_sec), ".", String(t.tv_usec), ", 217, ", 
	SCSCP_TRACE_MACHINE_ID, ",", 
	String(SCSCP_TRACE_PROCESS_COUNT), ",0,",
	String(recipient),
	",1,0,0};;\n" ) );
end;

SCSCPTraceReceiveMessage := function( sender )
local t;
t := IO_gettimeofday();
AppendTo( SCSCP_TRACE_FILE, 
	Concatenation( "\"Receive Message\"{[2]{0,0},", String(t.tv_sec), ".", String(t.tv_usec), ", 225, ", 
	SCSCP_TRACE_MACHINE_ID, ",", 
	String(SCSCP_TRACE_PROCESS_COUNT), ",0,",
	String( sender ),
	",1,0,0,0};;\n" ) );
end;

SCSCPLogTracesTo := function( arg )
if Length(arg)=0 then
	SCSCPTraceEndTracing();
	IN_SCSCP_TRACING_MODE:=false;
	SetInfoLevel( InfoSCSCP, SCSCP_RESTORE_INFO_LEVEL );
elif Length(arg)=1 and IsString(arg[1]) then
    SCSCP_RESTORE_INFO_LEVEL := InfoLevel( InfoSCSCP );
	IN_SCSCP_TRACING_MODE := true;
	if SCSCPserverMode then
		SCSCP_TRACE_FILE := Concatenation( arg[1], ".tr" );
	else
		SCSCP_TRACE_FILE := Concatenation( arg[1], ".client.tr" );
	fi;	
	SCSCP_TRACE_PROCESS_COUNT:=0;
	SCSCP_TRACE_THREAD_COUNT:=0;
	if SCSCPserverMode then
		SCSCP_TRACE_MACHINE_ID := String(SCSCPserverPort);
	else 
		SCSCP_TRACE_MACHINE_ID := "0"; # for the client
	fi;	
	SCSCPTraceStartTracing();
fi;
end;