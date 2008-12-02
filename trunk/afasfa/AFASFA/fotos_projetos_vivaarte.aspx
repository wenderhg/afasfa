<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fotos_projetos_vivaarte.aspx.cs"
    Inherits="AFASFA.fotos_projetos_vivaarte" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <table width="100%" height="100%">
        <tr>
            <td align="left">
                <asp:Image runat="server" ID="imgFoto1" ImageUrl="~/Imagens/artesanato_vivaarte1.jpg" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Image runat="server" ID="imgFoto2" ImageUrl="~/Imagens/artesanato_vivaarte2.jpg" />
            </td>
        </tr>
    </table>
</body>
</html>
