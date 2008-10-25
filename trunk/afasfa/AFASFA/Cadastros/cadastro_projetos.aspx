<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="cadastro_projetos.aspx.cs" Inherits="AFASFA.Cadastros.cadastro_projetos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="acesso_dados.DataSetAFASFATableAdapters.projetosTableAdapter" 
        UpdateMethod="Update">
        <UpdateParameters>
            <asp:Parameter Name="DESCRICAO" Type="String" />
            <asp:Parameter Name="FOTO" Type="String" />
            <asp:Parameter Name="DADOSDOPROJETO" Type="String" />
            <asp:Parameter Name="ORDEMAPRESENTACAO" Type="Int32" />            
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="DESCRICAO" Type="String" />
            <asp:Parameter Name="FOTO" Type="String" />
            <asp:Parameter Name="DADOSDOPROJETO" Type="String" />
            <asp:Parameter Name="ORDEMAPRESENTACAO" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Projeto" DataSourceID="ObjectDataSource1"
        DefaultMode="Insert" BackColor="#E6E7F2" BorderColor="#ECFFFF" 
        BorderStyle="Ridge">
        <EditItemTemplate>            
            Descricao:
            <asp:TextBox ID="DescricaoTextBox" runat="server" 
                Text='<%# Bind("Descricao") %>' />
            <br />
            Foto:
            <asp:TextBox ID="FotoTextBox" runat="server" Text='<%# Bind("Foto") %>' />
            <br />
            DadosProjeto:
            <asp:TextBox ID="DadosProjetoTextBox" runat="server" 
                Text='<%# Bind("DadosProjeto") %>' />
            <br />
            OrdemApresentacao:
            <asp:TextBox ID="OrdemApresentacaoTextBox" runat="server" 
                Text='<%# Bind("OrdemApresentacao") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Projeto:
            <asp:TextBox ID="ProjetoTextBox" runat="server" Text='<%# Bind("Projeto") %>' />
            <br />
            Descricao:
            <asp:TextBox ID="DescricaoTextBox" runat="server" 
                Text='<%# Bind("Descricao") %>' />
            <br />
            Foto:
            <asp:TextBox ID="FotoTextBox" runat="server" Text='<%# Bind("Foto") %>' />
            <br />
            DadosProjeto:
            <asp:TextBox ID="DadosProjetoTextBox" runat="server" 
                Text='<%# Bind("DadosProjeto") %>' />
            <br />
            OrdemApresentacao:
            <asp:TextBox ID="OrdemApresentacaoTextBox" runat="server" 
                Text='<%# Bind("OrdemApresentacao") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Projeto:
            <asp:Label ID="ProjetoLabel" runat="server" Text='<%# Eval("Projeto") %>' />
            <br />
            Descricao:
            <asp:Label ID="DescricaoLabel" runat="server" Text='<%# Bind("Descricao") %>' />
            <br />
            Foto:
            <asp:Label ID="FotoLabel" runat="server" Text='<%# Bind("Foto") %>' />
            <br />
            DadosProjeto:
            <asp:Label ID="DadosProjetoLabel" runat="server" 
                Text='<%# Bind("DadosProjeto") %>' />
            <br />
            OrdemApresentacao:
            <asp:Label ID="OrdemApresentacaoLabel" runat="server" 
                Text='<%# Bind("OrdemApresentacao") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
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
</asp:Content>
