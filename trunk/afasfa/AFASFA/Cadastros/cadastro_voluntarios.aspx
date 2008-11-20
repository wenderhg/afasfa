<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="cadastro_voluntarios.aspx.cs" Inherits="AFASFA.Cadastros.cadastro_voluntarios" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">

    <script type="text/javascript">
        function PreencheApelido(sender) {
            if (sender != null) {
                var arrNome = sender.value.split(' ');
                if (arrNome.length >= 1) {
                    document.getElementById('<%= ApelidoTextBox.ClientID %>').value = arrNome[0];
                }
            }
        }

        function ExecutabtnCEPClick() {
            document.getElementById('<%= btnCEP.ClientID %>').click();
        }
    
    </script>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="acesso_dados.AFASFATableAdapters.voluntariosTableAdapter">
        <InsertParameters>
            <asp:Parameter Name="USUARIOS_USUARIO" Type="UInt32" />
            <asp:Parameter Name="NOME" Type="String" />
            <asp:Parameter Name="APELIDO" Type="String" />
            <asp:Parameter Name="NACIONALIDADE" Type="String" />
            <asp:Parameter Name="DATANASCIMENTO" Type="DateTime" />
            <asp:Parameter Name="ESTADOORIGEM" Type="String" />
            <asp:Parameter Name="CIDADEORIGEM" Type="String" />
            <asp:Parameter Name="HABILITADO" Type="Byte" />
            <asp:Parameter Name="ESTADOCIVIL" Type="String" />
            <asp:Parameter Name="TRABALHA" Type="Byte" />
            <asp:Parameter Name="ESCOLARIDADE" Type="String" />
            <asp:Parameter Name="PROFISSAO" Type="String" />
            <asp:Parameter Name="LOCALDETRABALHO" Type="String" />
            <asp:Parameter Name="COMOFICOUSABENDO" Type="String" />
            <asp:Parameter Name="TIPOVOLUNTARIO" Type="String" />
            <asp:Parameter Name="QUALATIVIDADE" Type="String" />
            <asp:Parameter Name="QUADISPONIBILIDADE" Type="UInt32" />
            <asp:Parameter Name="QUAISDIAS" Type="UInt32" />
            <asp:Parameter Name="ACEITATERMO" Type="Byte" />
            <asp:Parameter Name="TEMPODOVOLUNTARIO" Type="String" />
            <asp:Parameter Name="ESTADO" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="modalPopup" width="100%">
                <img src="../Imagens/ajax-loader.gif" />
                Carregando..
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional"
        RenderMode="Inline">
        <ContentTemplate>
            <table cellpadding="0" cellspacing="0" width="100%" style="" background="#E6E7F2"
                border="Ridge">
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <caption>
                                        <br />
                                        <tr>
                                            <td align="center" class="TextoTitulo" colspan="2">
                                                SEJA VOLUNT�RIO
                                                <br />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="justify" class="TextoPagina" colspan="2">
                                                Ol� !!!! Muito Obrigado por sua visita em nosso site......
                                                <br />
                                                <br />
                                                O servi�o volunt�rio � de extrema import�ncia para o Lar, todos nossos eventos e
                                                projetos realizados dependem da ajuda de nossos volunt�rios.
                                                <br />
                                                <br />
                                                Caso tenha d�vidas sobre as informa��es que devem ser preenchidas pare com o mouse
                                                sobre o campo que o sistema lhe informar� oque deve ser preenchido.
                                                <br />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="right" class="lblFomulario" width="20%">
                                                            <strong style="color: Red">*</strong> Nome:
                                                        </td>
                                                        <td align="left" width="80%">
                                                            <asp:TextBox ID="NomeTextBox" runat="server" class="txtFormulario" onblur="PreencheApelido(this);"
                                                                Text='<%# Bind("Nome") %>' Width="98%" ToolTip="Informe seu nome." />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorNomeTextBox" runat="server"
                                                                ControlToValidate="NomeTextBox" Display="None" ErrorMessage="Nomde � de preenchimento obrigat�rio">
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario" width="20%">
                                                            <strong style="color: Red">*</strong> Como Deseja ser Chamado:
                                                        </td>
                                                        <td align="left" width="80%">
                                                            <asp:TextBox ID="ApelidoTextBox" runat="server" class="txtFormulario" Text='<%# Bind("Apelido") %>'
                                                                Width="30%" ToolTip="Informe como deseja ser chamado." />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorApelidoTextBox" runat="server"
                                                                ControlToValidate="ApelidoTextBox" Display="None" ErrorMessage="Apelido � de preenchimento obrigat�rio">
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario" width="20%">
                                                            <strong style="color: Red">*</strong> Data de Nascimento:
                                                        </td>
                                                        <td align="left" width="80%">
                                                            <asp:TextBox ID="DataNascimentoTextBox" runat="server" class="txtFormulario" Text='<%# Bind("DataNascimento") %>'
                                                                Width="16%" ToolTip="Informe a data de nascimento." />
                                                            <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" AcceptNegative="None"
                                                                AutoComplete="true" AutoCompleteValue="09/08/2008" Mask="99/99/9999" MaskType="Date"
                                                                TargetControlID="DataNascimentoTextBox" UserDateFormat="DayMonthYear">
                                                            </cc1:MaskedEditExtender>
                                                            <asp:Image ID="imgCalendarioDataNascimento" runat="server" ImageUrl="../Imagens/Calendar.bmp" />
                                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Animated="true" Format="dd/MM/yyyy"
                                                                PopupButtonID="imgCalendarioDataNascimento" TargetControlID="DataNascimentoTextBox">
                                                            </cc1:CalendarExtender>
                                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="DataNascimentoTextBox"
                                                                Display="None" ErrorMessage="Data de nascimento � inv�lida." Operator="DataTypeCheck"
                                                                Type="Date">
                                                            </asp:CompareValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario">
                                                            <strong style="color: red">*</strong> &nbsp;Sexo:
                                                        </td>
                                                        <td align="left">
                                                            <asp:DropDownList ID="ddlSexo" runat="server" CssClass="txtFormulario" ToolTip="Selecione o sexo.">
                                                                <asp:ListItem></asp:ListItem>
                                                                <asp:ListItem Text="Masculino" Value="M"></asp:ListItem>
                                                                <asp:ListItem Text="Feminino" Value="F"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlSexo" runat="server" ControlToValidate="ddlSexo"
                                                                Display="None" ErrorMessage="Sexo � de preenchimento obrigat�rio"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario" width="20%">
                                                            Nacionalidade:
                                                        </td>
                                                        <td align="left" width="80%">
                                                            <asp:RadioButtonList ID="rblNacionalidade" runat="server" RepeatColumns="2" AutoPostBack="true"
                                                                OnSelectedIndexChanged="rblNacionalidade_SelectedIndexChanged" ToolTip="Selecione a nacionalidade."
                                                                CssClass="txtFormulario">
                                                                <asp:ListItem Selected="True" Text="Brasileira" Value="B"></asp:ListItem>
                                                                <asp:ListItem Text="Estrangeira" Value="E"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                    </tr>
                                                    <tr id="tr_EstadosBrasileiros" runat="server">
                                                        <td align="right" class="lblFomulario" width="20%">
                                                            <strong style="color: Red">*</strong> Estado de Origem:
                                                        </td>
                                                        <td align="left" width="80%">
                                                            <asp:DropDownList ID="EstadoOrigemDropDownList" runat="server" DataTextField="Nome"
                                                                OnSelectedIndexChanged="EstadoOrigemDropDownList_SelectedIndexChanged" AutoPostBack="true"
                                                                DataValueField="Codigo" AppendDataBoundItems="true" ToolTip="Informe o estado de origem."
                                                                CssClass="txtFormulario">
                                                                <asp:ListItem></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:CustomValidator ID="CustomValidatorEstado" runat="server" Display="None" ErrorMessage="Estado de origem � de preenchimento obrigat�rio."
                                                                OnServerValidate="CustomValidatorEstado_ServerValidate" ControlToValidate="EstadoOrigemDropDownList"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr id="tr_CidadeBrasileira" runat="server">
                                                        <td align="right" class="lblFomulario" width="20%">
                                                            <strong style="color: Red"></strong>Cidade Origem:
                                                        </td>
                                                        <td align="left" width="80%">
                                                            <asp:DropDownList ID="ddlCidadeOrigem" runat="server" DataTextField="Nome" DataValueField="Codigo"
                                                                AppendDataBoundItems="true" ToolTip="Informe a cidade de origem." CssClass="txtFormulario">
                                                                <asp:ListItem></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <span align="justify" class="TextoPagina">Caso sua cidade n�o conste na lista, favor
                                                                deixar o campo sem preenchimento.</span>
                                                        </td>
                                                    </tr>
                                                    <tr id="tr_PaisEstrangeiro" runat="server" visible="false">
                                                        <td align="right" class="lblFomulario" width="20%">
                                                            <strong style="color: Red">*</strong> Pa�s de Origem:
                                                        </td>
                                                        <td align="left" width="80%">
                                                            <asp:TextBox ID="PaisOrigemTextBox" runat="server" class="txtFormulario" Text='<%# Bind("PaisOrigem") %>'
                                                                Width="16%" ToolTip="Informe o pa�s de origem." />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPaisOrigemTextBox" runat="server"
                                                                ControlToValidate="PaisOrigemTextBox" Display="None" ErrorMessage="Pa�s � de preenchimento obrigat�rio."
                                                                ValidationGroup="Estrangeiro">
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr id="tr_CidadeEstrangeira" runat="server" visible="false">
                                                        <td align="right" class="lblFomulario" width="20%">
                                                            <strong style="color: Red">*</strong>Cidade Origem:
                                                        </td>
                                                        <td align="left" width="80%">
                                                            <asp:TextBox ID="CidadeOrigemTextBox" runat="server" class="txtFormulario" Text='<%# Bind("Cidade") %>'
                                                                Width="16%" ToolTip="Informe a cidade de origem." />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CidadeOrigemTextBox"
                                                                Display="None" ErrorMessage="Cidade Origem � de preenchimento obrigat�rio." ValidationGroup="Estrangeiro">
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <%--http://www.correios.com.br/servicos/cep/cep_loc_log.cfm/--%>
                                                    <tr>
                                                        <td align="right" class="lblFomulario" width="20%">
                                                            <strong style="color: Red">*</strong> CEP:
                                                        </td>
                                                        
                                                        <td align="left" width="80%">
                                                            <asp:TextBox ID="CepTextBox" runat="server" class="txtFormulario" onblur="ExecutabtnCEPClick();"
                                                                Text='<%# Bind("[Cep]") %>' Width="16%" ToolTip="Informe o CEP. Ao sair do campo as informa��es do endere�o referentes ao CEP ser�o completadas automaticamente." />
                                                            <asp:Button ID="btnCEP" runat="server" CausesValidation="false" OnClick="btnCEP_Click"
                                                                Style="display: none" Text="_" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="CepTextBox"
                                                                Display="None" ErrorMessage="CEP � de preenchimento obrigat�rio">
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario" width="20%">
                                                            Logradouro:
                                                        </td>
                                                        <td align="left" width="80%">
                                                            <asp:TextBox ID="LogradouroTextbox" runat="server" class="txtFormulario" Enabled="false"
                                                                Text='<%# Bind("[Logradouro]") %>' Width="98%" ToolTip="Informar nome da rua do endere�o." />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario" width="20%">
                                                            <strong style="color: Red">*</strong> N�mero:
                                                        </td>
                                                        <td align="left" width="80%">
                                                            <asp:TextBox ID="NumeroTextbox" runat="server" class="txtFormulario" Text='<%# Bind("[Numero]") %>'
                                                                Width="10%" ToolTip="Informar n�mero do endere�o." />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="NumeroTextbox"
                                                                Display="None" ErrorMessage="N�mero � de preenchimento obrigat�rio">
                                                            </asp:RequiredFieldValidator>
                                                            <asp:RangeValidator ID="rvNumero" runat="server" ErrorMessage="N�mero deve ser um n�mero entre 0 e 9.999.999."
                                                                ControlToValidate="NumeroTextbox" Display="None" MinimumValue="0" MaximumValue="9999999"
                                                                Type="Integer"></asp:RangeValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario" width="20%">
                                                            Complemento:
                                                        </td>
                                                        <td align="left" width="80%">
                                                            <asp:TextBox ID="ComplementoTextbox" runat="server" class="txtFormulario" Text='<%# Bind("[Complemento]") %>'
                                                                Width="30%" ToolTip="Informar complemento do endere�o." />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario" width="20%">
                                                            Bairro:
                                                        </td>
                                                        <td align="left" width="80%">
                                                            <asp:TextBox ID="BairroTextBox" runat="server" class="txtFormulario" Enabled="false"
                                                                Text='<%# Bind("[Bairro]") %>' Width="40%" ToolTip="Informar bairro em que reside." />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario" width="20%">
                                                            Cidade:
                                                        </td>
                                                        <td align="left" width="80%">
                                                            <asp:TextBox ID="CidadeTextBox" runat="server" class="txtFormulario" Enabled="false"
                                                                Text='<%# Bind("[Cidade]") %>' Width="40%" ToolTip="Informar cidade em que reside." />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario" width="20%">
                                                            <strong style="color: Red">*</strong> UF:
                                                        </td>
                                                        <td align="left" width="80%">
                                                            <asp:DropDownList ID="UfDropDownList" runat="server" DataTextField="Nome" DataValueField="Sigla"
                                                                AppendDataBoundItems="true" ToolTip="Informar estado em que reside." CssClass="txtFormulario">
                                                                <asp:ListItem></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario" width="20%">
                                                            E-mail:
                                                        </td>
                                                        <td align="left" width="80%">
                                                            <asp:TextBox ID="EmailTextBox" runat="server" class="txtFormulario" Text='<%# Bind("[Email]") %>'
                                                                ToolTip="E-mail ser� usado como contato principal caso seja informado" Width="98%" />
                                                            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="None" ErrorMessage="� necess�rio pelo menos um contato sendo ele e-mail ou telefone."
                                                                OnServerValidate="CustomValidatorContato_ServerValidate"></asp:CustomValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEMail" runat="server"
                                                                ControlToValidate="EMailTextBox" Display="None" ErrorMessage="Formato do endere�o de e-mail est� inv�lido."
                                                                ValidationExpression="[a-z0-9!#$%&amp;'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&amp;'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"></asp:RegularExpressionValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario">
                                                            <strong style="color: Red">*</strong> Telefone Residencial/Contato:
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox ID="TelefoneResTextBox" runat="server" class="txtFormulario" Text='<%# Bind("TelefoneRes") %>'
                                                                Width="25%" ToolTip="Informe seu telefone residencial." />
                                                            <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" AcceptNegative="None"
                                                                AutoComplete="true" Mask="(99)9999-9999" MaskType="Number" TargetControlID="TelefoneResTextBox">
                                                            </cc1:MaskedEditExtender>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTelefoneRes" runat="server"
                                                                ControlToValidate="TelefoneResTextBox" Display="None" ErrorMessage="Telefone residencial � de preenchimento obrigat�rio">
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario">
                                                            Telefone Celular:
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox ID="TelefoneCelTextBox" runat="server" class="txtFormulario" Text='<%# Bind("TelefoneCel") %>'
                                                                Width="25%" ToolTip="Informe seu telefone celular." />
                                                            <cc1:MaskedEditExtender ID="MaskedEditExtender3" runat="server" AcceptNegative="None"
                                                                AutoComplete="true" Mask="(99)9999-9999" MaskType="Number" TargetControlID="TelefoneCelTextBox">
                                                            </cc1:MaskedEditExtender>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario">
                                                            Possui Habilita��o:
                                                        </td>
                                                        <td align="left">
                                                            <asp:CheckBox ID="HabilitadoCheckBox" runat="server" Checked='<%# Bind("Habilitado") %>'
                                                                class="txtFormulario" Width="10%" ToolTip="Marque caso possua a carteira nacional de habilita��o." />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario">
                                                            Estado C�vil:
                                                        </td>
                                                        <td align="left">
                                                            <asp:DropDownList ID="EstadoCivilDropDownList" runat="server" ToolTip="Informe seu estado civil."
                                                                CssClass="txtFormulario">
                                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                                                <asp:ListItem Text="Solteiro" Value="S"></asp:ListItem>
                                                                <asp:ListItem Text="Casado" Value="C"></asp:ListItem>
                                                                <asp:ListItem Text="Amigado" Value="A"></asp:ListItem>
                                                                <asp:ListItem Text="Divorciado" Value="D"></asp:ListItem>
                                                                <asp:ListItem Text="Vi�vo" Value="V"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario">
                                                            Esta Trabalhando:
                                                        </td>
                                                        <td align="left">
                                                            <asp:CheckBox ID="TrabalhoCheckBox" runat="server" Checked='<%# Bind("Trabalho") %>'
                                                                class="txtFormulario" Width="98%" ToolTip="Marque caso estaja trabalhando." />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario">
                                                            Escolaridade:
                                                        </td>
                                                        <td align="left">
                                                            <asp:DropDownList ID="EscolaridadeDropDown" runat="server" class="txtFormulario"
                                                                Width="98%" ToolTip="Informe seu grau de escolaridade.">
                                                                <asp:ListItem></asp:ListItem>
                                                                <asp:ListItem Value="EB">Ensino b�sico</asp:ListItem>
                                                                <asp:ListItem Value="EBI">Ensino b�sico incompleto</asp:ListItem>
                                                                <asp:ListItem Value="EM">Ensino m�dio</asp:ListItem>
                                                                <asp:ListItem Value="EMI">Ensino m�dio incompleto</asp:ListItem>
                                                                <asp:ListItem Value="ES">Ensino superior</asp:ListItem>
                                                                <asp:ListItem Value="ESI">Ensino superior incompleto</asp:ListItem>
                                                                <asp:ListItem Value="PG">P�s-Gradua��o</asp:ListItem>
                                                                <asp:ListItem Value="MT">Mestrado</asp:ListItem>
                                                                <asp:ListItem Value="DT">Doutorado</asp:ListItem>
                                                                <asp:ListItem Value="PD">P�s-Doutorado</asp:ListItem>
                                                                <asp:ListItem Value="SE">Sem escolaridade</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario">
                                                            Profiss�o:
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox ID="ProfissaoTextBox" runat="server" class="txtFormulario" Text='<%# Bind("Profissao") %>'
                                                                Width="98%" ToolTip="Informe sua profiss�o." />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario">
                                                            Local de Trabalho:
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox ID="Local_de_TrabalhoTextBox" runat="server" class="txtFormulario" Text='<%# Bind("[Local de Trabalho]") %>'
                                                                Width="98%" ToolTip="Informe seu local de trabalho." />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario">
                                                            Como ficou sabendo de nossa institui��o:
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox ID="ComoFicouSabendoTextBox" runat="server" class="txtFormulario" Text='<%# Bind("ComoFicouSabendo") %>'
                                                                Width="98%" ToolTip="Informe como ficou sabendo da exist�ncia da institui��o." />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <br />
                                                            <table cellpadding="5px" cellspacing="0" width="100%">
                                                                <tr bgcolor="#495196">
                                                                    <td align="center" class="lblCaptionGrid">
                                                                        Qual forma gostaria de colaborar com nossa Institui��o.
                                                                    </td>
                                                                </tr>
                                                                <tr align="center">
                                                                    <td align="left">
                                                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:RadioButton ID="rbVoluntarioDireto" runat="server" class="txtFormulario" GroupName="TipoVoluntario"
                                                                                        Text="Volunt�rio Direto" ToolTip="Volunt�rio direto � aquele que trabalha dentro da organiza��o e indireto o que trabalha fora. Mais informa��es na p�gina de volunt�rios." />
                                                                                </td>
                                                                                <td class="txtFormulario">
                                                                                    Trabalho dentro de organiza��o.
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:RadioButton ID="rbVoluntarioIndireto" runat="server" class="txtFormulario" GroupName="TipoVoluntario"
                                                                                        Text="Volunt�rio Indireto" ToolTip="Volunt�rio direto � aquele que trabalha dentro da organiza��o e indireto o que trabalha fora. Mais informa��es na p�gina de volunt�rios." />
                                                                                </td>
                                                                                <td class="txtFormulario">
                                                                                    Trabalho fora da organiza��o.
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lblFomulario">
                                                            Qual atividade gostaria de desempenhar:
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox ID="QualAtividadeTextBox" runat="server" class="txtFormulario" Text='<%# Bind("QualAtividade") %>'
                                                                Width="98%" ToolTip="Informe qual atividade gostaria de desempenhar na institui��o." />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <br />
                                                            <table cellpadding="5px" cellspacing="0" width="100%">
                                                                <tr bgcolor="#495196">
                                                                    <td align="center" class="lblCaptionGrid">
                                                                        Qual sua disponibilidade de tempo nos auxiliar voluntariamente.
                                                                    </td>
                                                                </tr>
                                                                <tr align="center">
                                                                    <td align="left">
                                                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:CheckBox ID="ckduasHoras" runat="server" CssClass="lblFomulario" Text="02 Horas ao dia"
                                                                                        ToolTip="Informe quantas horas voc� pode colaborar com a institui��o." />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:CheckBox ID="ckquatroHoras" runat="server" class="lblFomulario" Text="04 Horas ao dia"
                                                                                        ToolTip="Informe quantas horas voc� pode colaborar com a institui��o." />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:CheckBox ID="ckseisHoras" runat="server" class="lblFomulario" Text="06 Horas ao dia"
                                                                                        ToolTip="Informe quantas horas voc� pode colaborar com a institui��o." />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:CheckBox ID="ckoitoHoras" runat="server" class="lblFomulario" Text="08 Horas ao dia"
                                                                                        ToolTip="Informe quantas horas voc� pode colaborar com a institui��o." />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <br />
                                                            <table cellpadding="5px" cellspacing="0" width="100%">
                                                                <tr bgcolor="#495196">
                                                                    <td align="center" class="lblCaptionGrid">
                                                                        Qual seria o melhor dia da semana para nos auxiliar voluntariamente.
                                                                    </td>
                                                                </tr>
                                                                <tr align="center">
                                                                    <td align="left">
                                                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:CheckBox ID="ckDomingo" runat="server" class="lblFomulario" Text="Domingo" ToolTip="Informe quais dias da semana voc� pode colaborar com a institui��o." />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:CheckBox ID="ckSegunda" runat="server" class="lblFomulario" Text="Segunda" ToolTip="Informe quais dias da semana voc� pode colaborar com a institui��o." />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:CheckBox ID="ckTerca" runat="server" class="lblFomulario" Text="Ter�a" ToolTip="Informe quais dias da semana voc� pode colaborar com a institui��o." />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:CheckBox ID="ckQuarta" runat="server" class="lblFomulario" Text="Quarta" ToolTip="Informe quais dias da semana voc� pode colaborar com a institui��o." />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:CheckBox ID="ckQuinta" runat="server" class="lblFomulario" Text="Quinta" ToolTip="Informe quais dias da semana voc� pode colaborar com a institui��o." />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:CheckBox ID="ckSexta" runat="server" class="lblFomulario" Text="Sexta" ToolTip="Informe quais dias da semana voc� pode colaborar com a institui��o." />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:CheckBox ID="ckSabado" runat="server" class="lblFomulario" Text="S�bado" ToolTip="Informe quais dias da semana voc� pode colaborar com a institui��o." />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="lblFomulario" width="20%">
                                                Aceita Termo:
                                            </td>
                                            <td align="left" width="80%">
                                                <asp:CheckBox ID="AceitaTermoCheckBox" runat="server" Checked='<%# Bind("AceitaTermo") %>'
                                                    class="txtFormulario" ToolTip="Aceita termo de voluntariado." />
                                                <asp:Button runat="server" ID="btnVerTermoVoluntario" SkinID="btnFormularioCadastro"
                                                    Text="Ver Termo de Volunt�rio" ToolTip="Click neste bot�o para ler o termo de volunt�rio." />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="lblFomulario" width="20%">
                                                Tempo de Volunt�rio:
                                            </td>
                                            <td align="left" width="80%">
                                                <asp:TextBox ID="TempoDoVoluntarioTextBox" runat="server" class="txtFormulario" Text='<%# Bind("TempoDoVoluntario") %>'
                                                    Width="98%" ToolTip="Quanto tempo voc� j� presta servi�os voluntarios." />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                <br />
                                                <asp:Button ID="InsertButton" runat="server" CausesValidation="True" OnClick="Inserir_Click"
                                                    SkinID="btnFormularioCadastro" Text="Enviar Interesse" ToolTip="Click neste bot�o para enviar seu interesse." />
                                                &nbsp;<asp:Button ID="CancelButton" runat="server" CausesValidation="False" OnClick="Cancel_Click"
                                                    SkinID="btnFormularioCadastro" Text="Cancelar" ToolTip="Click neste bot�o para cancelar seu interesse." />
                                                <br />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="lblPreenchimentoObrigatorio" colspan="2">
                                                <br />
                                                (*) campo de preenchimento obrigat�rio.
                                                <br />
                                                <br />
                                            </td>
                                        </tr>
                                    </caption>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
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
                    <asp:Button ID="btnCancelar" runat="server" Text="N�o" OnClick="btnCancelar_Click"
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
    <asp:CustomValidator ID="CustomValidatorContato" runat="server" ErrorMessage="CustomValidator"></asp:CustomValidator>
    <%--ModalPopup para dados inseridos com sucesso--%>
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
                    Muito Obrigado por seu interesse em ser volunt�rio. Logo entraremos em contato com voc�.
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
        RepositionMode="RepositionOnWindowResize" TargetControlID="btnModalPopupCancelar" BackgroundCssClass="modalBackground"
        OkControlID="btnVoltar" DropShadow="true" PopupDragHandleControlID="Panel3">
    </cc1:ModalPopupExtender>
</asp:Content>
