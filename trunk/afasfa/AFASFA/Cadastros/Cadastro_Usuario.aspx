<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="Cadastro_Usuario.aspx.cs" Inherits="AFASFA.Cadastros.Cadastro_Usuario" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">

    <script language="javascript" type="text/javascript">
        function PreencheApelido() {
            document.getElementById("<%= btnPreencheApelido.ClientID %>").click();
        }
    </script>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="acesso_dados.AFASFATableAdapters.usuariosTableAdapter">
        <InsertParameters>
            <asp:Parameter Name="LOGIN" Type="String" />
            <asp:Parameter Name="NOME" Type="String" />
            <asp:Parameter Name="SENHA" Type="String" />
            <asp:Parameter Name="FOTO" Type="String" />
            <asp:Parameter Name="RECEBERINFORMACOES" Type="Byte" />
            <asp:Parameter Name="CEP" Type="String" />
            <asp:Parameter Name="LOGRADOURO" Type="String" />
            <asp:Parameter Name="NUMERO" Type="UInt32" />
            <asp:Parameter Name="COMPLEMENTO" Type="String" />
            <asp:Parameter Name="BAIRRO" Type="String" />
            <asp:Parameter Name="CIDADE" Type="String" />
            <asp:Parameter Name="UF" Type="String" />
            <asp:Parameter Name="TELEFONECEL" Type="String" />
            <asp:Parameter Name="TELEFONERES" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="APELIDO" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <div style="background-color: #E6E7F2; border-color: #ecffff; border-style: ridge;
        width: 98%">
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td align="center" class="TextoTitulo" colspan="2">
                    <div>
                        <br />
                        CADASTRAR USUÁRIOS
                        <br />
                        <br />
                    </div>
                    <div style="float: right; z-index: 100px">
                        <asp:Image ID="FotoUsuario" runat="server" Width="90px" Height="90px" AlternateText="Imagem do usuario" />
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="TextoPagina" align="justify">
                    Olá !!!!! Muito Obrigado por sua visita.
                    <br />
                    <br />
                    Agradecemos seu cadastro em nosso sistema, se for de sua vontade iremos lhe enviar
                    mensagens e notícias relacionadas a nossa instituição.
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:UpdatePanel ID="upDadosCadastrais" runat="server" ChildrenAsTriggers="true"
                        RenderMode="Inline">
                        <ContentTemplate>
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right" class="lblFomulario" width="20%">
                                        <strong style="color: red">*</strong> Login:
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="LoginTextBox" runat="server" CssClass="txtFormulario" onblur="PreencheApelido();"
                                            Text='<%# Bind("Login") %>' Width="20%" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorLoginTextBox" runat="server"
                                            ControlToValidate="LoginTextBox" Display="None" ErrorMessage="Login é de preenchimento obrigatório"></asp:RequiredFieldValidator>
                                        <asp:Button ID="btnPreencheApelido" runat="server" CausesValidation="false" OnClick="btnPreencheApelido_Click"
                                            Style="display: none" Text="_" />
                                        <asp:CustomValidator ID="CustomValidatorLoginRepetido" runat="server" Display="None"
                                            ErrorMessage="O login informado já existe." OnServerValidate="CustomValidatorLoginRepetido_ServerValidate"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="lblFomulario">
                                        <strong style="color: red">*</strong> Nome:
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' Width="98%" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNomeTextBox" runat="server"
                                            ControlToValidate="NomeTextBox" Display="None" ErrorMessage="Nome é de preenchimento obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="lblFomulario">
                                        <strong style="color: red">*</strong> Como deseja ser chamado:
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="ApelidoTextBox" runat="server" Text='<%# Bind("Apelido") %>' Width="20%"
                                            CssClass="txtFormulario" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldApelidoTextBox" runat="server" ControlToValidate="ApelidoTextBox"
                                            Display="None" ErrorMessage="Apelido é de preenchimento obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr id="trAdministrador" runat="server">
                                    <td align="right" class="lblFomulario" colspan="1">
                                        <asp:CheckBox ID="AdministradorCheckBox" runat="server" Text="Administrador" TextAlign="Left" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="lblFomulario">
                                        <strong style="color: red" id="stSenha" runat="server">*</strong> Digite sua senha:
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" Width="30%" CssClass="txtFormulario" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldtxtSenha" runat="server" ControlToValidate="txtSenha"
                                            Display="None" ErrorMessage="Senha é de preenchimento obrigatório"></asp:RequiredFieldValidator>
                                        <br />
                                        <cc1:PasswordStrength ID="PasswordStrengthSenha" runat="server" BarBorderCssClass="BarBorder_Senha"
                                            DisplayPosition="RightSide" HelpStatusLabelID="lblHelp" MinimumNumericCharacters="2"
                                            PreferredPasswordLength="6" RequiresUpperAndLowerCaseCharacters="true" StrengthIndicatorType="BarIndicator"
                                            StrengthStyles="BarIndicator_Senha_weak;BarIndicator_Senha_average;BarIndicator_Senha_good"
                                            TargetControlID="txtSenha" TextStrengthDescriptions="Muito fraco;Fraco;Médio;Forte;Excelente"
                                            TextCssClass="lblFomulario" />
                                        <asp:Label ID="lblHelp" runat="server" Text="A senha deve ter no mínimo 6 caracteres, sendo au menos uma letra Maiúscula, uma minúscula, um numero e um símbolo."
                                            CssClass="lblFomulario"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="lblFomulario">
                                        <strong style="color: red" id="stConfirmaSenha" runat="server">*</strong> Digite sua senha novamente:
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtConfirmarSenha" runat="server" TextMode="Password" Width="30%"
                                            CssClass="txtFormulario" />
                                        <asp:CompareValidator ID="CompareValidatortxtConfirmarSenha" runat="server" ControlToCompare="txtSenha"
                                            ControlToValidate="txtConfirmarSenha" Display="None" ErrorMessage="As senhas devem ser idênticas."></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="lblFomulario">
                                        &nbsp;Telefone Fixo:
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="TelefoneResTextBox" runat="server" Text='<%# Bind("TELEFONERES") %>'
                                            Width="25%" />
                                        <cc1:MaskedEditExtender ID="MaskedEditExtenderTelefoneResTextBox" runat="server"
                                            MaskType="Number" AcceptNegative="None" Mask="(99)9999-9999" TargetControlID="TelefoneResTextBox"
                                            AutoComplete="true">
                                        </cc1:MaskedEditExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="lblFomulario">
                                        &nbsp;Celular:
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="TelefoneCelTextBox" runat="server" Text='<%# Bind("TELEFONECEL") %>'
                                            Width="25%" CssClass="txtFormulario" />
                                        <cc1:MaskedEditExtender ID="MaskedEditExtenderTelefoneCelTextBox" runat="server"
                                            MaskType="Number" AcceptNegative="None" Mask="(99)9999-9999" TargetControlID="TelefoneCelTextBox"
                                            AutoComplete="true">
                                        </cc1:MaskedEditExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="lblFomulario">
                                        &nbsp;Email:
                                    </td>
                                    <td align="left">
                                        <br />
                                        <asp:TextBox ID="EMailTextBox" runat="server" Text='<%# Bind("EMAIL") %>' Width="95%" />
                                        <asp:CustomValidator ID="CustomValidatorContato" runat="server" Display="None" ErrorMessage="Ao menos um dos telefones ou e-mail deve ser preenchido."
                                            OnServerValidate="CustomValidatorContato_ServerValidate"></asp:CustomValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEMail" runat="server"
                                            ControlToValidate="EMailTextBox" Display="None" ErrorMessage="Formato do endereço de e-mail está inválido."
                                            ValidationExpression="[a-z0-9!#$%&amp;'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&amp;'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="lblFomulario">
                                        <strong style="color: red">*</strong> &nbsp;Sexo:
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="ddlSexo" runat="server" CssClass="lblFomulario">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem Text="Masculino" Value="M"></asp:ListItem>
                                            <asp:ListItem Text="Feminino" Value="F"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlSexo" runat="server" ControlToValidate="ddlSexo"
                                            Display="None" ErrorMessage="Sexo é de preenchimento obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="lblFomulario" colspan="2">
                                        <asp:CheckBox ID="ReceberInformacoesCheckBox" runat="server" Checked="true" Text="Receber informações da instituição"
                                            TextAlign="Left" />
                                    </td>
                                </tr>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td class="lblFomulario" align="right">
                    &nbsp;Foto:
                </td>
                <td align="left">
                    <asp:FileUpload ID="fuFoto" runat="server" SkinID="upFile" Width="98%" />
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <br />
                    <asp:Button ID="InsertButton" runat="server" Text="Salvar Dados" OnClick="InsertButton_Click"
                        SkinID="btnFormularioCadastro" />
                    <asp:Button ID="UpdateButton" runat="server" Text="Salvar Dados" OnClick="UpdateButton_Click"
                        SkinID="btnFormularioCadastro" />
                    <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel"
                        SkinID="btnFormularioCadastro" CausesValidation="false" />
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
        <br />
    </div>
    <%--ModalPopup para confirmar cancelamento--%>
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
        RepositionMode="RepositionOnWindowResize" TargetControlID="CancelButton" BackgroundCssClass="modalBackground"
        OkControlID="btnOK" CancelControlID="btnCancelar" DropShadow="true" PopupDragHandleControlID="Panel3">
    </cc1:ModalPopupExtender>
</asp:Content>
