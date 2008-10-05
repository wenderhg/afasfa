<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="solicitar_senha.aspx.cs" Inherits="AFASFA.solicitar_senha" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <table cellpadding="0" cellspacing="0" width="100%" style=": " background="#E6E7F2"
        border="Ridge">
        <tr>
            <tr>
                <br />
                <td colspan="2" class="TextoTitulo" align="center">
                    Solicitar Senha
                    <br />
                    <br />
                </td>
            </tr>
        </tr>
        <tr>
            <td colspan="2" class="TextoPagina" align="justify">
                Olá !!!!! Muito Obrigado por sua visita.
                <br />
                <br />
                Digite seu usuário ou email de contato para que possamos lhe enviar sua senha.
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <br />
                        <td width="20%" class="lblFomulario" align="right">
                            <strong style="color: Red">*</strong> Usuário:
                        </td>
                        <td>
                            <asp:TextBox ID="UsuarioTextBox" runat="server" Width="20%" class="txtFormulario" />
                        </td>
                    </tr>
                    <tr>
                        <td class="lblFomulario" align="center" colspan="2">
                            <br />
                            <br />
                            OU
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="lblFomulario" align="right">
                            <strong style="color: Red">*</strong> Email:
                        </td>
                        <td>
                            <asp:TextBox ID="EmailTextBox" runat="server" Width="98%" class="txtFormulario" />
                        </td>
                        <br />
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <br />
                            <br />
                            <asp:Button ID="btnEnviarSenha" runat="server" Text="Enviar Senha" SkinID="btnFormularioCadastro"
                                OnClick="btnEnviarSenha_Click" />
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <%--Modal de mensagem " Dados inválidos ? "--%>
        <asp:Panel runat="server" ID="pnDadosInvalidos" Style="display: none" CssClass="modalPopup">
            <asp:Panel ID="Panel2" runat="server" Style="cursor: move; background-color: #DDDDDD;
                border: solid 1px Gray; color: Black">
                <table>
                    <tr>
                        <td class="lblCabecalhoModalPop">
                            Alerta !!!
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <table width="100%" heigh="100%">
                <tr>
                    <td align="center" class="lblPerguntaModalPop">
                        Usuário ou E-mail não localizado !!!!
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button ID="btnVoltar" runat="server" Text="Voltar" 
                            SkinID="btnFormularioCadastro" CausesValidation="false" />                        
                    </td>
                </tr>
            </table>
        </asp:Panel>
        
        <cc1:ModalPopupExtender ID="ModalPopupExtenderEfetuarLogoff" runat="server" PopupControlID="pnDadosInvalidos"
            RepositionMode="None" TargetControlID="btnEnviarSenha" BackgroundCssClass="modalBackground"
            PopupDragHandleControlID="Panel2">
        </cc1:ModalPopupExtender>
</asp:Content>
