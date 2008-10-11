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
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="acesso_dados.AFASFATableAdapters.usuariosTableAdapter"
        UpdateMethod="Update">
        <UpdateParameters>
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
            <asp:Parameter Name="Original_USUARIO" Type="UInt32" />
        </UpdateParameters>
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
                    CADASTRAR USUÁRIOS
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
                                        <br />
                                        <strong style="color: red">*</strong> Login:
                                    </td>
                                    <td align="left" width="80%">
                                        <br />
                                        <asp:TextBox ID="LoginTextBox" runat="server" CssClass="txtFormulario" onblur="PreencheApelido();"
                                            Text='<%# Bind("Login") %>' />
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
                                        <br />
                                        <strong style="color: red">*</strong> Nome:
                                    </td>
                                    <td align="left">
                                        <br />
                                        <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNomeTextBox" runat="server"
                                            ControlToValidate="NomeTextBox" Display="None" ErrorMessage="Nome é de preenchimento obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="lblFomulario">
                                        <br />
                                        <strong style="color: red">*</strong> Como deseja ser chamado:
                                    </td>
                                    <td align="left">
                                        <br />
                                        <asp:TextBox ID="ApelidoTextBox" runat="server" Text='<%# Bind("Apelido") %>' />
                                        <asp:RequiredFieldValidator ID="RequiredFieldApelidoTextBox" runat="server" ControlToValidate="ApelidoTextBox"
                                            Display="None" ErrorMessage="Apelido é de preenchimento obrigatório"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr id="trAdministrador" runat="server">
                                    <td align="right" class="lblFomulario" colspan="1">
                                        <br />
                                        <br />
                                        <asp:CheckBox ID="AdministradorCheckBox" runat="server" Text="Administrador" TextAlign="Left" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="lblFomulario">
                                        <br />
                                        <strong style="color: red">*</strong> Digite sua senha:
                                    </td>
                                    <td align="left">
                                        <br />
                                        <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldtxtSenha" runat="server" ControlToValidate="txtSenha"
                                            Display="None" ErrorMessage="Senha é de preenchimento obrigatório"></asp:RequiredFieldValidator>
                                        <cc1:PasswordStrength ID="PasswordStrengthSenha" runat="server" BarBorderCssClass="BarBorder_Senha"
                                            DisplayPosition="RightSide" HelpStatusLabelID="lblHelp" MinimumNumericCharacters="1"
                                            PreferredPasswordLength="6" RequiresUpperAndLowerCaseCharacters="true" StrengthIndicatorType="BarIndicator"
                                            StrengthStyles="BarIndicator_Senha_weak;BarIndicator_Senha_average;BarIndicator_Senha_good"
                                            TargetControlID="txtSenha" TextStrengthDescriptions="Muito fraco;Fraco;Médio;Forte;Excelente" />
                                        <br />
                                        <asp:Label ID="lblHelp" runat="server" Text="A senha deve ter no mínimo 6 caracteres, sendo au menos uma letra Maiúscula, uma minúscula, um numero e um símbolo."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="lblFomulario">
                                        <br />
                                        <strong style="color: red">*</strong> Digite sua senha novamente:
                                    </td>
                                    <td align="left">
                                        <br />
                                        <asp:TextBox ID="txtConfirmarSenha" runat="server" TextMode="Password" />
                                        <asp:CompareValidator ID="CompareValidatortxtConfirmarSenha" runat="server" ControlToCompare="txtSenha"
                                            ControlToValidate="txtConfirmarSenha" Display="None" ErrorMessage="As senhas devem ser idênticas."></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="lblFomulario">
                                        <br />
                                        &nbsp;Telefone Fixo:
                                    </td>
                                    <td align="left">
                                        <br />
                                        <asp:TextBox ID="TelefoneResTextBox" runat="server" Text='<%# Bind("TELEFONERES") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="lblFomulario">
                                        <br />
                                        &nbsp;Celular:
                                    </td>
                                    <td align="left">
                                        <br />
                                        <asp:TextBox ID="TelefoneCelTextBox" runat="server" Text='<%# Bind("TELEFONECEL") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="lblFomulario">
                                        <br />
                                        &nbsp;Email:
                                    </td>
                                    <td align="left">
                                        <br />
                                        <asp:TextBox ID="EMailTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                                        <asp:CustomValidator ID="CustomValidatorContato" runat="server" Display="None" ErrorMessage="Ao menos um dos telefones ou e-mail deve ser preenchido."
                                            OnServerValidate="CustomValidatorContato_ServerValidate"></asp:CustomValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEMail" runat="server"
                                            ControlToValidate="EMailTextBox" Display="None" ErrorMessage="Formato do endereço de e-mail está inválido."
                                            ValidationExpression="[a-z0-9!#$%&amp;'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&amp;'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="lblFomulario">
                                        <br />
                                        <strong style="color: red">*</strong> &nbsp;Sexo:
                                    </td>
                                    <td align="left">
                                        <br />
                                        <asp:DropDownList ID="ddlSexo" runat="server">
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
                                        <br />
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
                    <br />
                    &nbsp;Foto:
                </td>
                <td align="left">
                    <br />
                    <asp:FileUpload ID="fuFoto" runat="server" SkinID="btnFormularioCadastro" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <br />
                    <asp:Button ID="InsertButton" runat="server" Text="Salvar Dados" OnClick="InsertButton_Click"
                        SkinID="btnFormularioCadastro" />
                </td>
                <td align="center">
                    <br />
                    <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel"
                        SkinID="btnFormularioCadastro" />
                </td>
            </tr>
        </table>
        <br />
    </div>
</asp:Content>
