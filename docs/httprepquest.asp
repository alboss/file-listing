<%

/*
   Class: HttpRequest
       Object encapsulates the process of making an HTTP Request.

   Parameters:
      url - The gtarget url
      data - Any paramaters which are required by the request.
      method - Whether to send the request as POST or GET
      options - async (true|false): should we send this asyncronously (fire and forget) or should we wait and return the data we get back? Default is false

   Returns:
      Returns the result of the request in text format.

*/

var HttpRequest = function( url, data, method, options  )
{
    options = options ? options : { "async" : false };
    options[ "async" ] = options["async"] ? true : false;

    var text = "";
    data = data ? data : "";
    method = method ? String( method ).toUpperCase() : "POST";

    // Make the request
    var objXmlHttp = new ActiveXObject( "MSXML2.ServerXMLHTTP" );
    objXmlHttp.setOption( 2, 13056 ); // Ignore all SSL errors

    try {
        objXmlHttp.open( method, url, options[ "async" ] ); // Method, URL, Async?
    }
    catch (e)
    {
        text = "Open operation failed: " + e.description;
    }

    objXmlHttp.setTimeouts( 30000, 30000, 30000, 30000 );   // Timeouts in ms for parts of communication: resolve, connect, send (per packet), receive (per packet)
    try {
        if ( method == "POST" ) {
            objXmlHttp.setRequestHeader( "Content-Type", "application/x-www-form-urlencoded" );
        }

        objXmlHttp.send( data );

        if ( options[ "async" ] ) {
            return "";
        }

        text = objXmlHttp.responseText;

    } catch(e) {
        text = "Send data failed: " + e.description;
    }

    // Did we get a "200 OK" status?
    if ( objXmlHttp.status != 200 )
    {
        // Non-OK HTTP response
        text = "Http Error: " + objXmlHttp.Status + " " + Server.HtmlEncode(objXmlHttp.StatusText) + "\nFailed to grab page data from: " + url;
    }

    objXmlHttp = null; // Be nice to the server

    return  text ;
}

%>