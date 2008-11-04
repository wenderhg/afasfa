<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="FrmVisualizarEvento.aspx.cs" Inherits="AFASFA.Visualizar.FrmVisualizarEvento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <asp:Repeater ID="rptEvento" runat="server" OnItemDataBound="rptEvento_ItemDataBound">
        <HeaderTemplate>
            <table>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td style="width: 50%">
                    <asp:Literal ID="Literal1" runat="server" Text="<%# Bind('Descricao') %>"></asp:Literal>
                </td>
                <td style="width: 50%">
                    <asp:Literal ID="ltIniciaImagem" runat="server" Text="<img src='/foto/" /><asp:Literal
                        ID="ltImagen" runat="server" Text="<%#Bind('FotoInicial') %>" /><asp:Literal ID="ltFinalizaImagem"
                            runat="server" Text="' style='width:110px;heigth:110px'/>" />
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr>
                <td style="width: 50%">
                    <asp:Literal ID="ltIniciaImagem" runat="server" Text="<img src='/foto/" /><asp:Literal
                        ID="ltImagen" runat="server" Text="<%#Bind('FotoInicial') %>" /><asp:Literal ID="ltFinalizaImagem"
                            runat="server" Text="' style='width:110px;heigth:110px'/>" />
                </td>
                <td style="width: 50%">
                    <asp:Literal ID="Literal1" runat="server" Text="<%# Bind('Descricao') %>"></asp:Literal>
                </td>
            </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </table></FooterTemplate>
    </asp:Repeater>
</asp:Content>
