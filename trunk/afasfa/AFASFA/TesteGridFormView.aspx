<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TesteGridFormView.aspx.cs"
    Inherits="AFASFA.TesteGridFormView" %>

<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
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
                <asp:Parameter Name="ITENS" Type="String" />
                <asp:Parameter Name="DISPONIBILIDADE" Type="String" />
                <asp:Parameter Name="OBSERVACAO" Type="String" />
                <asp:Parameter Name="ESTADO" Type="String" />
                <asp:Parameter Name="TELEFONERES" Type="String" />
                <asp:Parameter Name="TELEFONECEL" Type="String" />
                <asp:Parameter Name="EMAIL" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="Doacao" DataSourceID="ObjectDataSource1"
        OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing">
        <Columns>
            <asp:BoundField DataField="Doacao" HeaderText="Doacao" ReadOnly="True" SortExpression="Doacao" />
            <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
            <asp:BoundField DataField="DATADOACAO" HeaderText="Data Doação" SortExpression="DATADOACAO" />
            <asp:BoundField DataField="ITENS" HeaderText="ITENS" SortExpression="ITENS" />
            <asp:BoundField DataField="DISPONIBILIDADE" HeaderText="DISPONIBILIDADE" SortExpression="DISPONIBILIDADE" />
            <asp:BoundField DataField="OBSERVACAO" HeaderText="OBSERVACAO" SortExpression="OBSERVACAO" />
            <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" SortExpression="ESTADO" />
            <asp:BoundField DataField="TELEFONERES" HeaderText="TELEFONERES" SortExpression="TELEFONERES" />
            <asp:BoundField DataField="TELEFONECEL" HeaderText="TELEFONECEL" SortExpression="TELEFONECEL" />
            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
            <asp:CommandField ShowEditButton="True" ShowInsertButton="True" EditText="Alterar" InsertText="Inserir" />
        </Columns>
    </asp:GridView>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Doacao" DataSourceID="ObjectDataSource1"
        OnModeChanging="FormView1_ModeChanging" Visible="false">
        <EditItemTemplate>
            Doacao:
            <asp:Label ID="DoacaoLabel1" runat="server" Text='<%# Eval("Doacao") %>' />
            <br />
            Nome:
            <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
            <br />
            Data Doação:
            <asp:TextBox ID="DATADOACAOTextBox" runat="server" Text='<%# Bind("DATADOACAO") %>' />
            <br />
            ITENS:
            <asp:TextBox ID="ITENSTextBox" runat="server" Text='<%# Bind("ITENS") %>' />
            <br />
            DISPONIBILIDADE:
            <asp:TextBox ID="DISPONIBILIDADETextBox" runat="server" Text='<%# Bind("DISPONIBILIDADE") %>' />
            <br />
            OBSERVACAO:
            <asp:TextBox ID="OBSERVACAOTextBox" runat="server" Text='<%# Bind("OBSERVACAO") %>' />
            <br />
            ESTADO:
            <asp:TextBox ID="ESTADOTextBox" runat="server" Text='<%# Bind("ESTADO") %>' />
            <br />
            TELEFONERES:
            <asp:TextBox ID="TELEFONERESTextBox" runat="server" Text='<%# Bind("TELEFONERES") %>' />
            <br />
            TELEFONECEL:
            <asp:TextBox ID="TELEFONECELTextBox" runat="server" Text='<%# Bind("TELEFONECEL") %>' />
            <br />
            EMAIL:
            <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Atualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                CommandName="Cancel" Text="Cancelar" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Doacao:
            <asp:Label ID="DoacaoLabel1" runat="server" Text='<%# Eval("Doacao") %>' />
            <br />
            Nome:
            <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
            <br />
            Data Doação:
            <asp:TextBox ID="DATADOACAOTextBox" runat="server" Text='<%# Bind("DATADOACAO") %>' />
            <br />
            ITENS:
            <asp:TextBox ID="ITENSTextBox" runat="server" Text='<%# Bind("ITENS") %>' />
            <br />
            DISPONIBILIDADE:
            <asp:TextBox ID="DISPONIBILIDADETextBox" runat="server" Text='<%# Bind("DISPONIBILIDADE") %>' />
            <br />
            OBSERVACAO:
            <asp:TextBox ID="OBSERVACAOTextBox" runat="server" Text='<%# Bind("OBSERVACAO") %>' />
            <br />
            ESTADO:
            <asp:TextBox ID="ESTADOTextBox" runat="server" Text='<%# Bind("ESTADO") %>' />
            <br />
            TELEFONERES:
            <asp:TextBox ID="TELEFONERESTextBox" runat="server" Text='<%# Bind("TELEFONERES") %>' />
            <br />
            TELEFONECEL:
            <asp:TextBox ID="TELEFONECELTextBox" runat="server" Text='<%# Bind("TELEFONECEL") %>' />
            <br />
            EMAIL:
            <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Inserir" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                CommandName="Cancel" Text="Cancelar" />
        </InsertItemTemplate>
        <ItemTemplate>
            Doacao:
            <asp:Label ID="DoacaoLabel" runat="server" Text='<%# Eval("Doacao") %>' />
            <br />
            Nome:
            <asp:Label ID="NomeLabel" runat="server" Text='<%# Bind("Nome") %>' />
            <br />
            Data Doação:
            <asp:Label ID="DATADOACAOLabel" runat="server" Text='<%# Bind("DATADOACAO") %>' />
            <br />
            ITENS:
            <asp:Label ID="ITENSLabel" runat="server" Text='<%# Bind("ITENS") %>' />
            <br />
            DISPONIBILIDADE:
            <asp:Label ID="DISPONIBILIDADELabel" runat="server" Text='<%# Bind("DISPONIBILIDADE") %>' />
            <br />
            OBSERVACAO:
            <asp:Label ID="OBSERVACAOLabel" runat="server" Text='<%# Bind("OBSERVACAO") %>' />
            <br />
            ESTADO:
            <asp:Label ID="ESTADOLabel" runat="server" Text='<%# Bind("ESTADO") %>' />
            <br />
            TELEFONERES:
            <asp:Label ID="TELEFONERESLabel" runat="server" Text='<%# Bind("TELEFONERES") %>' />
            <br />
            TELEFONECEL:
            <asp:Label ID="TELEFONECELLabel" runat="server" Text='<%# Bind("TELEFONECEL") %>' />
            <br />
            EMAIL:
            <asp:Label ID="EMAILLabel" runat="server" Text='<%# Bind("EMAIL") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Alterar" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                Text="Excluir" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="Novo" />
        </ItemTemplate>
    </asp:FormView>
    </form>
</body>
</html>
