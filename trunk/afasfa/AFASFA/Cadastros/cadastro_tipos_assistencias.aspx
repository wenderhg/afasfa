<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="cadastro_tipos_assistencias.aspx.cs" Inherits="AFASFA.Cadastros.cadastro_tipos_assistencias" %>

<%@ Register Assembly="AjaxControlToolkit, Version=3.0.20820.16598, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e"
    Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="acesso_dados.AFASFATableAdapters.assistenciasTableAdapter"
        DeleteMethod="Delete">
        <DeleteParameters>
            <asp:Parameter Name="Original_ASSISTENCIA" Type="UInt32" />
            <asp:Parameter Name="Original_DESCRICAO" Type="String" />
            <asp:Parameter Name="Original_RESPONSAVEL" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DESCRICAO" Type="String" />
            <asp:Parameter Name="RESPONSAVEL" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Assistencia" DataSourceID="ObjectDataSource1"
        DefaultMode="Insert" BackColor="#E6E7F2" BorderColor="#ecffff" BorderStyle="Ridge">
        <InsertItemTemplate>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <tr>
                        <br />
                        <td colspan="2" class="TextoTitulo" align="center">
                            CADASTRAR TIPOS DE ASSISTÊNCIAS
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
                        Saiba que as informações aqui inseridas serão utilizadas e apresentadas na página
                        aberta ao que mostra a quantidade de pessoas assistidas pelos projetos o Lar , por
                        isso os dados devem conter informações corretas.
                        <br />
                        <br />
                        Bom Trabalho.
                        <br />
                        <br />
                        Caso Necessite de Ajuda click aqui !!!!
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <table>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    <strong style="color: red">*</strong> Descrição:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="DescricaoTextBox" runat="server" Text='<%# Bind("Descricao") %>'
                                        Width="390" class="txtFormulario" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDescricaoTextBox" runat="server"
                                        ErrorMessage="Descrição é de preenchimento obrigatório" ControlToValidate="DescricaoTextBox"
                                        Display="None"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    <strong style="color: red">*</strong> Responsavel:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="ResponsavelTextBox" runat="server" Text='<%# Bind("Responsavel") %>'
                                        Width="250" class="txtFormulario" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorResponsavelTextBox" runat="server"
                                        ErrorMessage="Responsável é de preenchimento obrigatório" ControlToValidate="ResponsavelTextBox"
                                        Display="None"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <br />
                                    <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                        Text="Salvar Dados" SkinID="btnFormularioCadastro" />
                                    &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Cancelar" SkinID="btnFormularioCadastro" OnClick="InsertCancelButton_Click" />
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="lblPreenchimentoObrigatorio" align="center">
                                    <br />
                                    (*) campo de preenchimento obrigatório
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
    </asp:FormView>
    <asp:Panel ID="pnConfirmacao" runat="server" Style="display: none" CssClass="modalPopup">
        <asp:Panel ID="Panel3" runat="server" Style="cursor: move; background-color: #DDDDDD;
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
                    Confirma cancelamento ?
                    <br />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Button ID="btnOK" runat="server" Text="Sim" OnClick="btnOK_Click" UseSubmitBehavior="false"
                        SkinID="btnFormularioCadastro" CausesValidation="false" />
                    <asp:Button ID="btnCancelar" runat="server" Text="Não" OnClick="btnCancelar_Click"
                        CausesValidation="false" SkinID="btnFormularioCadastro" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Button ID="btnModalPopupCancelar" runat="server" Text="" Style="display: none" />
    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnConfirmacao"
        RepositionMode="RepositionOnWindowResize" TargetControlID="btnModalPopupCancelar"
        BackgroundCssClass="modalBackground" OkControlID="btnOK" CancelControlID="btnCancelar"
        DropShadow="true" PopupDragHandleControlID="Panel3">
    </cc1:ModalPopupExtender>
</asp:Content>
