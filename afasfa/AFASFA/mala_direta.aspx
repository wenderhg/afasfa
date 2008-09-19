<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="mala_direta.aspx.cs" Inherits="AFASFA.mala_direta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <table cellpadding="0" cellspacing="0" width="100%" style=": background="#E6E7F2"
        border="Ridge">
        <tr>
            <tr>
                <br />
                <td colspan="2" class="TextoTitulo" align="center">
                    MALA DIRETA
                    <br />
                    <br />
                </td>
            </tr>
        </tr>
        <tr>
            <td colspan="2" class="TextoPagina" align="justify">
                Olá !!!! Muito Obrigado pelos serviços prestados....
                <br />
                <br />
                Saiba que as informações aqui inseridas serão apresentadas na página aberta ao público
                onde serão apresentados os eventos realizados pelo Lar, por isso os dados devem
                conter informações corretas.
                <br />
                <br />
                Bom Trabalho.
                <br />
                <br />
                Verifique quais os filtros serão utilizados para selecionar os usuários do site
                que irão receber a mensagem !!!
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td colspan="2">
                            <asp:RadioButton ID="RadioGeral" runat="server" Text="GERAL - Nesta opção todos os usuários do sistema irão receber a mensagem"
                                GroupName="GrupoRadioGeral" class="txtFormulario" />
                        </td>
                    </tr>
                    <tr>
                        <td width="35%" class="txtFormulario">
                            Selecionar aniversáriantes do mês:
                        </td>
                        <td>
                            <asp:TextBox ID="MesDesejadoTextBox" runat="server" CssClass="txtFormulario" Width="7%"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <%--<asp:RadioButton ID="TipoVoluntarioCheckBox1" runat="server" Text="Voluntário Indireto"
        GroupName="TipoVoluntario" class="txtFormulario" />--%>
</asp:Content>
