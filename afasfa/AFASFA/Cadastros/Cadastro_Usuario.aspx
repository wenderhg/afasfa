<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="Cadastro_Usuario.aspx.cs" Inherits="AFASFA.Cadastros.Cadastro_Usuario" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">

    <script language="javascript" type="text/javascript">
        function PreencheApelido(sender) {
            document.getElementById("<%= ApelidoTextBox.ClientID %>").value = sender.value;
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
    <div style="width: 98%">
        <table cellpadding="0" cellspacing="0" width="100%" style="" border="Ridge">
            <tr>
                <td>
                    <table border="0">
                        <tr>
                            <td>
                                <tr>
                                    <td align="center" class="TextoTitulo" colspan="2">
                                        <div>
                                            <br />
                                            CADASTRAR USUÁRIOS
                                            <br />
                                            <br />
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
                                        Caso tenha dúvidas sobre as informações que devem ser preenchidas pare com o mouse
                                        sobre o campo que o sistema lhe informará oque deve ser preenchido.
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:UpdatePanel ID="upDadosCadastrais" runat="server" ChildrenAsTriggers="true"
                                            RenderMode="Inline">
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="UpdateButton" />
                                                <asp:PostBackTrigger ControlID="InsertButton" />
                                            </Triggers>
                                            <ContentTemplate>
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td colspan="2" width="100%">
                                                            <div align="center">
                                                                <asp:Image ID="FotoUsuario" runat="server" Width="200px" Height="150px" AlternateText="Imagem do usuario"
                                                                    ImageAlign="Middle" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario" width="20%">
                                                            <strong style="color: red">*</strong> Login:
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox ID="LoginTextBox" runat="server" CssClass="txtFormulario" onblur="PreencheApelido(this);"
                                                                Text='<%# Bind("Login") %>' Width="20%" ToolTip="Informe seu login." />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLoginTextBox" runat="server"
                                                                ControlToValidate="LoginTextBox" Display="None" ErrorMessage="Login é de preenchimento obrigatório"></asp:RequiredFieldValidator>
                                                            <asp:CustomValidator ID="CustomValidatorLoginRepetido" runat="server" Display="None"
                                                                ErrorMessage="O login informado já existe." OnServerValidate="CustomValidatorLoginRepetido_ServerValidate"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario">
                                                            <strong style="color: red">*</strong> Nome:
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' Width="98%"
                                                                CssClass="txtFormulario" ToolTip="Informe seu nome completo." />
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
                                                                CssClass="txtFormulario" ToolTip="Informe como deseja ser chamado." />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldApelidoTextBox" runat="server" ControlToValidate="ApelidoTextBox"
                                                                Display="None" ErrorMessage="Como deseja ser chamado é de preenchimento obrigatório"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr id="trAdministrador" runat="server">
                                                        <td align="right" class="lblFomulario" colspan="1">
                                                            <asp:CheckBox ID="AdministradorCheckBox" runat="server" Text="Administrador" TextAlign="Left"
                                                                CssClass="txtFormulario" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario">
                                                            <strong style="color: red" id="stSenha" runat="server">*</strong> Digite sua senha:
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" Width="30%" CssClass="txtFormulario"
                                                                ToolTip="Informe sua senha." />
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
                                                            <strong style="color: red" id="stConfirmaSenha" runat="server">*</strong> Digite
                                                            sua senha novamente:
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox ID="txtConfirmarSenha" runat="server" TextMode="Password" Width="30%"
                                                                CssClass="txtFormulario" ToolTip="Informe sua senha novamente." />
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
                                                                Width="25%" CssClass="txtFormulario" ToolTip="Informe seu telefone fixo ou de contato." />
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
                                                                Width="25%" CssClass="txtFormulario" ToolTip="Informe seu telefone celular." />
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
                                                            <asp:TextBox ID="EMailTextBox" runat="server" Text='<%# Bind("EMAIL") %>' Width="98%"
                                                                ToolTip="Informe seu e-mail." CssClass="txtFormulario" />
                                                            <asp:CustomValidator ID="CustomValidatorContato" runat="server" Display="None" ErrorMessage="É necessário pelo menos um contato sendo ele e-mail ou telefone."
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
                                                            <asp:DropDownList ID="ddlSexo" runat="server" CssClass="txtFormulario" ToolTip="Informe seu sexo.">
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
                                                                TextAlign="Left" CssClass="lblFomulario" ToolTip="Informe se deseja receber informações da instituição"
                                                                AutoPostBack="true" OnCheckedChanged="ReceberInformacoesCheckBox_OnCheckedChanged" />
                                                            <asp:Label ID="lblReceberInformaoes" runat="server" CssClass="lblFomulario" Text="SIM. Desejo receber informações sobre a instituição."
                                                                Visible="true"></asp:Label>
                                                            <asp:Label ID="lblNaoReceberInformaoes" runat="server" CssClass="lblFomulario" Text="NÃO. Desejo receber informações sobre a instituição."
                                                                Visible="false"></asp:Label>
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
                                        <asp:FileUpload ID="fuFoto" runat="server" SkinID="upFile" Width="98%" CssClass="txtFormulario"
                                            ToolTip="Selecione sua foto." />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <br />
                                        <asp:Button ID="InsertButton" runat="server" Text="Salvar Dados" OnClick="InsertButton_Click"
                                            SkinID="btnFormularioCadastro" ToolTip="Click neste botão para salvar as informações." />
                                        <asp:Button ID="UpdateButton" runat="server" Text="Salvar Dados" OnClick="UpdateButton_Click"
                                            SkinID="btnFormularioCadastro" ToolTip="Click neste botão para salvar as informações." />
                                        <asp:Button ID="CancelButton" runat="server" Text="Cancelar" SkinID="btnFormularioCadastro"
                                            CausesValidation="false" ToolTip="Click neste botão para cancelar as informações." />
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
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
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
                    Cadastro efetuado com sucesso. Agora você pode logar no sistema e navegar por novas
                    opções disponíveis no menu principal. Muito Obrigado.
                    <br />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Button ID="btnVoltar" runat="server" Text="OK" UseSubmitBehavior="false" SkinID="btnFormularioCadastro"
                        CausesValidation="false" PostBackUrl="~/index.aspx" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="pnObrigado"
        RepositionMode="RepositionOnWindowResize" TargetControlID="btnVoltar" BackgroundCssClass="modalBackground"
        OkControlID="btnVoltar" DropShadow="true" PopupDragHandleControlID="Panel3">
    </cc1:ModalPopupExtender>
</asp:Content>
