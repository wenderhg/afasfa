<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="cadastro_eventos.aspx.cs" Inherits="AFASFA.Cadastros.cadastro_eventos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="acesso_dados.DataSetAFASFATableAdapters.eventosTableAdapter"
        DeleteMethod="Delete" UpdateMethod="Update">
        <InsertParameters>
<%--            <asp:Parameter Name="EVENTO" Type="UInt32" />--%>
            <asp:Parameter Name="DESCRICAO" Type="String" />
            <asp:Parameter Name="DATAEVENTO" Type="DateTime" />
            <asp:Parameter Name="LOCALEVENTO" Type="String" />
            <%--<asp:Parameter Name="FOTOINICIAL" Type="String" />--%>
            <asp:Parameter Name="JAREALIZADO" Type="Byte" />
            <asp:Parameter Name="APRESENTAR" Type="Byte" />
            <asp:Parameter Name="RESERVADISPONIVEL" Type="Byte" />
            <asp:Parameter Name="DATAMAXIMA" Type="DateTime" />
            <asp:Parameter Name="VALORCONVITEA" Type="String" />
            <asp:Parameter Name="VALORCONVITEC" Type="String" />
            <asp:Parameter Name="OBSERVACAO" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Evento" DataSourceID="ObjectDataSource1"
        DefaultMode="Insert" BackColor="#E6E7F2" BorderColor="#ECFFFF" BorderStyle="Ridge">
        <InsertItemTemplate>
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <tr>
                        <br />
                        <td colspan="2" class="TextoTitulo" align="center">
                            CADASTRO DE EVENTOS
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
                                    <strong style="color: Red">*</strong> Descrição:
                                </td>
                                <td width="80%" align="left">
                                    <asp:TextBox ID="DescricaoTextBox" runat="server" Text='<%# Bind("Descricao") %>'
                                        Width="98%" class="txtFormulario" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDescricaoTextBox" runat="server"
                                        ErrorMessage="Descrição é de preenchimento obrigatório" ControlToValidate="DescricaoTextBox"
                                        Display="None"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    <strong style="color: Red">*</strong> Data:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="DataEventoTextBox" runat="server" Text='<%# Bind("Dataevento") %>'
                                        Width="16%" class="txtFormulario" />
                                    <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" MaskType="Date" AcceptNegative="None"
                                        Mask="99/99/9999" TargetControlID="DataEventoTextBox" UserDateFormat="DayMonthYear"
                                        AutoComplete="true" AutoCompleteValue="09/08/2008">
                                    </cc1:MaskedEditExtender>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDataEventoTextBox" runat="server"
                                        ErrorMessage="Data do Evento é de preenchimento obrigatório." ControlToValidate="DataEventoTextBox"
                                        SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                                    <asp:Image runat="server" ID="imgCalendarioDataEvento" ImageUrl="../Imagens/Calendar.bmp" />
                                    <cc1:CalendarExtender ID="CalendarExtenderDataDoacao" runat="server" Animated="true"
                                        Format="dd/MM/yyyy" TargetControlID="DataEventoTextBox" PopupButtonID="imgCalendarioDataEvento">
                                    </cc1:CalendarExtender>
                                    <asp:CompareValidator ID="CompareValidatorDataEventoTextBox" runat="server" Display="None"
                                        ControlToValidate="DataEventoTextBox" ErrorMessage="Data do evento inválida."
                                        Type="Date" Operator="DataTypeCheck"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    <strong style="color: Red">*</strong> Local:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="LocalEventoTextBox" runat="server" Text='<%# Bind("LocalEvento") %>'
                                        Width="98%" class="txtFormulario" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLocalEventoTextBox" runat="server"
                                        ErrorMessage="Local do Evento é de preenchimento obrigatório" ControlToValidate="LocalEventoTextBox"
                                        Display="None"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    Foto Inicial:
                                </td>
                                <td align="left">
                                    <%--<asp:TextBox ID="FotoInicialTextBox" runat="server" Text='<%# Bind("FotoInicial") %>'
                                        Width="50%" class="txtFormulario" />--%>
                                    <asp:FileUpload ID="UploadFotoEvento" runat="server" BackColor="#666699" BorderColor="#003366"
                                        BorderStyle="Double" BorderWidth="2px" CssClass="lblBtnFomularioCadastro" Font-Names="Verdana"
                                        ForeColor="White" Width="98%"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    Já Realizado:
                                </td>
                                <td class="txtFormulario" align="left">
                                    <asp:CheckBox ID="JaRealizadoCheckBox" runat="server" Checked='<%# Bind("JaRealizado") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    Apresentar:
                                </td>
                                <td class="txtFormulario" align="left">
                                    <asp:CheckBox ID="ApresentarCheckBox" runat="server" Checked='<%# Bind("Apresentar") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    Reserva Disponível:
                                </td>
                                <td align="left">
                                    <asp:CheckBox class="txtFormulario" ID="ReservaDisponivelCheckBox" runat="server"
                                        Checked='<%# Bind("ReservaDisponivel") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    Data Máxima para Apresentação:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="DataMaximaTextBox" runat="server" Text='<%# Bind("DataMaxima") %>'
                                        Width="16%" class="txtFormulario" />
                                    <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" MaskType="Date" AcceptNegative="None"
                                        Mask="99/99/9999" TargetControlID="DataMaximaTextBox" UserDateFormat="DayMonthYear"
                                        AutoComplete="true" AutoCompleteValue="09/08/2008">
                                    </cc1:MaskedEditExtender>
                                    <asp:Image runat="server" ID="imgCalendarioDataMaxima" ImageUrl="../Imagens/Calendar.bmp" />
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Animated="true" Format="dd/MM/yyyy"
                                        TargetControlID="DataMaximaTextBox" PopupButtonID="imgCalendarioDataMaxima">
                                    </cc1:CalendarExtender>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" Display="None" ControlToValidate="DataMaximaTextBox"
                                        ErrorMessage="Data máxima para apresentar o evento inválida." Type="Date" Operator="DataTypeCheck">
                                    </asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    <strong style="color: Red">*</strong> Valor do Convite para Adultos R$:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="ValorConviteAdultoTextBox" runat="server" Text='<%# Bind("ValorConviteA") %>'
                                        Width="20%" MaxLength="1" class="txtFormulario" />
                                    <br />
                                    <cc1:MaskedEditExtender ID="MaskedEditExtender3" runat="server" Mask="999,999.99"
                                        MaskType="Number" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus"
                                        TargetControlID="ValorConviteAdultoTextBox" CultureName="pt-BR" InputDirection="RightToLeft">
                                    </cc1:MaskedEditExtender>
                                    <%--<cc1:MaskedEditValidator ID="MaskedEditValidator2" runat="server" ControlExtender="MaskedEditExtender3"
                                        ControlToValidate="ValorConviteAdultoTextBox" Display="Dynamic" IsValidEmpty="False">
                                    </cc1:MaskedEditValidator>--%>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorValorConviteAdultoTextBox"
                                        runat="server" ErrorMessage="Valor do convite para adulto é de preenchimento obrigatório"
                                        ControlToValidate="ValorConviteAdultoTextBox" Display="None">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    <strong style="color: Red">*</strong> Valor do Convite para Crianças R$:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="ValorConviteCriancaTextBox" runat="server" Text='<%# Bind("ValorConviteC") %>'
                                        Width="20%" MaxLength="1" class="txtFormulario" />
                                    <cc1:MaskedEditExtender ID="MaskedEditExtender4" runat="server" Mask="999,999.99"
                                        MaskType="Number" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError" TargetControlID="ValorConviteCriancaTextBox"
                                        CultureName="pt-BR" InputDirection="RightToLeft">
                                    </cc1:MaskedEditExtender>
                                    <%--<cc1:MaskedEditValidator ID="MaskedEditValidator2" runat="server" ControlExtender="MaskedEditExtender3"
                                        ControlToValidate="ValorConviteAdultoTextBox" Display="Dynamic" IsValidEmpty="False">
                                    </cc1:MaskedEditValidator>--%>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorValorConviteCriancaTextBox"
                                        runat="server" ErrorMessage="Valor do convite para criança é de preenchimento obrigatório"
                                        ControlToValidate="ValorConviteCriancaTextBox" Display="None"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    Observação:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="ObservacaoTextBox" runat="server" Text='<%# Bind("Observacao") %>'
                                        class="txtFormulario" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <br />
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Salvar Dados"
                                        SkinID="btnFormularioCadastro" />
                                    <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" Text="Cancelar"
                                        SkinID="btnFormularioCadastro" OnClick="InsertCancelButton_Click" />
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
