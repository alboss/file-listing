<%@ Language=VBScript%>
<%
'List the contents of the current
'***** Enter a BOOKMARK TITLE for this web page in the line below ***
strTitle = "Al's files"
'***** Enter a MAIN HEADING for this web page in the line below *****
strHeading = "Available content"
'You don't need to change anything below this line
'********************************************************************
%>
<html>
<head>
<%response.write ("<title>" & strTitle & "</title>")%>
</head>
<body>
    <%
    response.write ("<h1>" & strHeading & "</h1>")
    set FileSysObj=CreateObject("Scripting.FileSystemObject")
    strFileAndPath = request.servervariables("SCRIPT_NAME")
    strPathOnly = Mid(strFileAndPath,1 ,InStrRev(strFileAndPath, "/"))
    strFullPath = server.mappath(strPathOnly)
    set fldr=FileSysObj.GetFolder(strFullPath)
    response.write("<h2>Folders list</h2>")
    set FolderList = fldr.SubFolders
    For Each FolderIndex in FolderList
        Response.Write("<a href='" & FolderIndex.name & "'>" & FolderIndex.name & "</a><br>")
    Next
    response.write("<h2>Files list</h2>")
    set FileList = fldr.Files
    For Each FileIndex in FileList
        'This bit excludes this page (and other asp files) from the list of links
        if Lcase(right(FileIndex.Name, 4)) <> ".asp" then
            Response.Write("<a href='" & FileIndex.name & "'>" & FileIndex.name & "</a><br>")
        end if
    Next
    %>
</body>
</html>