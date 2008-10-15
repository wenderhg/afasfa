<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="cadastro_voluntarios.aspx.cs" Inherits="AFASFA.Cadastros.cadastro_voluntarios" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
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
    
    <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1" DefaultMode="Insert"
        BackColor="#E6E7F2" BorderColor="#ECFFFF" BorderStyle="Ridge" 
        ondatabound="FormView1_DataBound">
        <InsertItemTemplate>
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <tr>
                        <br />
                        <td colspan="2" class="TextoTitulo" align="center">
                            SEJA VOLUNT�RIO
                            <br />
                            <br />
                        </td>
                    </tr>
                </tr>
                <tr>
                    <td colspan="2" class="TextoPagina" align="justify">
                        Ol� !!!! Muito Obrigado por sua visita em nosso site......
                        <br />
                        <br />
                        O servi�o volunt�rio � de extrema import�ncia para o Lar, todos nossos eventos e
                        projetos realizados dependem da ajuda de nossos volunt�rios.
                        <br />
                        <br />
                        Caso Necessite de Ajuda click aqui !!!!
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width="20%" align="right" class="lblFomulario">
                                    <strong style="color: Red">*</strong> Nome:
                                </td>
                                <td width="80%" align="left">
                                    <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' Width="98%"
                                        class="txtFormulario" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorNomeTextBox" runat="server"
                                        ErrorMessage="Nomde � de preenchimento obrigat�rio" ControlToValidate="NomeTextBox"
                                        Display="None">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right" class="lblFomulario">
                                    <strong style="color: Red">*</strong> Apelido:
                                </td>
                                <td width="80%" align="left">
                                    <asp:TextBox ID="ApelidoTextBox" runat="server" Text='<%# Bind("Apelido") %>' Width="30%"
                                        class="txtFormulario" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorApelidoTextBox" runat="server"
                                        ErrorMessage="Apelido � de preenchimento obrigat�rio" ControlToValidate="ApelidoTextBox"
                                        Display="None">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right" class="lblFomulario">
                                    <strong style="color: Red">*</strong> Data de Nascimento:
                                </td>
                                <td width="80%" align="left">
                                    <asp:TextBox ID="DataNascimentoTextBox" runat="server" Text='<%# Bind("DataNascimento") %>'
                                        Width="16%" class="txtFormulario" />
                                    <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" MaskType="Date" AcceptNegative="None"
                                        Mask="99/99/9999" TargetControlID="DataNascimentoTextBox" UserDateFormat="DayMonthYear"
                                        AutoComplete="true" AutoCompleteValue="09/08/2008">
                                    </cc1:MaskedEditExtender>
                                    <asp:Image runat="server" ID="imgCalendarioDataNascimento" ImageUrl="../Imagens/Calendar.bmp" />
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Animated="true" Format="dd/MM/yyyy"
                                        TargetControlID="DataNascimentoTextBox" PopupButtonID="imgCalendarioDataNascimento">
                                    </cc1:CalendarExtender>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" Display="None" ControlToValidate="DataNascimentoTextBox"
                                        ErrorMessage="Data de nascimento � inv�lida." Type="Date" Operator="DataTypeCheck">
                                    </asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right" class="lblFomulario">
                                    Nacionalidade:
                                </td>
                                <td width="80%" align="left">
                                    <asp:RadioButtonList ID="rblNacionalidade" runat="server">
                                        <asp:ListItem Text="Brasileira" Value="B"></asp:ListItem>
                                        <asp:ListItem Text="Estrangeira" Value="E"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right" class="lblFomulario">
                                    <strong style="color: Red">*</strong> Estado de Origem:
                                </td>
                                <td width="80%" align="left">
                                    <asp:DropDownList ID="EstadoOrigemDropDownList" runat="server" DataTextField="Nome"
                                        DataValueField="Codigo" />
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right" class="lblFomulario">
                                    <strong style="color: Red">*</strong> Cidade Origem:
                                </td>
                                <td width="80%" align="left">
                                    <asp:TextBox ID="CidadeOrigemCheckBoxList" runat="server" class="txtFormulario" Width="200%" />
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right" class="lblFomulario">
                                    <strong style="color: Red">*</strong> CEP:
                                </td>
                                <td width="80%" align="left">
                                    <asp:TextBox ID="CepTextBox" runat="server" Text='<%# Bind("[Cep]") %>' class="txtFormulario"
                                        Width="16%" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="CEP � de preenchimento obrigat�rio"
                                        ControlToValidate="CepTextBox" Display="None">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right" class="lblFomulario">
                                    Logradouro:
                                </td>
                                <td width="80%" align="left">
                                    <asp:TextBox ID="LogradouroTextbox" runat="server" Text='<%# Bind("[Logradouro]") %>'
                                        class="txtFormulario" Width="98%" Enabled="false" />
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right" class="lblFomulario">
                                    <strong style="color: Red">*</strong> N�mero:
                                </td>
                                <td width="80%" align="left">
                                    <asp:TextBox ID="NumeroTextbox" runat="server" Text='<%# Bind("[Numero]") %>' class="txtFormulario"
                                        Width="10%" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="N�mero � de preenchimento obrigat�rio"
                                        ControlToValidate="NumeroTextbox" Display="None">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right" class="lblFomulario">
                                    Complemento:
                                </td>
                                <td width="80%" align="left">
                                    <asp:TextBox ID="ComplementoTextbox" runat="server" Text='<%# Bind("[Complemento]") %>'
                                        class="txtFormulario" Width="30%" />
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right" class="lblFomulario">
                                    Bairro:
                                </td>
                                <td width="80%" align="left">
                                    <asp:TextBox ID="BairroTextBox" runat="server" Text='<%# Bind("[Bairro]") %>' class="txtFormulario"
                                        Width="40%" Enabled="false" />
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right" class="lblFomulario">
                                    Cidade:
                                </td>
                                <td width="80%" align="left">
                                    <asp:TextBox ID="CidadeTextBox" runat="server" Text='<%# Bind("[Cidade]") %>' class="txtFormulario"
                                        Width="40%" Enabled="false" />
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right" class="lblFomulario">
                                    <strong style="color: Red">*</strong> UF:
                                </td>
                                <td width="80%" align="left">
                                    <asp:TextBox ID="UfTextBox" runat="server" Text='<%# Bind("[Uf]") %>' class="txtFormulario"
                                        Width="10%" Enabled="false" />
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="right" class="lblFomulario">
                                    E-mail:
                                </td>
                                <td width="80%" align="left">
                                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("[Email]") %>' class="txtFormulario"
                                        Width="98%" ToolTip="E-mail ser� usado como contato principal caso seja informado" />
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    <strong style="color: Red">*</strong> Telefone Residencial/Contato:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="TelefoneResTextBox" runat="server" Text='<%# Bind("TelefoneRes") %>'
                                        Width="25%" class="txtFormulario" />
                                    <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" MaskType="Number"
                                        AcceptNegative="None" Mask="(99)9999-9999" TargetControlID="TelefoneResTextBox"
                                        AutoComplete="true">
                                    </cc1:MaskedEditExtender>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTelefoneRes" runat="server"
                                        ErrorMessage="Telefone residencial � de preenchimento obrigat�rio" ControlToValidate="TelefoneResTextBox"
                                        Display="None">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    Telefone Celular:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="TelefoneCelTextBox" runat="server" Text='<%# Bind("TelefoneCel") %>'
                                        Width="25%" class="txtFormulario" />
                                    <cc1:MaskedEditExtender ID="MaskedEditExtender3" runat="server" MaskType="Number"
                                        AcceptNegative="None" Mask="(99)9999-9999" TargetControlID="TelefoneCelTextBox"
                                        AutoComplete="true">
                                    </cc1:MaskedEditExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    Possui Habilita��o:
                                </td>
                                <td align="left">
                                    <asp:CheckBox ID="HabilitadoCheckBox" runat="server" Checked='<%# Bind("Habilitado") %>'
                                        Width="10%" class="txtFormulario" />
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    Estado C�vil:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="EstadoCivilTextBox" runat="server" Text='<%# Bind("EstadoCivil") %>'
                                        Width="10%" class="txtFormulario" />
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    Esta Trabalhando:
                                </td>
                                <td align="left">
                                    <asp:CheckBox ID="TrabalhoCheckBox" runat="server" Checked='<%# Bind("Trabalho") %>'
                                        Width="98%" class="txtFormulario" />
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    Escolaridade:
                                </td>
                                <td align="left">
                                    <asp:CheckBox ID="EscolaridadeCheckBox" runat="server" Checked='<%# Bind("Escolaridade") %>'
                                        Width="98%" class="txtFormulario" />
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    Profiss�o:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="ProfissaoTextBox" runat="server" Text='<%# Bind("Profissao") %>'
                                        Width="98%" class="txtFormulario" />
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    Local de Trabalho:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="Local_de_TrabalhoTextBox" runat="server" Text='<%# Bind("[Local de Trabalho]") %>'
                                        Width="98%" class="txtFormulario" />
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    Como ficou sabendo de nossa institui��o:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="ComoFicouSabendoTextBox" runat="server" Text='<%# Bind("ComoFicouSabendo") %>'
                                        Width="98%" class="txtFormulario" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <br />
                                    <table cellpadding="5px" cellspacing="0" width="100%">
                                        <tr bgcolor="#495196">
                                            <td colspan="2" align="center" class="lblCaptionGrid">
                                                Qual forma gostaria de colaborar com nossa Institui��o.
                                            </td>
                                        </tr>
                                        <tr align="center">
                                            <td align="left" colspan="2">
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td>
                                                            <asp:RadioButton ID="TipoVoluntarioCheckBox" runat="server" Text="Volunt�rio Direto"
                                                                GroupName="TipoVoluntario" class="txtFormulario" />
                                                        </td>
                                                        <td class="txtFormulario">
                                                            Trabalho dentro de organiza��o.
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:RadioButton ID="TipoVoluntarioCheckBox1" runat="server" Text="Volunt�rio Indireto"
                                                                GroupName="TipoVoluntario" class="txtFormulario" />
                                                        </td>
                                                        <td class="txtFormulario">
                                                            Trabalho foda da organiza��o.
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    Qual atividade gostaria de desempenhar:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="QualAtividadeTextBox" runat="server" Text='<%# Bind("QualAtividade") %>'
                                        Width="98%" class="txtFormulario" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <br />
                                    <table cellpadding="5px" cellspacing="0" width="100%">
                                        <tr bgcolor="#495196">
                                            <td colspan="2" align="center" class="lblCaptionGrid">
                                                Qual sua disponibilidade de tempo para estar nos auxiliando voluntariamente.
                                            </td>
                                        </tr>
                                        <tr align="center">
                                            <td align="left" colspan="2">
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td>
                                                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("QualDisponibilidade") %>'
                                                                Text="02 Horas ao dia" class="txtFormulario" />
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("QualDisponibilidade") %>'
                                                                Text="04 Horas ao dia" class="txtFormulario" />
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("QualDisponibilidade") %>'
                                                                Text="06 Horas ao dia" class="txtFormulario" />
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("QualDisponibilidade") %>'
                                                                Text="08 Horas ao dia" class="txtFormulario" />
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
                                            <td colspan="2" align="center" class="lblCaptionGrid">
                                                Qual seria o melhor dia da semana para estar nos auxiliando voluntariamente.
                                            </td>
                                        </tr>
                                        <tr align="center">
                                            <td align="left" colspan="2">
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td>
                                                            <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Bind("QuaisDias") %>' Text="Segunda"
                                                                class="txtFormulario" />
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# Bind("QuaisDias") %>' Text="Ter�a"
                                                                class="txtFormulario" />
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Bind("QuaisDias") %>' Text="Quarta"
                                                                class="txtFormulario" />
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="CheckBox8" runat="server" Checked='<%# Bind("QuaisDias") %>' Text="Quinta"
                                                                class="txtFormulario" />
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="CheckBox9" runat="server" Checked='<%# Bind("QuaisDias") %>' Text="Sexta"
                                                                class="txtFormulario" />
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="CheckBox10" runat="server" Checked='<%# Bind("QuaisDias") %>' Text="S�bado"
                                                                class="txtFormulario" />
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="CheckBox11" runat="server" Checked='<%# Bind("QuaisDias") %>' Text="Domingo"
                                                                class="txtFormulario" />
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
                    <td width="20%" class="lblFomulario" align="right">
                        Aceita Termo:
                    </td>
                    <td width="80%" align="left">
                        <asp:CheckBox ID="AceitaTermoCheckBox" runat="server" Checked='<%# Bind("AceitaTermo") %>'
                            class="txtFormulario" />
                    </td>
                </tr>
                <tr>
                    <td width="20%" class="lblFomulario" align="right">
                        Tempo de Volunt�rio:
                    </td>
                    <td width="80%" align="left">
                        <asp:TextBox ID="TempoDoVoluntarioTextBox" runat="server" Text='<%# Bind("TempoDoVoluntario") %>'
                            class="txtFormulario" Width="98%" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Enviar Interesse" SkinID="btnFormularioCadastro" />
                        &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancelar" SkinID="btnFormularioCadastro" />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="lblPreenchimentoObrigatorio" align="center">
                        <br />
                        (*) campo de preenchimento obrigat�rio
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
            </td> </tr> </table>
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
</asp:Content>
