<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="FrmVisualizarEvento.aspx.cs" Inherits="AFASFA.Visualizar.FrmVisualizarEvento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <asp:Repeater ID="rptEvento" runat="server" OnItemDataBound="rptEvento_ItemDataBound">
        <HeaderTemplate>
            <div id="TituloApresentacao" class="TextoTitulo" runat="server">
                <br />
                EVENTOS REALIZADOS PELO LAR SÃO FRANCISCO DE ASSIS
                <br />
                <br />
                <br />
            </div>
            <table width="100%">
        </HeaderTemplate>
        <ItemTemplate>
            <tr valign="top">
                <td style="width: 50%">
                    <table>
                        <tr>
                            <td align="center" class="lblTituloApresentacaoEvento" width="100%" colspan="2">
                                E V E N T O
                                <div class="lblDescricaoApresentacaoEvento">
                                    <asp:TextBox CssClass="lblDescricaoApresentacaoEvento" ID="txtDescricaoEvento" runat="server"
                                        Text="<%# Bind('Descricao') %>" TextMode="MultiLine" Rows="2" Width="100%" BorderColor=""
                                        BorderStyle="None" EnableTheming="false">
                                    </asp:TextBox>
                                </div>
                            </td>
                        </tr>
                        <tr class="lblTextoApresentacao">
                            <td align="right" width="30%">
                                Data do Evento:
                            </td>
                            <td class="txtTextoApresentacao" align="left">
                                <asp:Literal ID="Literal1" runat="server" Text="<%# Bind('DataEvento', '{0:dd/MM/yyyy}') %>"></asp:Literal>
                            </td>
                        </tr>
                        <tr class="lblTextoApresentacao" valign="top">
                            <td align="right" width="30%">
                                Local do Evento:
                            </td>
                            <td align="center">
                                <asp:TextBox CssClass="txtTextoApresentacao" ID="txtLocalEvento" runat="server" Text="<%# Bind('LocalEvento') %>"
                                    TextMode="MultiLine" Rows="4" Width="100%" BorderColor="" BorderStyle="None"
                                    EnableTheming="false">
                                </asp:TextBox>
                                <%--<asp:Literal ID="Literal2" runat="server" Text="<%# Bind('LocalEvento') %>"></asp:Literal>--%>
                            </td>
                        </tr>
                        <tr class="lblTextoApresentacao">
                            <td align="right" width="30%">
                                Valor do Convite para Adulto R$:
                            </td>
                            <td class="txtTextoApresentacao" align="left">
                                <asp:Literal ID="Literal3" runat="server" Text="<%# Bind('ValorConviteAdulto') %>"></asp:Literal>
                            </td>
                        </tr>
                        <tr class="lblTextoApresentacao">
                            <td align="right" width="30%">
                                Valor do Convite para Criança R$:
                            </td>
                            <td class="txtTextoApresentacao" align="left">
                                <asp:Literal ID="Literal5" runat="server" Text="<%# Bind('ValorConviteAdulto') %>"></asp:Literal>
                            </td>
                        </tr>
                        <tr class="txtTextoApresentacao">
                            <td colspan="2">
                                <asp:Literal ID="litJarealizado" Text="" runat="server" Visible="true"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br />
                                <asp:Panel ID="pnReservarConvite" runat="server">
                                    <asp:Button ID="btnReservarConvite" runat="server" Text="Reservar Convites" SkinID="btnFormularioCadastro"
                                        CausesValidation="false" />
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                    <td style="width: 50%">
                        <asp:Literal ID="ltIniciaImagem" runat="server" Text="<img src='/foto/" /><asp:Literal
                            ID="ltImagen" runat="server" Text="<%#Bind('FotoInicial') %>" /><asp:Literal ID="ltFinalizaImagem"
                                runat="server" Text="' style='width:251px;heigth:188px'/>" />
                    </td>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr valign="top">
                <td style="width: 50%">
                    <asp:Literal ID="ltIniciaImagem" runat="server" Text="<img src='/foto/" /><asp:Literal
                        ID="ltImagen" runat="server" Text="<%#Bind('FotoInicial') %>" /><asp:Literal ID="ltFinalizaImagem"
                            runat="server" Text="' style='width:251px;heigth:188px'/>" />
                </td>
                <td style="width: 50%">
                    <table>
                        <tr>
                            <td align="center" class="lblTituloApresentacaoEvento" width="100%" colspan="2">
                                E V E N T O
                                <div class="lblDescricaoApresentacaoEvento">
                                    <asp:TextBox CssClass="lblDescricaoApresentacaoEvento" ID="txtDescricaoEvento" runat="server"
                                        Text="<%# Bind('Descricao') %>" TextMode="MultiLine" Rows="2" Width="100%" BorderColor=""
                                        BorderStyle="None" EnableTheming="false">
                                    </asp:TextBox>
                                </div>
                            </td>
                        </tr>
                        <tr class="lblTextoApresentacao">
                            <td align="right" width="30%">
                                Data do Evento:
                            </td>
                            <td class="txtTextoApresentacao" align="left">
                                <asp:Literal ID="Literal4" runat="server" Text="<%# Bind('DataEvento', '{0:dd/MM/yyyy}') %>"></asp:Literal>
                            </td>
                        </tr>
                        <tr class="lblTextoApresentacao">
                            <td align="right" valign="top" width="30%">
                                Local do Evento:
                            </td>
                            <td align="left">
                                <asp:TextBox CssClass="txtTextoApresentacao" ID="txtLocalEvento" runat="server" Text="<%# Bind('LocalEvento') %>"
                                    TextMode="MultiLine" Rows="4" Width="100%" BorderColor="" BorderStyle="None"
                                    EnableTheming="false">
                                </asp:TextBox>
                                <%--<asp:Literal ID="Literal2" runat="server" </asp:Literal>--%>
                            </td>
                        </tr>
                        <tr class="lblTextoApresentacao">
                            <td align="right" width="30%">
                                Valor do Convite para Adulto R$:
                            </td>
                            <td class="txtTextoApresentacao" align="left">
                                <asp:Literal ID="Literal3" runat="server" Text="<%# Bind('ValorConviteAdulto') %>"></asp:Literal>
                            </td>
                        </tr>
                        <tr class="lblTextoApresentacao">
                            <td align="right" width="30%">
                                Valor do Convite para Criança R$:
                            </td>
                            <td class="txtTextoApresentacao" align="left">
                                <asp:Literal ID="Literal5" runat="server" Text="<%# Bind('ValorConviteAdulto') %>"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td class="lblAlertaApresentacao" colspan="2">
                                <asp:Literal ID="litJarealizado1" Text="" runat="server" Visible="true"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="txtTextoApresentacao">
                                <asp:Literal ID="litJarealizado" Text="" runat="server" Visible="true"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan=2"">
                                <br />
                                <asp:Panel ID="pnReservarConvite" runat="server">
                                    <asp:Button ID="btnReservarConvite" runat="server" Text="Reservar Convites" SkinID="btnFormularioCadastro"
                                        CausesValidation="false" />
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <br />
                                <br />
                            </td>
                        </tr>
                    </table>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </table></FooterTemplate>
    </asp:Repeater>
    <a href="#topo" class="linkTopo">Voltar ao Topo</a>
    <br />
    <br />
</asp:Content>
