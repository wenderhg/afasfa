<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="cadastro_eventos.aspx.cs" Inherits="AFASFA.Cadastros.cadastro_eventos" %>

<%@ Register Assembly="AjaxControlToolkit, Version=3.0.20820.16598, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e"
    Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
        TypeName="acesso_dados.AFASFATableAdapters.eventosTableAdapter">
        <DeleteParameters>
            <asp:Parameter Name="Original_EVENTO" Type="UInt32" />
            <asp:Parameter Name="Original_DESCRICAO" Type="String" />
            <asp:Parameter Name="Original_DATAEVENTO" Type="DateTime" />
            <asp:Parameter Name="Original_LOCALEVENTO" Type="String" />
            <asp:Parameter Name="Original_FOTOINICIAL" Type="String" />
            <asp:Parameter Name="Original_JAREALIZADO" Type="Byte" />
            <asp:Parameter Name="Original_APRESENTAR" Type="Byte" />
            <asp:Parameter Name="Original_RESERVADISPONIVEL" Type="Byte" />
            <asp:Parameter Name="Original_DATAMAXIMA" Type="DateTime" />
            <asp:Parameter Name="Original_VALORCONVITEA" Type="String" />
            <asp:Parameter Name="Original_VALORCONVITEC" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="EVENTO" Type="UInt32" />
            <asp:Parameter Name="DESCRICAO" Type="String" />
            <asp:Parameter Name="DATAEVENTO" Type="DateTime" />
            <asp:Parameter Name="LOCALEVENTO" Type="String" />
            <asp:Parameter Name="FOTOINICIAL" Type="String" />
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
        DefaultMode="Insert" BackColor="#E6E7F2" BorderColor="#ecffff" BorderStyle="Ridge">
        <InsertItemTemplate>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <tr>
                        <br />
                        <td colspan="2" class="TextoTitulo" align="center">
                            CADASTRAR EVENTOS
                            <br />
                            <br />
                        </td>
                    </tr>
                </tr>
                <tr>
                    <td colspan="2" class="TextoPagina" align="justify">
                        As informações inseridas neste cadastro serão apresentadas na consulta de eventos.
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <table>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    <strong>*</strong> Descrição:
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
                                    <strong>*</strong> Data:
                                </td>
                                <td align="left" valign="middle">
                                    <asp:TextBox ID="DataEventoTextBox" runat="server" Text='<%# Bind("Dataevento") %>'
                                        Width="80" class="txtFormulario" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDataEventoTextBox" runat="server"
                                        ErrorMessage="Data do Evento é de preenchimento obrigatório." ControlToValidate="DataEventoTextBox"
                                        SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                                    <asp:ImageButton ImageUrl="../Imagens/Calendar.bmp" runat="server" />
                                    <cc1:CalendarExtender ID="CalendarExtenderDataDoacao" runat="server" Animated="true"
                                        Format="dd/MM/yyyy" PopupPosition="BottomRight" TargetControlID="DataEventoTextBox">
                                    </cc1:CalendarExtender>
                                    <asp:CompareValidator ID="CompareValidatorDataEventoTextBox" runat="server" Display="None"
                                        ControlToValidate="DataEventoTextBox" ErrorMessage="Data do evento inválida."
                                        Type="Date" Operator="DataTypeCheck"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    <strong>*</strong> Local:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="LocalEventoTextBox" runat="server" Text='<%# Bind("LocalEvento") %>'
                                        Width="390" class="txtFormulario" />
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
                                    <asp:TextBox ID="FotoInicialTextBox" runat="server" Text='<%# Bind("FotoInicial") %>'
                                        Width="390" class="txtFormulario" />
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    Já Realizado:
                                </td>
                                <td align="left">
                                    <asp:CheckBox ID="JaRealizadoCheckBox" runat="server" Checked='<%# Bind("JaRealizado") %>'
                                        class="txtFormulario" />
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    Apresentar:
                                </td>
                                <td align="left">
                                    <asp:CheckBox ID="ApresentarCheckBox" runat="server" Checked='<%# Bind("Apresentar") %>'
                                        class="txtFormulario" />
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    Reserva Disponível:
                                </td>
                                <td align="left">
                                    <asp:CheckBox ID="ReservaDisponivelCheckBox" runat="server" Checked='<%# Bind("ReservaDisponivel") %>'
                                        class="txtFormulario" />
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    Data Máxima para Apresentação:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="DataMaximaTextBox" runat="server" Text='<%# Bind("DataMaxima") %>'
                                        class="txtFormulario" />
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    <strong>*</strong> Valor do Convite para Adultos R$:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="ValorConviteAdultoTextBox" runat="server" Text='<%# Bind("ValorConviteAdulto") %>'
                                        Width="80" class="txtFormulario" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorValorConviteAdultoTextBox"
                                        runat="server" ErrorMessage="Valor do Convite para Adulto é de preenchimento obrigatório"
                                        ControlToValidate="ValorConviteAdultoTextBox" Display="None"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="lblFomulario" align="right">
                                    <strong>*</strong> Valor do Convite para Crianças R$:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="ValorConviteCriancaTextBox" runat="server" Text='<%# Bind("ValorConviteCrianca") %>'
                                        Width="80" class="txtFormulario" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorValorConviteCriancaTextBox"
                                        runat="server" ErrorMessage="Valor do Convite para Adulto é de preenchimento obrigatório"
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
                                    <asp:Button ID="InsertButton" runat="server" CausesValidation="False" CommandName="Insert"
                                        Text="Salvar Dados" SkinID="btnFormularioCadastro" />
                                    <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                        Text="Cancelar" SkinID="btnFormularioCadastro" OnClick="InsertCancelButton_Click" />
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
