<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="cadastro_projetos.aspx.cs" Inherits="AFASFA.Cadastros.cadastro_projetos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="acesso_dados.DataSetAFASFATableAdapters.projetosTableAdapter">
        <InsertParameters>
            <asp:Parameter Name="DESCRICAO" Type="String" />
            <asp:Parameter Name="FOTO" Type="String" />
            <asp:Parameter Name="DADOSDOPROJETO" Type="String" />
            <asp:Parameter Name="ORDEMAPRESENTACAO" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Projeto" DefaultMode="Insert"
        DataSourceID="ObjectDataSource1" OnItemInserted="FormView1_ItemInserted" OnItemInserting="FormView1_ItemInserting">
        <InsertItemTemplate>
            <table cellpadding="0" cellspacing="0" width="100%" style="" border="Ridge">
                <tr>
                    <td>
                        <table border="0">
                            <tr>
                                <td>
                                    <tr>
                                        <td colspan="2" class="TextoTitulo" align="center">
                                            <br />
                                            CADASTRO DE PROJETOS
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="TextoPagina" align="justify">
                                            Olá !!!! Muito Obrigado pelos serviços prestados....
                                            <br />
                                            <br />
                                            Saiba que as informações aqui inseridas serão apresentadas na página aberta ao público
                                            onde serão apresentados os projetos existentes pelo Lar, por isso os dados devem
                                            conter informações corretas.
                                            <br />
                                            <br />
                                            Bom Trabalho.
                                            <br />
                                            <br />
                                            Caso tenha dúvidas sobre as informações que devem ser preenchidas pare com o mouse
                                            sobre o campo que o sistema lhe informará oque deve ser preenchido.
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="20%" align="right" class="lblFomulario">
                                                        <strong style="color: Red">*</strong> Descrição do Projeto ( Título da página de
                                                        divulgação do projeto ):
                                                    </td>
                                                    <td width="80%" align="left">
                                                        <asp:TextBox ID="ProjetoTextBox" runat="server" Text='<%# Bind("Descricao") %>' Width="98%"
                                                            class="txtFormulario" ToolTip="Informe o nome do projeto que será exibido como título na página de apresentação de projetos" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorProjetoTextBox" runat="server"
                                                            ErrorMessage="Descrição - Título do projeto de preenchimento obrigatório." ControlToValidate="ProjetoTextBox"
                                                            SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="20%" align="right" class="lblFomulario">
                                                        Foto para ser apresentada:
                                                    </td>
                                                    <td width="80%" align="left">
                                                        <asp:FileUpload ID="UploadFotoProjeto" runat="server" SkinID="upFile" Width="98%"
                                                            CssClass="txtFormulario" ToolTip="Selecione a foto que será exibida na página de apresentação de projetos" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="20%" align="right" class="lblFomulario" valign="top">
                                                        <strong style="color: Red">*</strong> Informações sobre o projeto:
                                                    </td>
                                                    <td width="80%" align="left">
                                                        <asp:TextBox ID="DadosProjetoTextBox" runat="server" Text='<%# Bind("DadosProjeto") %>'
                                                            Columns="60" Rows="5" TextMode="MultiLine" class="txtFormulario" ToolTip="Informe as atividades e objetivo projeto que será exibido na página de apresentação de projetos" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDadosProjetoTextBox" runat="server"
                                                            ErrorMessage="Informações do projeto de preenchimento obrigatório." ControlToValidate="DadosProjetoTextBox"
                                                            SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="20%" align="right" class="lblFomulario">
                                                        <strong style="color: Red">*</strong> Ordem do projeto para ser apresentado na página
                                                        aberta ao público:
                                                    </td>
                                                    <td width="80%" align="left">
                                                        <asp:TextBox ID="OrdemApresentacaoTextBox" runat="server" Text='<%# Bind("OrdemApresentacao") %>'
                                                            Width="10%" class="txtFormulario" ToolTip="Informe a ordem de apresentação deste projeto na página de apresentação de projetos" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="center">
                                                        <br />
                                                        <asp:Button ID="Button1" runat="server" CommandName="Insert" Text="Salvar Dados"
                                                            SkinID="btnFormularioCadastro" ToolTip="Click neste botão para salvar os dados" />
                                                        <%--OnClick="InsertButton_Click"--%>
                                                        <asp:Button ID="Button2" runat="server" CausesValidation="False" Text="Cancelar"
                                                            OnClick="InsertCancelButton_Click" SkinID="btnFormularioCadastro" ToolTip="Click neste botão para cancelar os dados" />
                                                        <%--SkinID="btnFormularioCadastro"  />
--%>
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
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br />
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
    <%--ModalPopup para resposta DA INCLUSÃO DE UM NOVO USUÁRIO--%>
    <asp:Panel ID="pnObrigado" runat="server" Style="display: none" CssClass="modalPopup">
        <asp:Panel ID="Panel2" runat="server" Style="cursor: move; background-color: #DDDDDD;
            border: solid 1px Gray; color: Black">
            <table>
                <tr>
                    <td class="lblCabecalhoModalPop">
                        Agradecimento !!!
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <table width="100%" heigh="100%">
            <tr>
                <td align="center" class="lblPerguntaModalPop">
                    Cadastro efetuado com sucesso. O Projeto já estará disponível para ser apresentado
                    na página aberta ao público conforme sua configurações. Muito Obrigado.
                    <br />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Button ID="btnVoltar" runat="server" Text="Voltar" UseSubmitBehavior="false"
                        SkinID="btnFormularioCadastro" CausesValidation="false" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="pnObrigado"
        RepositionMode="RepositionOnWindowResize" TargetControlID="btnModalPopupCancelar"
        BackgroundCssClass="modalBackground" OkControlID="btnVoltar" DropShadow="true"
        PopupDragHandleControlID="Panel3">
    </cc1:ModalPopupExtender>
</asp:Content>
