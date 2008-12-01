<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="FrmVisualizarEvento.aspx.cs" Inherits="AFASFA.Visualizar.FrmVisualizarEvento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <asp:Repeater ID="rptEvento" runat="server" OnItemDataBound="rptEvento_ItemDataBound">
        <HeaderTemplate>
            <table width="100%">
        </HeaderTemplate>
        <ItemTemplate>
            <tr valign="top">
                <td style="width: 50%">
                    <table>
                        <tr>
                            <td align="center" class="lblTituloApresentacaoEvento" width="100%">
                                E V E N T O
                                <div class="lblDescricaoApresentacaoEvento">
                                    <asp:Literal ID="Literal1" runat="server" Text="<%# Bind('Descricao') %>"></asp:Literal>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="lblFomulario">
                                Data do Evento:
                                <asp:Literal ID="Literal4" runat="server" Text="<%# Bind('DataEvento', '{0:dd/MM/yyyy}') %>"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="lblFomulario">
                                Local do Evento:
                                <asp:Literal ID="Literal2" runat="server" Text="<%# Bind('LocalEvento') %>"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="lblFomulario">
                                Valor do Convite para Adulto R$:
                                <asp:Literal ID="Literal3" runat="server" Text="<%# Bind('ValorConviteAdulto') %>"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="lblFomulario">
                                Valor do Convite para Criança R$:
                                <asp:Literal ID="Literal5" runat="server" Text="<%# Bind('ValorConviteAdulto') %>"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Literal ID="litJarealizado" Text="" runat="server" Visible="true"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td>
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
                            <td align="center" class="lblTituloApresentacaoEvento" width="100%">
                                E V E N T O
                                <div class="lblDescricaoApresentacaoEvento">
                                    <asp:Literal ID="Literal1" runat="server" Text="<%# Bind('Descricao') %>"></asp:Literal>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="lblFomulario">
                                Data do Evento:
                                <asp:Literal ID="Literal4" runat="server" Text="<%# Bind('DataEvento', '{0:dd/MM/yyyy}') %>"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="lblFomulario">
                                Local do Evento:
                                <asp:Literal ID="Literal2" runat="server" Text="<%# Bind('LocalEvento') %>"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="lblFomulario">
                                Valor do Convite para Adulto R$:
                                <asp:Literal ID="Literal3" runat="server" Text="<%# Bind('ValorConviteAdulto') %>"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="lblFomulario">
                                Valor do Convite para Criança R$:
                                <asp:Literal ID="Literal5" runat="server" Text="<%# Bind('ValorConviteAdulto') %>"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Literal ID="litJarealizado" Text="" runat="server" Visible="true"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <asp:Panel ID="pnReservarConvite" runat="server">
                                    <asp:Button ID="btnReservarConvite" runat="server" Text="Reservar Convites" SkinID="btnFormularioCadastro"
                                        CausesValidation="false" />
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </table></FooterTemplate>
    </asp:Repeater>
</asp:Content>
