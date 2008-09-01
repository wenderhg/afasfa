<%@ Page Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true" CodeBehind="cadastrar_eventos.aspx.cs"
    Inherits="AFASFA.cadastrar_eventos" %>

<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <table>
        <tr>
            <td class="style1">
                <asp:Label ID="lblDescricaoEvento" runat="server" Text="Descrição do Evento" 
                    Font-Names="Verdana" Font-Size="8pt"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDescricaoEvento" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblDataEvento" runat="server" Text="Data do Evento"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDataEvento" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblLocal" runat="server" Text="Local"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtLocal" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblFotoInicial" runat="server" Text="Foto Inicial"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFotoInicial" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblJaRealizado" runat="server" Text="Já Realizado"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtJarealizado" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblApresentar" runat="server" Text="Apresentar" 
                    Font-Names="Verdana"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtApresentar" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblReservaDisponivel" runat="server" Text="Reserva Disponível"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtReservaDisponivel" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblDataMaximaApresentacao" runat="server" Text="Data Máxima Para Apresentação"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDataMaximaApresentacao" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblValorConviteAdulto" runat="server" Text="Valor do Convite Para Adulto"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtValorConviteAdulto" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblValorConviteCrianca" runat="server" Text="Valor do Convite Para Criança"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtValorConviteCrianca" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblObservacaoes" runat="server" Text="Observações Gerais"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="txtObservacaoes" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">

        <link href="estilos/estilos.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            text-align: right;
        }
    </style>

</asp:Content>

