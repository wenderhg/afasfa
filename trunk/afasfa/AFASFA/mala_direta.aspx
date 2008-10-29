<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="mala_direta.aspx.cs" Inherits="AFASFA.mala_direta" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <table cellpadding="0" cellspacing="0" width="100%" style="" background="#E6E7F2"
        border="Ridge">
        <tr>
            <td colspan="2" class="TextoTitulo" align="center">
                <br />
                MALA DIRETA
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="2" class="TextoPagina" align="justify">
                Olá !!!! Muito Obrigado pelos serviços prestados....
                <br />
                <br />
                Aqui você pode selecionar os usuário e voluntários desejados que tenham e-mail cadastrado
                para receberem as mensagens criadas por você.
                <br />
                <br />
                Bom Trabalho.
                <br />
                <br />
                Verifique quais os filtros serão utilizados para selecionar os usuários do site
                que irão receber a mensagem !!!
                <br />
                <br />
                Na opção Geral será gerado uma pesquisa para todos os usuários do site. E será desabilitado
                a opção de selecionar por Aniversáriantes.
                <br />
                <br />
                Caso queira fazer uma pesquisa por Aniversáriantes selecione o mês desejado.
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td colspan="2">
                            <br />
                            <asp:CheckBox ID="chkGeral" runat="server" Text="GERAL - Nesta opção todos os usuários do sistema irão receber a mensagem"
                                class="txtFormulario" OnCheckedChanged="chkGeral_OnCheckedChanged" AutoPostBack="true" />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td width="35%" class="txtFormulario">
                            <br />
                            Selecionar aniversáriantes do mês:
                        </td>
                        <td>
                            <br />
                            <asp:DropDownList ID="drMeses" runat="server" DataTextField="NomeDoMes" DataValueField="NumeroDoMes"
                                CssClass="lblFomulario">
                            </asp:DropDownList>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td width="35%" class="txtFormulario" valign="top">
                            <br />
                            Digite a mensagem que será enviada para os usuários selecionados na pesquisa:
                        </td>
                        <td>
                            <br />
                            <asp:TextBox ID="txtMensagem" runat="server" CssClass="lblFomulario" TextMode="MultiLine"
                                Width="98%" Rows="4"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtMensagem" runat="server"
                                ErrorMessage="Mensagem é de preenchimento obrigatório" ControlToValidate="txtMensagem"
                                Display="None">
                            </asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <br />
                            <asp:Button ID="btnCriarPesquisa" runat="server" Text="Gerar Pesquisa" OnClick="btnCriarPesquisa_Click"
                                SkinID="btnFormularioCadastro" CausesValidation="false" />
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <asp:Panel ID="pnPesquisaGeral" runat="server" Visible="false" BorderStyle="Ridge">
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="acesso_dados.DataSetAFASFATableAdapters.usuarios_geralTableAdapter">
        </asp:ObjectDataSource>
        <asp:GridView runat="server" ID="grdMalaDireta" DataSourceID="ObjectDataSource1"
            SkinID="grdPesquisa" AutoGenerateColumns="False" >
            <Columns>
                <asp:BoundField DataField="NOME" HeaderText="NOME" SortExpression="NOME" HeaderStyle-Width="60%" />                
                <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" HeaderStyle-Width="40%" />
            </Columns>
        </asp:GridView>
        <p align="center">
            <asp:Button ID="btnEnviarEmail" runat="server" Text="Enviar Email" SkinID="btnFormularioCadastro" />
        </p>
    </asp:Panel>
    <asp:Panel ID="pnPesquisaAniversariantes" runat="server" Visible="false" BorderStyle="Ridge"
        HorizontalAlign="Center">
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="acesso_dados.DataSetAFASFATableAdapters.usuarios_aniversariantesTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="drMeses" DefaultValue="12" Name="drMeses" PropertyName="SelectedValue"
                    Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:GridView runat="server" ID="grdAniversariantes" DataSourceID="ObjectDataSource2"
            SkinID="grdPesquisa" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="NOME" HeaderText="NOME" SortExpression="NOME" HeaderStyle-Width="45%" />
                <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                <asp:BoundField DataField="DATANASCIMENTO" HeaderText="DATANASCIMENTO" 
                    SortExpression="DATANASCIMENTO" HeaderStyle-Width="45%" />
            </Columns>
        </asp:GridView>
        <p align="center" >
            <asp:Button ID="Button1" runat="server" Text="Enviar Email" SkinID="btnFormularioCadastro" />
        </p>
    </asp:Panel>
    <br />
    <br />
    <%--<asp:RadioButton ID="TipoVoluntarioCheckBox1" runat="server" Text="Voluntário Indireto"
        GroupName="TipoVoluntario" class="txtFormulario" />--%>
</asp:Content>
