<!DOCTYPE html>
<html>
<title>Available information</title>

<body>
<h1>Available information</h1>


    <!--
   <%Response.Write("Document listing")%>
  

<%
ListFolder "d:\inetpub\wwwroot\aqua\aqua-al"

' -- Main Functions ----------------------------------------------------
Sub ListFolder(path) 
  Dim fs, rootPath

  Set fs   = CreateObject("Scripting.FileSystemObject")
  rootPath = Replace(path, Server.MapPath("/"), "") & "\"

  ListFolderContents fs.GetFolder(path), PathEncode(rootPath)
End Sub

' ----------------------------------------------------------------------
Sub ListFolderContents(folder, relativePath)
  Dim child

  Say "<ul>"
  Say "<li><div class=""folder"">" & h(folder.Name) & "</div>"

  For Each child In folder.SubFolders
    If Not IsHidden(child) Then
      ListFolderContents child, relativePath & PathEncode(child.Name) & "/"
    End If  
  Next

  relativePath = h(relativePath)

  For Each child In folder.Files
    If Not IsHidden(child) Then
      Say "<li><a href=""" & relativePath & h(PathEncode(child.Name)) & """>" & h(child.Name) & "</a></li>"
    End If
  Next

  Say "</ul>"
End Sub

' -- Helper Functions / Shorthands ---------------------------------------
Sub Say(s)
  Response.Write s & vbNewLine
End Sub

Function h(s)
  h = Server.HTMLEncode(s)
End Function

Function PathEncode(s)
  ' this creates a more correct variant of what Server.URLEncode would do
  PathEncode = Replace(s, "\", "/")
  PathEncode = Server.URLEncode(PathEncode)
  PathEncode = Replace(PathEncode, "+", "%20")
  PathEncode = Replace(PathEncode, "%2F", "/")
  PathEncode = Replace(PathEncode, "%2E", ".")
  PathEncode = Replace(PathEncode, "%5F", "_")
End Function

Function IsHidden(File)
  IsHidden = File.Attributes And 2 = 2
End Function
%>
-->
   <!-- ASP script adapted from http://www.brainjar.com/asp/dirlist/ -->
   
   
   
   <!-- ------------------------ -->
   
  
<% sub ListFolderContents(path)

     dim fs, folder, file, item, url

     set fs = CreateObject("Scripting.FileSystemObject")
     set folder = fs.GetFolder(path)
     Response.Write(folder)
    'Display the target folder and info.



   end sub %>
   <% function MapURL(path)

     dim rootPath, url

     'Convert a physical file path to a URL for hypertext links.

     rootPath = Server.MapPath("\inetpub\wwwroot\aqua\aqua-al")
     url = Right(path, Len(path) - Len(rootPath))
     MapURL = Replace(url, "\", "/")

   end function %>
   
   <% call ListFolderContents() %>

   
</body>
</html>