<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="cadastro_eventos.aspx.cs" Inherits="AFASFA.Cadastros.cadastro_eventos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" InsertMethod="Insert" 
        TypeName="AFASFA.acesso_dados.DataSetAfasfaTableAdapters.eventosTableAdapter" 
        DeleteMethod="Delete" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_EVENTO" Type="UInt32" />
        </DeleteParameters>
        <UpdateParameters>
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
            <asp:Parameter Name="Original_EVENTO" Type="UInt32" />
        </UpdateParameters>
        <InsertParameters>
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
        DefaultMode="Insert" OnItemInserting="FormView1_ItemInserting" OnItemInserted="FormView1_ItemInserted">
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
                                            CADASTRO DE EVENTOS
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
                                            onde serão apresentados os eventos realizados pelo Lar, por isso os dados devem
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
                                                        <strong style="color: Red">*</strong> Descrição:
                                                    </td>
                                                    <td width="80%" align="left">
                                                        <asp:TextBox ID="DescricaoTextBox" runat="server" Text='<%# Bind("Descricao") %>'
                                                            Width="98%" class="txtFormulario" ToolTip="Informe a descrição ou nome do evento." />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDescricaoTextBox" runat="server"
                                                            ErrorMessage="Descrição é de preenchimento obrigatório" ControlToValidate="DescricaoTextBox"
                                                            Display="None" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lblFomulario" align="right">
                                                        <strong style="color: Red">*</strong> Data de Realização:
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="DataEventoTextBox" runat="server" Width="20%" class="txtFormulario"
                                                            ToolTip="Informe a data de realização do evento." />
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
                                                        <strong style="color: Red">*</strong> Local do Evento:
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="LocalEventoTextBox" runat="server" Text='<%# Bind("LocalEvento") %>'
                                                            Width="98%" class="txtFormulario" ToolTip="Informe o local onde será realizado o evento." />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorLocalEventoTextBox" runat="server"
                                                            ErrorMessage="Local do Evento é de preenchimento obrigatório" ControlToValidate="LocalEventoTextBox"
                                                            Display="None" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lblFomulario" align="right">
                                                        Foto Inicial:
                                                    </td>
                                                    <td align="left">
                                                        <%--<asp:TextBox ID="FotoInicialTextBox" runat="server" Text='<%# Bind("FotoInicial") %>'
                                        Width="50%" class="txtFormulario" />--%>
                                                        <asp:FileUpload ID="UploadFotoEvento" runat="server" SkinID="upFile" Width="98%"
                                                            CssClass="txtFormulario" ToolTip="Selecione uma foto sobre o evento para ser apresentada ao público." />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lblFomulario" align="right">
                                                        Evento Já Realizado:
                                                    </td>
                                                    <td class="txtFormulario" align="left">
                                                        <asp:CheckBox ID="chkJaRealizado" runat="server" OnCheckedChanged="chkJaRealizado_OnCheckedChanged"
                                                            AutoPostBack="true" CssClass="lblFomulario" ToolTip="Informe se o evento já foi realizado."
                                                            Checked="false" />
                                                        <asp:Label ID="lblJaRealizado" runat="server" CssClass="lblFomulario" Text="Evento já realizado."
                                                            Visible="false"></asp:Label>
                                                        <asp:Label ID="lblNaoRealizado" runat="server" CssClass="lblFomulario" Text="Evento não realizado"
                                                            Visible="True"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lblFomulario" align="right">
                                                        Apresentar Evento:
                                                    </td>
                                                    <td class="txtFormulario" align="left">
                                                        <asp:CheckBox ID="ApresentarCheckBox" runat="server" CssClass="lblFomulario" ToolTip="Informe se o evento deverá ser apresentado."
                                                            AutoPostBack="true" OnCheckedChanged="ApresentarCheckBox_OnCheckedChanged" Checked="true" />
                                                        <asp:Label ID="lblNaoApresentarEvento" runat="server" CssClass="lblFomulario" Text="Evento não será apresentado."
                                                            Visible="false"></asp:Label>
                                                        <asp:Label ID="lblApresentarEvento" runat="server" CssClass="lblFomulario" Text="Evento será apresentado."
                                                            Visible="true"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lblFomulario" align="right">
                                                        Reserva de Convite Disponível:
                                                    </td>
                                                    <td align="left">
                                                        <asp:CheckBox class="txtFormulario" ID="ReservaDisponivelCheckBox" runat="server"
                                                            Checked="true" ToolTip="Informe se existe convites para serem reservados." AutoPostBack="true"
                                                            OnCheckedChanged="ReservaDisponivelCheckBox_OnCheckedChanged" />
                                                        <asp:Label ID="ReservaDisponivel" runat="server" CssClass="lblFomulario" Text="Convites disponíveis para reserva."
                                                            Visible="true"></asp:Label>
                                                        <asp:Label ID="ReservaNaoDisponivel" runat="server" CssClass="lblFomulario" Text="Convites não disponíveis para reserva."
                                                            Visible="false"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lblFomulario" align="right">
                                                        Data Máxima para Apresentação:
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="DataMaximaTextBox" runat="server" Text='<%# Bind("DataMaxima") %>'
                                                            Width="20%" class="txtFormulario" ToolTip="Informe a data máxima para apresentação na página de divulgação dos eventos." />
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
                                                            Width="20%" MaxLength="1" class="txtFormulario" ToolTip="Informe o valor dos convites para adultos" />
                                                        <br />
                                                        <cc1:MaskedEditExtender ID="MaskedEditExtender3" runat="server" Mask="999,999.99"
                                                            MaskType="Number" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus"
                                                            TargetControlID="ValorConviteAdultoTextBox" CultureName="pt-BR" InputDirection="RightToLeft">
                                                        </cc1:MaskedEditExtender>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorValorConviteAdultoTextBox"
                                                            runat="server" ErrorMessage="Valor do convite para adulto é de preenchimento obrigatório"
                                                            ControlToValidate="ValorConviteAdultoTextBox" Display="None" SetFocusOnError="true">
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lblFomulario" align="right">
                                                        <strong style="color: Red">*</strong> Valor do Convite para Crianças R$:
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="ValorConviteCriancaTextBox" runat="server" Text='<%# Bind("ValorConviteC") %>'
                                                            Width="20%" MaxLength="1" class="txtFormulario" ToolTip="Informe o valor dos convites para crianças" />
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
                                                            ControlToValidate="ValorConviteCriancaTextBox" Display="None" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lblFomulario" align="right">
                                                        Observação:
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="ObservacaoTextBox" runat="server" Text='<%# Bind("Observacao") %>'
                                                            class="txtFormulario" Width="98%" ToolTip="Digite informações diversas sobre o evento." />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="center">
                                                        <br />
                                                        <asp:Button ID="InsertButton" runat="server" Text="Salvar Dados" CausesValidation="true"
                                                            CommandName="Insert" SkinID="btnFormularioCadastro" ToolTip="Click neste botão para salvar os dados" />
                                                        <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" Text="Cancelar"
                                                            SkinID="btnFormularioCadastro" OnClick="InsertCancelButton_Click" ToolTip="Click neste botão para cancelar os dados" />
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" class="lblPreenchimentoObrigatorio" align="center">
                                                        <br />
                                                        (*) campo de preenchimento obrigatório.
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
        <table width="100%" height="100%">
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
    <%--ModalPopup para resposta de inclusão de eventos--%>
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
        <table width="100%" height="100%">
            <tr>
                <td align="center" class="lblPerguntaModalPop">
                    Cadastro efetuado com sucesso. O Evento já estará disponível para ser apresentado
                    na página aberta ao público conforme suas configurações. Muito Obrigado.
                    <br />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Button ID="btnVoltar1" runat="server" Text="OK" UseSubmitBehavior="false"
                        SkinID="btnFormularioCadastro" CausesValidation="false" OnClick="btnVoltar1_onClick" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="pnObrigado"
        RepositionMode="RepositionOnWindowResize" TargetControlID="btnModalPopupCancelar"
        BackgroundCssClass="modalBackground" OkControlID="btnVoltar1" DropShadow="true"
        PopupDragHandleControlID="Panel3">
    </cc1:ModalPopupExtender>
    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="CustomValidator"></asp:CustomValidator>
</asp:Content>
