﻿<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="cadastro_doacoes.aspx.cs" Inherits="AFASFA.cadastros.cadastro_doacoes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AFASFA.acesso_dados.DataSetAfasfaTableAdapters.doacoesTableAdapter">
        <InsertParameters>
            <asp:Parameter Name="NOME" Type="String" />
            <asp:Parameter Name="DATADOACAO" Type="DateTime" />
            <asp:Parameter Name="ENDERECO" Type="String" />
            <asp:Parameter Name="BAIRRO" Type="String" />
            <asp:Parameter Name="ITENS" Type="String" />
            <asp:Parameter Name="DISPONIBILIDADE" Type="String" />
            <asp:Parameter Name="OBSERVACAO" Type="String" />
            <asp:Parameter Name="ESTADO" Type="String" DefaultValue="P" />
            <asp:Parameter Name="TELEFONERES" Type="String" />
            <asp:Parameter Name="TELEFONECEL" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Doacao" DefaultMode="Insert"
        DataSourceID="ObjectDataSource1" oniteminserted="FormView1_ItemInserted" 
        oniteminserting="FormView1_ItemInserting">
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
                                            DISPONIBILIZAR DOAÇÃO
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="TextoPagina" align="justify">
                                            Olá !!!!! Muito Obrigado por sua visita.
                                            <br />
                                            <br />
                                            Aceitamos todo e qualquer tipo de doação, que são de extrema importância para nosso
                                            trabalho. As doações em dinheiro podem ser feitas através do Banco Itaú - Agência
                                            0041 - Conta Corrente: 63.555-8.
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
                                            <table cellpadding="0" cellspacing="0" width="100%" border="0px">
                                                <tr>
                                                    <td width="20%" class="lblFomulario" align="right">
                                                        <strong style="color: Red">*</strong> Nome:
                                                    </td>
                                                    <td width="80%" align="left">
                                                        <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' Width="98%"
                                                            class="txtFormulario" ToolTip="Informe seu nome." />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNomeTextBox" runat="server"
                                                            ErrorMessage="Nome é de preenchimento obrigatório." ControlToValidate="NomeTextBox"
                                                            SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lblFomulario" align="right">
                                                        <strong style="color: Red">*</strong> Data da Doação:
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="DataDoacaoTextBox" runat="server" Width="20%" class="txtFormulario"
                                                            ToolTip="Informe a data da doação." />
                                                        <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" MaskType="Date" AcceptNegative="None"
                                                            Mask="99/99/9999" TargetControlID="DataDoacaoTextBox" UserDateFormat="DayMonthYear"
                                                            AutoComplete="true" AutoCompleteValue="09/08/2008">
                                                        </cc1:MaskedEditExtender>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDataDoacaoTextBox" runat="server"
                                                            ErrorMessage="Data da Doação é de preenchimento obrigatório." ControlToValidate="DataDoacaoTextBox"
                                                            SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                                                        <asp:Image runat="server" ID="imgCalendarioDataDoacao" ImageUrl="../Imagens/Calendar.bmp" />
                                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Animated="true" Format="dd/MM/yyyy"
                                                            TargetControlID="DataDoacaoTextBox" PopupButtonID="imgCalendarioDataDoacao">
                                                        </cc1:CalendarExtender>
<%--                                                        <asp:CompareValidator ID="CompareValidatorDataEventoTextBox" runat="server" Display="None"
                                                            ControlToValidate="DataDoacaoTextBox" ErrorMessage="Data da doação inválida."
                                                            Type="Date" Operator="DataTypeCheck"></asp:CompareValidator>
