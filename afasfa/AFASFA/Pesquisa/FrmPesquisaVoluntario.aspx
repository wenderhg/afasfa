<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="FrmPesquisaVoluntario.aspx.cs" Inherits="AFASFA.Pesquisa.FrmPesquisaVoluntario" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="up_Principal">
        <ProgressTemplate>
            <div class="modalPopup" width="100%">
                <img src="../Imagens/ajax-loader.gif" />
                Carregando..
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="up_Principal" runat="server">
        <ContentTemplate>
            <table cellpadding="0" cellspacing="0" width="100%" style="" background="#E6E7F2"
                border="Ridge">
                <tr>
                    <td>
                        <br />
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td>
                                    Nome
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNome" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    Status Voluntário
                                </td>
                                <td>
                                    <br />
                                    <asp:DropDownList ID="ddlStatus" runat="server">
                                        <asp:ListItem Text="Todos" Selected="True"></asp:ListItem>
                                        <asp:ListItem Value="P" Text="Pendente de Aprovação"></asp:ListItem>
                                        <asp:ListItem Value="A" Text="Aprovado"></asp:ListItem>
                                        <asp:ListItem Value="R" Text="Rejeitado"></asp:ListItem>
                                        <asp:ListItem Value="I" Text="Inativo"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <asp:CheckBox ID="ckFiltroPersonalizado" runat="server" Text="Filtro personalizado"
                                        OnCheckedChanged="ckFiltroPersonalizado_CheckedChanged" AutoPostBack="true" />
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </td>
                </tr>
                <asp:PlaceHolder ID="phFiltroPersonalizado" runat="server" Visible="false">
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        Nome campo
                                    </td>
                                    <td>
                                        Tipo de Filtro
                                    </td>
                                    <td>
                                        Valor para filtro
                                    </td>
                                    <td>
                                        Operador
                                    </td>
                                </tr>
                                <tr>
                                    <td style="margin-left: 40px">
                                        <asp:DropDownList ID="ddlCampos" runat="server" AppendDataBoundItems="true" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlCampos_SelectedIndexChanged">
                                            <asp:ListItem></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlTipoFiltro" runat="server">
                                            <asp:ListItem Value="Igual" Text="Igual"></asp:ListItem>
                                            <asp:ListItem Value="Maior" Text="Maior"></asp:ListItem>
                                            <asp:ListItem Value="MaiorOuIgual" Text="Maior ou igual"></asp:ListItem>
                                            <asp:ListItem Value="Menor" Text="Menor"></asp:ListItem>
                                            <asp:ListItem Value="MenorOuIgual" Text="Menor ou igual"></asp:ListItem>
                                            <asp:ListItem Value="Diferente" Text="Diferente"></asp:ListItem>
                                            <asp:ListItem Value="ComecandoCom" Text="Comecando com"></asp:ListItem>
                                            <asp:ListItem Value="Contenha" Text="Contenha"></asp:ListItem>
                                            <asp:ListItem Value="TerminandoCom" Text="Terminando com"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtValor" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtValor" runat="server" ErrorMessage="Dado para filtro é de preenchimento obrigatório."
                                            ControlToValidate="txtValor" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                                        <asp:PlaceHolder ID="phControlesData" runat="server" Visible="false">
                                            <cc1:MaskedEditExtender ID="MaskedEditExtendertxtValor" runat="server" MaskType="Date"
                                                AcceptNegative="None" Mask="99/99/9999" TargetControlID="txtValor" UserDateFormat="DayMonthYear"
                                                AutoComplete="true" AutoCompleteValue="09/08/2008">
                                            </cc1:MaskedEditExtender>
                                            <asp:Image runat="server" ID="imgCalendariotxtValor" ImageUrl="/Imagens/Calendar.bmp" />
                                            <cc1:CalendarExtender ID="CalendarExtendertxtValor" runat="server" Animated="true"
                                                Format="dd/MM/yyyy" TargetControlID="txtValor" PopupButtonID="imgCalendariotxtValor">
                                            </cc1:CalendarExtender>
                                            <asp:CompareValidator ID="CompareValidatortxtValor" runat="server" Display="None"
                                                ControlToValidate="txtValor" ErrorMessage="Data de filtro inválida." Type="Date"
                                                Operator="DataTypeCheck"></asp:CompareValidator>
                                        </asp:PlaceHolder>
                                        <asp:PlaceHolder ID="phControlesNumero" runat="server" Visible="false">
                                            <cc1:MaskedEditExtender ID="MaskedEditExtendertxtValorNumero" runat="server" Mask="999,999.99"
                                                MaskType="Number" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus"
                                                TargetControlID="txtValor" CultureName="pt-BR" InputDirection="RightToLeft">
                                            </cc1:MaskedEditExtender>
                                            <asp:CompareValidator ID="CompareValidatortxtValorNumero" runat="server" Display="None"
                                                ControlToValidate="txtValor" ErrorMessage="Valor de filtro inválida." Type="Currency"
                                                Operator="DataTypeCheck"></asp:CompareValidator>
                                        </asp:PlaceHolder>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlOperador" runat="server">
                                            <asp:ListItem Value="true" Text="E"></asp:ListItem>
                                            <asp:ListItem Value="false" Text="OU"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnAdicionarFiltro" runat="server" Text="Adicionar filtro" OnClick="btnAdicionarFiltro_Click"
                                            SkinID="btnFormularioCadastro" />
                                        <asp:Button ID="btnAtualizarFiltro" runat="server" Text="Atualizar filtro" OnCommand="btnAtualizarFiltro_Command"
                                            SkinID="btnFormularioCadastro" Visible="false" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="phGrid" runat="server" Visible="false">
                    <tr>
                        <td>
                            <br />
                            <asp:GridView ID="gdFiltros" runat="server" AutoGenerateColumns="False" Width="100%"
                                OnRowDeleting="gdFiltros_RowDeleting" SkinID="grdPesquisa" OnRowDataBound="gdFiltros_DataBound"
                                OnRowEditing="gdFiltros_RowEditing" AllowPaging="true" AllowSorting="true" PagerSettings-Mode="NumericFirstLast"
                                PagerSettings-Visible="true">
                                
                                <Columns>
                                    <asp:BoundField DataField="NomeCampo" HeaderText="Nome campo" SortExpression="NomeCampo" />
                                    <asp:BoundField DataField="TipoFiltro" HeaderText="Tipo filtro" ReadOnly="True" SortExpression="TipoFiltro" />
                                    <asp:BoundField DataField="ValorFiltro" HeaderText="Valor filtro" SortExpression="ValorFiltro" />
                                    <asp:BoundField DataField="OperadorAND" HeaderText="Operador" SortExpression="OperadorAND" />
                                    <asp:CommandField DeleteText="Excluir" EditText="Alterar" InsertVisible="False" ShowCancelButton="False"
                                        ShowDeleteButton="True" ShowEditButton="True" UpdateText="Alterar" />
                                </Columns>
                            </asp:GridView>
                            <br />
                        </td>
                    </tr>
                </asp:PlaceHolder>
                <tr>
                    <td>
                        <br />
                        <asp:Button ID="btnPesquisar" runat="server" Text="Gerar pesquisar" SkinID="btnFormularioCadastro"
                            OnClick="btnPesquisar_Click" CausesValidation="false" />
                        <br />
                    </td>
                </tr>
                <asp:PlaceHolder ID="phResultado" runat="server" Visible="false">
                    <tr>
                        <td>
                            <br />
                            <asp:GridView ID="gvResultado" runat="server" AutoGenerateColumns="False" Width="400px"
                                SkinID="grdPesquisa" DataKeyNames="VOLUNTARIO" OnRowDataBound="gvResultado_RowDataBound"
                                OnRowCommand="gvResultado_RowCommand" RowStyle-Wrap="true" RowStyle-Width="400px">
                                <Columns>
                                    <asp:BoundField DataField="NomeContato" HeaderText="NomeContato" SortExpression="NomeContato" />
                                    <asp:BoundField DataField="DataEnvio" HeaderText="Data Envio" SortExpression="DataEnvio"
                                        DataFormatString="{0:dd/MM/yyyy}" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                    <asp:BoundField DataField="TELEFONERES" HeaderText="Telefone" SortExpression="TELEFONERES" />
                                    <asp:BoundField DataField="TELEFONECEL" HeaderText="Celular" SortExpression="TELEFONECEL" />
                                    <asp:BoundField DataField="ESTADO" HeaderText="Status" SortExpression="ESTADO" />
                                    <asp:BoundField DataField="TIPOVOLUNTARIO" HeaderText="Tipo Voluntário" SortExpression="TIPOVOLUNTARIO" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="btnAprovar" runat="server" Visible="false" CommandName="Aprovar"
                                                Text="Aprovar interesse" SkinID="btnFormularioCadastro" CausesValidation="false" />
                                            <asp:Button ID="btnRejeitar" runat="server" Visible="false" CommandName="Rejeitar"
                                                Text="Rejeitar interesse" SkinID="btnFormularioCadastro" CausesValidation="false" />
                                            <asp:Button ID="btnInativar" runat="server" Visible="false" CommandName="Inativar"
                                                Text="Inativar voluntário" SkinID="btnFormularioCadastro" CausesValidation="false" />
                                            <asp:Button ID="btnReativar" runat="server" Visible="false" CommandName="Reativar"
                                                Text="Reativar voluntário" SkinID="btnFormularioCadastro" CausesValidation="false" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:HyperLink runat="server" ID="hlEditar" ImageUrl="~/Imagens/b_edit.png" NavigateUrl="~/Cadastros/cadastro_voluntarios.aspx?id={0}"
                                                Target="_blank"></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    Nenhum dado foi encontrado</EmptyDataTemplate>
                            </asp:GridView>
                            <br />
                        </td>
                    </tr>
                </asp:PlaceHolder>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
