<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="cadastro_doacoes.aspx.cs" Inherits="AFASFA.cadastros.cadastro_doacoes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
        TypeName="acesso_dados.AFASFATableAdapters.doacoesTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_DOACAO" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="NOME" Type="String" />
            <asp:Parameter Name="DATADOACAO" Type="DateTime" />
            <asp:Parameter Name="ITENS" Type="String" />
            <asp:Parameter Name="ENDERECO" Type="String" />
            <asp:Parameter Name="BAIRRO" Type="String" />
            <asp:Parameter Name="DISPONIBILIDADE" Type="String" />
            <asp:Parameter Name="OBSERVACAO" Type="String" />
            <asp:Parameter Name="ESTADO" Type="String" />
            <asp:Parameter Name="TELEFONERES" Type="Decimal" />
            <asp:Parameter Name="TELEFONECEL" Type="Decimal" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="Original_DOACAO" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="NOME" Type="String" />
            <asp:Parameter Name="DATADOACAO" Type="DateTime" />
            <asp:Parameter Name="ENDERECO" Type="String" />
            <asp:Parameter Name="BAIRRO" Type="String" />
            <asp:Parameter Name="ITENS" Type="String" />
            <asp:Parameter Name="DISPONIBILIDADE" Type="String" />
            <asp:Parameter Name="OBSERVACAO" Type="String" />
            <asp:Parameter Name="ESTADO" Type="String" />
            <asp:Parameter Name="TELEFONERES" Type="String" />
            <asp:Parameter Name="TELEFONECEL" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Doacao" DefaultMode="Insert"
        DataSourceID="ObjectDataSource1" BackColor="#ecffff" BorderColor="#ecffff" BorderStyle="Ridge">
        <InsertItemTemplate>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <tr>
                        <td colspan="2" class="TextoTitulo">
                            <br />
                            DISPONIBILIZAR DOAÇÃO
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="TextoPagina">
                            Aceitamos todo e qualquer tipo de doação, que são de extrema importância para nosso
                            trabalho. As doações em dinheiro podem ser feitas através do Banco Itaú - Agência
                            0041 - Conta Corrente: 63.555-8.
                            <br />
                            <br />
                        </td>
                    </tr>
                    <td class="lblFomulario" align="right">
                        <strong>*</strong> Nome:
                    </td>
                    <td class="txtFormulario" align="left">
                        <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' Width="400" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNomeTextBox" runat="server"
                            ErrorMessage="Nome é de preenchimento obrigatório." ControlToValidate="NomeTextBox"
                            SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="lblFomulario" align="right">
                        <strong>*</strong> Data da Doação:
                    </td>
                    <td class="txtFormulario" align="left">
                        <asp:TextBox ID="DataDoacaoTextBox" runat="server" Text='<%# Bind("DataDoacao") %>'
                            Width="80" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDataDoacaoTextBox" runat="server"
                            ErrorMessage="Data da Doação é de preenchimento obrigatório." ControlToValidate="DataDoacaoTextBox"
                            SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                        <cc1:CalendarExtender ID="CalendarExtenderDataDoacao" runat="server" Animated="true"
                            Format="dd/MM/yyyy" PopupPosition="BottomRight" TargetControlID="DataDoacaoTextBox">
                        </cc1:CalendarExtender>
                        <asp:CompareValidator ID="CompareValidatorDataDoacao" runat="server" Display="None"
                            ControlToValidate="DataDoacaoTextBox" ErrorMessage="Data da doação inválida."
                            Type="Date" Operator="DataTypeCheck"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="lblFomulario" align="right">
                        <strong>*</strong> Endereço:
                    </td>
                    <td class="txtFormulario" align="left">
                        <asp:TextBox ID="EnderecoTextBox" runat="server" Text='<%# Bind("Endereco") %>' Width="400" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEnderecoTextBox" runat="server"
                            ErrorMessage="Endereço é de preenchimento obrigatório" ControlToValidate="EnderecoTextBox"
                            Display="None"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="lblFomulario" align="right">
                        <strong>*</strong> Bairro:
                    </td>
                    <td class="txtFormulario" align="left">
                        <asp:TextBox ID="BairroTextBox" runat="server" Text='<%# Bind("Bairro") %>' Width="200" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorBairroTextBox" runat="server"
                            ErrorMessage="Bairro é de preenchimento obrigatório" ControlToValidate="BairroTextBox"
                            Display="None"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="lblFomulario" align="right">
                        <strong>*</strong> Telefone Residencial/Contato:
                    </td>
                    <td class="txtFormulario" align="left">
                        <asp:TextBox ID="TelefoneResTextBox" runat="server" Text='<%# Bind("TelefoneRes") %>'
                            Width="80" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTelefoneRes" runat="server"
                            ErrorMessage="Telefone residencial é de preenchimento obrigatório" ControlToValidate="TelefoneResTextBox"
                            Display="None"></asp:RequiredFieldValidator>
                        <cc1:MaskedEditExtender runat="server" id="maskTelefoneRes" >
                        </cc1:MaskedEditExtender>
                    </td>
                </tr>
                <tr>
                    <td class="lblFomulario" align="right">
                        Telefone Celular:
                    </td>
                    <td class="txtFormulario" align="left">
                        <asp:TextBox ID="TelefoneCelTextBox" runat="server" Text='<%# Bind("TelefoneCel") %>'
                            Width="80" />
                    </td>
                </tr>
                <tr>
                    <td class="lblFomulario" align="right">
                        email:
                    </td>
                    <td class="txtFormulario" align="left">
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' Width="300" />
                    </td>
                </tr>
                <tr>
                    <td class="lblFomulario" align="right">
                        <strong>*</strong> Itens de Doação:
                    </td>
                    <td class="txtFormulario" align="left">
                        <asp:TextBox ID="ItensTextBox" runat="server" Text='<%# Bind("Itens") %>' Columns="45"
                            Rows="3" TextMode="MultiLine" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorItensTextBox" runat="server"
                            ErrorMessage="Itens é de preenchimento obrigatório" ControlToValidate="ItensTextBox"
                            Display="None"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="lblFomulario" align="right">
                        <strong>*</strong> Disponibilidade:
                    </td>
                    <td class="txtFormulario" align="left">
                        <asp:TextBox ID="DisponibilidadeTextBox" runat="server" Text='<%# Bind("Disponibilidade") %>'
                            Columns="45" Rows="3" TextMode="MultiLine" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDisponibilidadeTextBox" runat="server"
                            ErrorMessage="Disponibilidade é de preenchimento obrigatório" ControlToValidate="DisponibilidadeTextBox"
                            Display="None"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="txtFormLogin" align="center">
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CausesValidation="True" Text="Enviar Dados"
                            CommandName="Insert" />
                        &nbsp;<asp:Button ID="btnInsertCancelButton" runat="server" CausesValidation="False"
                            OnClick="InsertCancelButton_Click" Text="Cancelar" />
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
    </asp:FormView>
    <asp:Panel ID="pnConfirmacao" runat="server" Style="display: none" CssClass="modalPopup">
        <asp:Panel ID="Panel3" runat="server" Style="cursor: move; background-color: #DDDDDD;
            border: solid 1px Gray; color: Black">
            <div>
                <p>
                    Confirmacao</p>
            </div>
        </asp:Panel>
        Confirma cancelamento?
        <br>
        <asp:Button ID="btnOK" runat="server" Text="Sim" OnClick="btnOK_Click" UseSubmitBehavior="false"
            SkinID="Outro" CausesValidation="false" />
        <asp:Button ID="btnCancelar" runat="server" Text="Não" OnClick="btnCancelar_Click"
            CausesValidation="false" />
    </asp:Panel>
    <asp:Button ID="btnModalPopupCancelar" runat="server" Text="" Style="display: none" />
    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnConfirmacao"
        RepositionMode="RepositionOnWindowResize" TargetControlID="btnModalPopupCancelar"
        BackgroundCssClass="modalBackground" OkControlID="btnOK" CancelControlID="btnCancelar"
        DropShadow="true" PopupDragHandleControlID="Panel3">
    </cc1:ModalPopupExtender>
</asp:Content>
