<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="FrmPesquisaVoluntario.aspx.cs" Inherits="AFASFA.Pesquisa.FrmPesquisaVoluntario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <table>
        <tr>
            <td>
                Nome
            </td>
            <td>
                <asp:TextBox ID="txtNome" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Status Voluntário
            </td>
            <td>
                <asp:DropDownList ID="ddlStatus" runat="server">
                    <asp:ListItem Text="Todos"></asp:ListItem>
                    <asp:ListItem Value="P" Text="Pendente de Aprovação"></asp:ListItem>
                    <asp:ListItem Value="A" Text="Aprovado"></asp:ListItem>
                    <asp:ListItem Value="I" Text="Inativo"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="ckFiltroPersonalizado" runat="server" 
                    Text="Filtro personalizado" 
                    oncheckedchanged="ckFiltroPersonalizado_CheckedChanged" />
            </td>
        </tr>
    </table>
    <br />
    <asp:PlaceHolder ID="phFiltroPersonalizado" runat="server">
        <table>
            <tr>
                <td>
                    Nome campo
                </td>
                <td>
                    Tipo de Filtro
                </td>
                <td>
                    Valor para filtro
                </td>
                <td>
                    Operador
                </td>
            </tr>
            <tr>
                <td style="margin-left: 40px">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList3" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <asp:GridView ID="gdFiltros" runat="server">
        </asp:GridView>
    </asp:PlaceHolder>
</asp:Content>
