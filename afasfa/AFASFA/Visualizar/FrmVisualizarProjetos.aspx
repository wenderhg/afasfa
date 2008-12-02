<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="FrmVisualizarProjetos.aspx.cs" Inherits="AFASFA.Visualizar.FrmVisualizarProjetos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <asp:Repeater ID="rptProjetos" runat="server" OnItemDataBound="rptProjetos_ItemDataBound">
        <HeaderTemplate>
            <div id="TituloApresentacao" class="TextoTitulo" runat="server">
                <br />
                PROJETOS EXISTENTES NO LAR
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
                                P R O J E T O
                                <div class="lblDescricaoApresentacaoEvento">
                                    <asp:TextBox CssClass="lblDescricaoApresentacaoEvento" ID="txtDescricaoEvento" runat="server"
                                        Text="<%# Bind('Descricao') %>" TextMode="MultiLine" Rows="2" Width="100%" BorderColor=""
                                        BorderStyle="None" EnableTheming="false">
                                    </asp:TextBox>
                                </div>
                            </td>
                        </tr>
                        <tr class="lblTextoApresentacao" valign="top">
                            <td align="right" width="30%">
                                Informações sobre o projeto:
                            </td>
                            <td align="center">
                                <asp:TextBox CssClass="txtTextoApresentacao" ID="txtLocalEvento" runat="server" Text="<%# Bind('DadosProjeto') %>"
                                    TextMode="MultiLine" Rows="4" Width="100%" BorderColor="" BorderStyle="None"
                                    EnableTheming="false">
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <td style="width: 50%">
                        <asp:Literal ID="ltIniciaImagem" runat="server" Text="<img src='/foto/" /><asp:Literal
                            ID="ltImagen" runat="server" Text="<%#Bind('Foto') %>" /><asp:Literal ID="ltFinalizaImagem"
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
                        ID="ltImagen" runat="server" Text="<%#Bind('Foto') %>" /><asp:Literal ID="ltFinalizaImagem"
                            runat="server" Text="' style='width:251px;heigth:188px'/>" />
                </td>
                <td style="width: 50%">
                    <table>
                        <tr>
                            <td align="center" class="lblTituloApresentacaoEvento" width="100%" colspan="2">
                                P R O J E T O
                                <div class="lblDescricaoApresentacaoEvento">
                                    <asp:TextBox CssClass="lblDescricaoApresentacaoEvento" ID="txtDescricaoEvento" runat="server"
                                        Text="<%# Bind('Descricao') %>" TextMode="MultiLine" Rows="2" Width="100%" BorderColor=""
                                        BorderStyle="None" EnableTheming="false">
                                    </asp:TextBox>
                                </div>
                            </td>
                        </tr>
                        <tr class="lblTextoApresentacao" valign="top">
                            <td align="right" width="30%">
                                Informações sobre o projeto:
                            </td>
                            <td align="center">
                                <asp:TextBox CssClass="txtTextoApresentacao" ID="txtLocalEvento" runat="server" Text="<%# Bind('DadosProjeto') %>"
                                    TextMode="MultiLine" Rows="4" Width="100%" BorderColor="" BorderStyle="None"
                                    EnableTheming="false">
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </table></FooterTemplate>
    </asp:Repeater>
</asp:Content>
