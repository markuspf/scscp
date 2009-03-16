#############################################################################
##
#W init.g                   The SCSCP package             Alexander Konovalov
#W                                                               Steve Linton
##
#H $Id$
##
#############################################################################

# read the function declarations
ReadPackage("scscp/lib/openmath.gd");
ReadPackage("scscp/lib/xstream.gd");
ReadPackage("scscp/lib/process.gd");
ReadPackage("scscp/lib/remote.gd");
ReadPackage("scscp/lib/scscp.gd");

# setting the default version of SCSCP
SCSCP_VERSION := "1.3";

# We introduce the global variable SCSCPserverMode because 
# of different handling of OMR at server and client sides. 
# It might be useful in other cases as well. This variable
# will be set to true by the call of the function RunSCSCPserver
SCSCPserverMode := false;

# We introduce the global variable IN_SCSCP_TRACING_MODE to turn
# on/off recording events for performance analysis. It can
# be switched using the EventsTracesTo function
IN_SCSCP_TRACING_MODE := false;

# read the other part of code  
ReadPackage("scscp/lib/utils.g");
ReadPackage("scscp/config.g");
ReadPackage("scscp/lib/client.g");
ReadPackage("scscp/lib/openmath.g");
ReadPackage("scscp/lib/webservice.g");
ReadPackage("scscp/lib/special.g");
ReadPackage("scscp/lib/buildman.g");
ReadPackage("scscp/tracing/tracing.g");