--%>                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lblFomulario" align="right">
                                                        <strong style="color: Red">*</strong> Endereço de Retirada:
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="EnderecoTextBox" runat="server" Text='<%# Bind("Endereco") %>' Width="98%"
                                                            class="txtFormulario" ToolTip="Informe o endereço de retirada dos itens pertencentes a doação." />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEnderecoTextBox" runat="server"
                                                            ErrorMessage="Endereço é de preenchimento obrigatório" ControlToValidate="EnderecoTextBox"
                                                            Display="None"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lblFomulario" align="right">
                                                        <strong style="color: Red">*</strong> Bairro:
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="BairroTextBox" runat="server" Text='<%# Bind("Bairro") %>' Width="70%"
                                                            class="txtFormulario" ToolTip="Informe o bairro de retirada dos itens pertencentes a doação." />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorBairroTextBox" runat="server"
                                                            ErrorMessage="Bairro é de preenchimento obrigatório" ControlToValidate="BairroTextBox"
                                                            Display="None"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lblFomulario" align="right">
                                                        <strong style="color: Red">*</strong> Telefone Residencial/Contato:
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="TelefoneResTextBox" runat="server" Text='<%# Bind("TelefoneRes") %>'
                                                            Width="25%" class="txtFormulario" ToolTip="Informe seu número de telefone residencial ou de contato." />
                                                        <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" MaskType="Number"
                                                            AcceptNegative="None" Mask="(99)9999-9999" TargetControlID="TelefoneResTextBox"
                                                            UserDateFormat="DayMonthYear" AutoComplete="true">
                                                        </cc1:MaskedEditExtender>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTelefoneRes" runat="server"
                                                            ErrorMessage="Telefone residencial é de preenchimento obrigatório" ControlToValidate="TelefoneResTextBox"
                                                            Display="None"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lblFomulario" align="right">
                                                        Telefone Celular:
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="TelefoneCelTextBox" runat="server" Text='<%# Bind("TelefoneCel") %>'
                                                            Width="25%" class="txtFormulario" ToolTip="Informe seu número do telefone celular." />
                                                        <cc1:MaskedEditExtender ID="MaskedEditExtender3" runat="server" MaskType="Number"
                                                            AcceptNegative="None" Mask="(99)9999-9999" TargetControlID="TelefoneCelTextBox"
                                                            AutoComplete="true">
                                                        </cc1:MaskedEditExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lblFomulario" align="right">
                                                        E-mail:
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' Width="70%"
                                                            class="txtFormulario" ToolTip="Informe seu e-mail de contato." />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lblFomulario" align="right">
                                                        <strong style="color: Red">*</strong> Itens de Doação:
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="ItensTextBox" runat="server" Text='<%# Bind("Itens") %>' Columns="60"
                                                            Rows="3" TextMode="MultiLine" class="txtFormulario" ToolTip="Informe aqui todos os itens pertencentes a doação." />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorItensTextBox" runat="server"
                                                            ErrorMessage="Itens é de preenchimento obrigatório" ControlToValidate="ItensTextBox"
                                                            Display="None"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lblFomulario" align="right">
                                                        <strong style="color: Red">*</strong> Disponibilidade:
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="DisponibilidadeTextBox" runat="server" Text='<%# Bind("Disponibilidade") %>'
                                                            Columns="60" Rows="3" TextMode="MultiLine" class="txtFormulario" ToolTip="Informe aqui qual a sua disponibilidade para que possamos retirar a doação." />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDisponibilidadeTextBox" runat="server"
                                                            ErrorMessage="Disponibilidade é de preenchimento obrigatório" ControlToValidate="DisponibilidadeTextBox"
                                                            Display="None"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" class="txtFormLogin" align="center">
                                                        <br />
                                                        <asp:Button ID="InsertButton" runat="server" CausesValidation="True" Text="Enviar Dados"
                                                            CommandName="Insert" SkinID="btnFormularioCadastro" ToolTip="Click neste botão enviar os dados referente a doação." />
                                                        &nbsp;<asp:Button ID="btnInsertCancelButton" runat="server" CausesValidation="False"
                                                            OnClick="InsertCancelButton_Click" Text="Cancelar" SkinID="btnFormularioCadastro"
                                                            ToolTip="Click neste botão para cancelar os dados referente a doação." />
                                                        <br />
                                                        <br />
                                                    </td>
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
                    </td>
                </tr>
            </table>
            </td></tr>
        </InsertItemTemplate>
    </asp:FormView>
    <asp:Panel ID="pnConfirmacao" runat="server" Style="display: none" CssClass="modalPopup">
        <asp:Panel ID="Pane13" runat="server" Style="cursor: move; background-color: #DDDDDD;
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
    <%--ModalPopup para resposta da doação--%>
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
                    Muito Obrigado por disponibilizar sua doação. Logo entraremos em contato com você.
                    <br />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Button ID="btnVoltar" runat="server" Text="OK" UseSubmitBehavior="false" SkinID="btnFormularioCadastro"
                        CausesValidation="false" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="pnObrigado"
        RepositionMode="RepositionOnWindowResize" TargetControlID="btnVoltar" BackgroundCssClass="modalBackground"
        OkControlID="btnVoltar" DropShadow="true" PopupDragHandleControlID="Panel3">
    </cc1:ModalPopupExtender>
</asp:Content>
