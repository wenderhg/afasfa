<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="FrmPesquisaVoluntario.aspx.cs" Inherits="AFASFA.Pesquisa.FrmPesquisaVoluntario" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <table align="center">
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
                Status Voluntário
            </td>
            <td>
                <asp:DropDownList ID="ddlStatus" runat="server">
                    <asp:ListItem Text="Todos"></asp:ListItem>
                    <asp:ListItem Value="P" Text="Pendente de Aprovação"></asp:ListItem>
                    <asp:ListItem Value="A" Text="Aprovado"></asp:ListItem>
                    <asp:ListItem Value="I" Text="Inativo"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="ckFiltroPersonalizado" runat="server" Text="Filtro personalizado"
                    OnCheckedChanged="ckFiltroPersonalizado_CheckedChanged" AutoPostBack="true" />
            </td>
        </tr>
    </table>
    <br />
    <asp:PlaceHolder ID="phFiltroPersonalizado" runat="server" Visible="false">
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
                    <asp:DropDownList ID="ddlCampos" runat="server" DataTextField="ColumnName" DataValueField="DataType"
                        AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="ddlCampos_SelectedIndexChanged">
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
                        <asp:ListItem Value="AND" Text="E"></asp:ListItem>
                        <asp:ListItem Value="OR" Text="OU"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="btnAdicionarFiltro" runat="server" Text="Adicionar filtro" OnClick="btnAdicionarFiltro_Click" />
                </td>
            </tr>
        </table>
    </asp:PlaceHolder>
    <asp:GridView ID="gdFiltros" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="NomeCampo" HeaderText="Nome campo" SortExpression="NomeCampo" />
            <asp:BoundField DataField="TipoFiltro" HeaderText="Tipo filtro" ReadOnly="True" SortExpression="TipoFiltro" />
            <asp:BoundField DataField="ValorFiltro" HeaderText="Valor filtro" SortExpression="ValorFiltro" />
            <asp:BoundField DataField="OperadorAND" HeaderText="Operador" SortExpression="OperadorAND" />
            <asp:CommandField DeleteText="Excluir" EditText="Alterar" InsertVisible="False" ShowCancelButton="False"
                ShowDeleteButton="True" ShowEditButton="True" UpdateText="Alterar" />
        </Columns>
    </asp:GridView>
</asp:Content>
