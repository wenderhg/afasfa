<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmReportViewer.aspx.cs"
    Inherits="AFASFA.Relatorios.FrmReportViewer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="/estilos/estilos.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </cc1:ToolkitScriptManager>
        <div id="dvRelatorio" style="">
            <asp:Panel ID="pnInformacoes" runat="server" BorderColor="ActiveBorder">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <caption>
                            <br />
                            <td align="center" class="TextoTitulo">
                                RELATÓRIOS ADMINISTRATIVOS
                                <br />
                                <br />
                            </td>
                        </caption>
                    </tr>
                    </tr>
                    <tr>
                        <td class="TextoPagina" align="justify">
                            Olá !!!! Muito Obrigado pelos serviços prestados....
                            <br />
                            <br />
                            Aqui poderá vizualizar, imprimir e exportar relatórios e listagem com informações
                            do sistema.
                            <br />
                            <br />
                            Selecione o tipo de relatório ou listagem na caixa de seleção abaixo e click botão
                            gerar relatório . Bom Trabalho.
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <!-- Colocar um texto indicando que aqui estao os filtros, apos executar o relatorio esconder o div com display:none-->
            <asp:DropDownList ID="ddlRelatorios" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlRelatorios_SelectedIndexChanged"
                CssClass="lblFomulario">
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Text="Relatório de Doações" Value="Relatorios\relatorio_doacoes_por_data.rdlc"></asp:ListItem>
                <asp:ListItem Text="Listagem de Voluntários" Value="Relatorios\listagem_Voluntarios.rdlc"></asp:ListItem>
                <asp:ListItem Text="Listagem de Assistências" Value="Relatorios\listagem_assistencias.rdlc"></asp:ListItem>
                <asp:ListItem Text="Listagem de Projetos" Value="Relatorios\listagem_projetos.rdlc"></asp:ListItem>
                <asp:ListItem Text="Listagem de Eventos" Value="Relatorios\listagem_eventos.rdlc"></asp:ListItem>
                <asp:ListItem Text="Listagem de Usuários" Value="Relatorios\listagem_usuarios.rdlc"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Panel ID="pnDoacoes" runat="server" Visible="false">
                <table>
                    <tr>
                        <td class="lblFomulario" align="right">
                            Data da Doação Inicial:
                        </td>
                        <td>
                            <asp:TextBox ID="txtDataDoacaoIni" runat="server" CssClass="txtFomulario" Width="65"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="MaskedEditExtendertxtDataDoacaoIni" runat="server" MaskType="Date"
                                AcceptNegative="None" Mask="99/99/9999" TargetControlID="txtDataDoacaoIni" UserDateFormat="DayMonthYear"
                                AutoComplete="true">
                            </cc1:MaskedEditExtender>
                            <asp:Image runat="server" ID="imgCalendariotxtDataDoacaoIni" ImageUrl="../Imagens/Calendar.bmp" />
                            <cc1:CalendarExtender ID="CalendarExtender1txtDataDoacaoIni" runat="server" Animated="true"
                                Format="dd/MM/yyyy" TargetControlID="txtDataDoacaoIni" PopupButtonID="imgCalendariotxtDataDoacaoIni">
                            </cc1:CalendarExtender>
                            <asp:CompareValidator ID="CompareValidatortxtDataDoacaoIni" runat="server" Display="None"
                                ControlToValidate="txtDataDoacaoIni" ErrorMessage="Data da doação inicial inválida."
                                Type="Date" Operator="DataTypeCheck">
                            </asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="lblFomulario" align="right">
                            Data da Doação Final:
                        </td>
                        <td>
                            <asp:TextBox ID="txtDataDoacaoFim" runat="server" CssClass="txtFomulario" Width="65"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="MaskedEditExtendertxtDataDoacaoFim" runat="server" MaskType="Date"
                                AcceptNegative="None" Mask="99/99/9999" TargetControlID="txtDataDoacaoFim" UserDateFormat="DayMonthYear"
                                AutoComplete="true">
                            </cc1:MaskedEditExtender>
                            <asp:Image runat="server" ID="imgCalendariotxtDataDoacaoFim" ImageUrl="../Imagens/Calendar.bmp" />
                            <cc1:CalendarExtender ID="CalendarExtendertxtDataDoacaoFim" runat="server" Animated="true"
                                Format="dd/MM/yyyy" TargetControlID="txtDataDoacaoFim" PopupButtonID="imgCalendariotxtDataDoacaoFim">
                            </cc1:CalendarExtender>
                            <asp:CompareValidator ID="CompareValidatortxtDataDoacaoFim" runat="server" Display="None"
                                ControlToValidate="txtDataDoacaoFim" ErrorMessage="Data da doação final inválida."
                                Type="Date" Operator="DataTypeCheck"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="lblFomulario" align="right">
                            Status da Doação:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropStatusDoacao" runat="server" AutoPostBack="True" CssClass="lblFomulario"
                                align="left">
                                <asp:ListItem Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Todas" Value="Todas"></asp:ListItem>
                                <asp:ListItem Text="Pendentes de aprovação" Value="Pendentes"></asp:ListItem>
                                <asp:ListItem Text="Rejeitadas" Value="Rejeitadas"></asp:ListItem>
                                <asp:ListItem Text="Aprovadas" Value="Aprovadas"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td colspan="2" class="lblPreenchimentoObrigatorio" align="center">
                            <br />
                            Deixe os campos sem preenchimento que o sistema irá listar todas as doações independente
                            da data ou status.
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
                <br />
                <br />
            </asp:Panel>
            <br />
            <asp:Button ID="btGerar" runat="server" Text="Gerar Relatorio" OnClick="btGerar_Click"
                SkinID="btnFormularioCadastro" />
            <br />
        </div>
        <br />
        <br />
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" DocumentMapWidth="90%" Height="31cm"
            Width="20cm" Font-Names="Verdana" Font-Size="8pt" Visible="False" ToolBarItemPressedHoverBackColor=""
            OnLoad="ReportViewer1_Load" OnPreRender="ReportViewer1_PreRender">
            <LocalReport ReportPath="Relatorios\listagem_assistencias.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSetAFASFA_assistencias" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="AFASFA.DataSetAFASFATableAdapters.">
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
