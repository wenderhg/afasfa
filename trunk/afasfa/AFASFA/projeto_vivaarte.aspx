<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="projeto_vivaarte.aspx.cs" Inherits="AFASFA.projeto_vivaarte" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <div id="divProjetoVivaArte" class="TextoTitulo" runat="server">
        PROJETO VIVA-ARTE
    </div>
    <p class="txtFormulario" align="justify">
        <strong>Finalidade: </strong>Dentro do trabalho desenvolvido visando a promo&ccedil;&atilde;o
        social, neste projeto &eacute; realizado a entrega mensal de cestas b&aacute;sicas,
        leite e outros de acordo com a necessidade indiv&iacute;dual de cada fam&iacute;lia
        que em contra partida, todos os cadastrados ou representados pelos seus fam&iacute;liares
        frequentam oficinas de cunho s&oacute;cio-educativas, com visibilidade plena de
        resgate da cidad&acirc;nia, bem como meios de que a fam&iacute;lia venha obter orienta&ccedil;&atilde;o
        e aux&iacute;lio para aumento de renda percapita. Dentro deste projeto &eacute;
        realizado trabalho direto de apoio e incentivo com genitores e familiares de crian&ccedil;as
        e adolescentes abrigados.<br>
    </p>
    <p>
        <asp:HyperLink ID="lnkFotosProjetoVivarte" NavigateUrl="~/fotos_projetos_vivaarte.aspx"
            ForeColor="White" runat="server" Target="_blank" BackColor="#666699" BorderColor="#003366"
            BorderStyle="Double" BorderWidth="2px" Font-Names="Verdana" Font-Size="X-Small"
            Font-Bold="true" Font-Underline="false" ToolTip="Click aqui para ver fotos dos artesanatos feito neste projeto.">Veja fotos dos artesanatos feito neste projeto.</asp:HyperLink>
    </p>
</asp:Content>
