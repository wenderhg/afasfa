<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmReportViewer.aspx.cs"
    Inherits="AFASFA.Relatorios.FrmReportViewer" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="dvRelatorio" style=""><!-- Colocar um texto indicando que aqui estao os filtros, apos executar o relatorio esconder o div com display:none-->
            <asp:DropDownList ID="ddlRelatorios" runat="server">
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Text="Doacoes" Value="Relatorios\Doacoes.rdlc"></asp:ListItem>
                <asp:ListItem Text="Teste" Value="Teste.rdlc"></asp:ListItem>
                <asp:ListItem Text="Report1" Value="Report1.rdlc"></asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btGerar" runat="server" Text="Gerar Relatorio" OnClick="btGerar_Click" />
        </div>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" DocumentMapWidth="90%" Height="90%"
            Width="90%" Font-Names="Verdana" Font-Size="8pt" ProcessingMode="Local" Visible="false">
        </rsweb:ReportViewer>
    </div>
    </form>
</body>
</html>
