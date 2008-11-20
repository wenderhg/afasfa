<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="voluntarios.aspx.cs" Inherits="AFASFA.voluntarios1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <div align="justify" class="TextoPaginaCampanhas">
        <p class="TextoTitulo" align="center">
            Seja Voluntário
        </p>
        <p>
            O trabalho voluntário é fundamental para o funcionamento da instituição, pois muitos
            dos trabalhos realizados nos projetos, eventos e assistências tem participação direta
            e indireta dos voluntários. Por isso sua ajuda é muito importante para o funcionamento
            da instituição. Se você deseja se tornar um voluntário click no botão abaixo e preencha
            o formulário que depois entraremos em contato com você. Mas saiba que desde já agradecemos
            sua visita em nosso site.
        </p>
        <p align="center">
            <asp:LinkButton ID="btnExporInteresse" runat="server" Text="Expor Interesse" PostBackUrl="~/Cadastros/cadastro_voluntarios.aspx"
                BackColor="#666699" BorderColor="#003366" BorderStyle="Double" BorderWidth="2px"
                Font-Names="Verdana" ForeColor="White" /> </asp:LinkButton>
        </p>
    </div>
</asp:Content>
