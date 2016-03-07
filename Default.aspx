<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Gallery.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="html/css" href="Content/Stylesheet.css" />
    <title></title>
</head>
<body>
    <form id="GalleryForm" runat="server">
        <h1>Photo Gallery</h1>
            <div id="LargeImageViewer">
                <asp:Image ID="LargeImage" runat="server" />
            </div>

            <%--ViewBox for thumbnails--%>
            <div id="ViewBox">
                <asp:ListView ID="ListView" runat="server" 
                    ItemType="System.string" 
                    SelectMethod="Repeater_GetData">
                    <ItemTemplate>
                        <asp:HyperLink runat="server"
                            ID="image"
                            ImageURL ='<%#"~/Content/Images/Thumbnails/" + Item %>'
                            NavigateURL = '<%#"?name=" + Item%>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:ListView>
            </div>

            <%--UploadBoxx innehåller alla kontroller för att ladda upp en fil--%>
            <div id="UploadBox">
  
                <asp:Label ID="UploadLabel" runat="server" Text="Label">Ladda upp fil</asp:Label>
                <div>
                    <asp:FileUpload ID="FileUpload" runat="server" />
                        <div>
                            <asp:Button ID="UploadButton" runat="server" Text="Ladda upp" OnClick="UpploadButton_Click"/>
                        </div>
                
            <%-- Buttons and validators for uploading --%>
            <div id="ValidationBox">
  
            <%-- This validator require you to upload a file of valid type. --%>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator" 
                runat="server" 
                ErrorMessage="You must choose a File!" 
                ControlToValidate="FileUpload" 
                Display="Dynamic" ></asp:RequiredFieldValidator>

            <%-- This validator only allows gif, jpeg eller png images. --%>
            <asp:RegularExpressionValidator 
                ID="RegularExpressionValidator" 
                runat="server" 
                ErrorMessage="Wrong File format! Only .JPEG, .GIF and .PNG are accepted" 
                ControlToValidate="FileUpload" 
                Display="Dynamic" 
                ValidationExpression="(.*?)\.(jpg|jpeg|png|gif)$"></asp:RegularExpressionValidator> 
            </div>
                    
            </div>
        </div>                               
    </form>
    
</body>
</html>
