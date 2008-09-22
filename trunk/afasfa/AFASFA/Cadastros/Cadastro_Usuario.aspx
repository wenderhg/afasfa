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
        </InsertParameters>
    </asp:ObjectDataSource>
    <div style="background-color: #E6E7F2; border-color: #ecffff; border-style: ridge">
        <asp:UpdatePanel ID="upDadosCadastrais" runat="server" ChildrenAsTriggers="true"
            RenderMode="Block">
            <ContentTemplate>
                <table cellpadding="0" cellspacing="0">
                    <caption>
                        <br />
                        <tr>
                            <td align="center" class="TextoTitulo" colspan="2">
                                CADASTRAR TIPOS DE ASSISTÊNCIAS
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="lblFomulario">
                                <br />
                                <strong style="color: red">*</strong> Login:
                            </td>
                            <td align="left">
                                <br />
                                <asp:TextBox ID="LoginTextBox" runat="server" class="txtFormulario" onblur='PreencheApelido();'
                                    Text='<%# Bind("Login") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLoginTextBox" runat="server"
                                    ControlToValidate="LoginTextBox" Display="None" ErrorMessage="Login é de preenchimento obrigatório"></asp:RequiredFieldValidator>
                                <asp:Button ID="btnPreencheApelido" runat="server" CausesValidation="false" OnClick="btnPreencheApelido_Click"
                                    Style="display: none" Text="_" />
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
                                <cc1:PasswordStrength ID="PasswordStrength1" runat="server" DisplayPosition="RightSide"
                                    TargetControlID="txtSenha" StrengthIndicatorType="BarIndicator" PreferredPasswordLength="6"
                                    MinimumLowerCaseCharacters="1" MinimumNumericCharacters="1" MinimumSymbolCharacters="1"
                                    MinimumUpperCaseCharacters="1" RequiresUpperAndLowerCaseCharacters="true" 
                                    HelpStatusLabelID="lblHelp">
                                </cc1:PasswordStrength>
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
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="lblFomulario" colspan="2">
                                <br />
                                <asp:CheckBox ID="ReceberInformacaoesCheckBox" runat="server" Checked="true" TextAlign="Left"
                                    Text="Receber informações da instituição" />
                            </td>
                        </tr>
                    </caption>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <table cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td class="lblFomulario" align="right">
                    <br />
                    &nbsp;Foto:
                </td>
                <td align="left">
                    <br />
                    <asp:FileUpload ID="fuFoto" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Button ID="InsertButton" runat="server" Text="Salvar Dados" OnClick="InsertButton_Click" />
                </td>
                <td align="center">
                    <asp:Button ID="CancelButton" runat="server" Text="Cancelar" OnClick="CancelButton_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
