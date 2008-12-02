<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="ComoChegar.aspx.cs" Inherits="AFASFA.ComoChegar.ComoChegar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAS2v6XLJZdnkdSkVSdtzxpBR6lFJuOo_Kjbh4z5CsiAf7zyP9yBQTlro8cZobrOTc1okRo5Ak0LYQuw"
        type="text/javascript"></script>

    <script type="text/javascript">

        //<![CDATA[

        //Lar:-23.098996821848434, -47.199647426605225


        var map = null;
        var _busca = null;

        function load() {
            if (GBrowserIsCompatible()) {
                map = new GMap2(document.getElementById("map"));
                map.setCenter(new GLatLng(-23.09913498340584, -47.19956696033478), 18);
                map.enableInfoWindow();
                map.enableScrollWheelZoom();
                map.setMapType(G_HYBRID_MAP);
                map.addControl(new GOverviewMapControl());
                map.addControl(new GSmallMapControl());
                map.addControl(new GMenuMapTypeControl());

                _busca = new GDirections(map, document.getElementById("rota"));
                GEvent.addListener(_busca, "error", manipulaErros);
                GEvent.addListener(_busca, "load", carregaRota);
                GEvent.addListener(_busca, "addoverlay", adicionaCamadas);

                var _larMarker = new GMarker(map.getCenter(), { title: "Lar São Francisco" });
                GEvent.addListener(_larMarker, "click", function() {
                    _larMarker.openInfoWindowHtml("<b>Associação Filantrópica e Assistencial<br />São Francisco de Assis.</b>");
                });
                map.addOverlay(_larMarker);

                //                GEvent.addListener(map, "click", function(overlay, latlng) {
                //                    if (latlng != null)
                //                        alert("Aqui é:" + latlng.lat() + " " + latlng.lng() + " " + map.getZoom());
                //                });
            }
        }

        function carregaRota() {

            var portaoLarLatLng = new GLatLng(-23.099248473150272, -47.199395298957825);
            var dentroLarLatLng = new GLatLng(-23.09913498340584, -47.19956696033478);
            var gp = _busca.getPolyline();
            //Vai até a recepcao do Lar
            gp.insertVertex(gp.getVertexCount(), dentroLarLatLng);
            //Completa a rota até a entrada do lar
            gp.insertVertex(gp.getVertexCount(), portaoLarLatLng);
            //Altera o segundo ponto da rota para dentro do lar
            var _marker = _busca.getMarker(1);
            _marker.setLatLng(portaoLarLatLng);

        }

        function adicionaCamadas() {
            map.setZoom(map.getZoom() - 1);
            var _marker = _busca.getMarker(1);
            _marker.hide();
            map.removeOverlay(_marker);
        }

        function manipulaErros() {
            if (_busca.getStatus().code == G_GEO_UNKNOWN_ADDRESS)
                alert("Não é possível encontrar um ponto específico com o endereço pesquisado.\nVerique se o endereço está correto e/ou contém todas as informações necessárias como Estado ou tente encontrar pelo CEP.");
            else if (_busca.getStatus().code == G_GEO_SERVER_ERROR)
                alert("Não foi possível renderizar corretamente o endereço requisitado.");

            else if (_busca.getStatus().code == G_GEO_MISSING_QUERY)
                alert("Não existe parametro para pesquisa ou ele não tem valor.");

            //   else if (gdir.getStatus().code == G_UNAVAILABLE_ADDRESS)  <--- Doc bug... this is either not defined, or Doc is wrong
            //     alert("The geocode for the given address or the route for the given directions query cannot be returned due to legal or contractual reasons.\n Error code: " + gdir.getStatus().code);

            else if (_busca.getStatus().code == G_GEO_BAD_KEY)
                alert("Chave passada está incorreta.");

            else if (_busca.getStatus().code == G_GEO_BAD_REQUEST)
                alert("As informações de rota estão com formato inválido.");

            else alert("Erro desconhecido.");

        }

        function procuraEndereco() {
            var txtEndereco = document.getElementById("<% =txtEndereco.ClientID %>");
            _busca.load("from: " + txtEndereco.value + ", Brasil to: Estrada Municipal Pedro Vila 230, Indaiatuba, SP, Brasil", { "locale": "pt_BR" });
        }

        function resultadoBusca(latlng) {
            if (latlng == null) {
                alert('Endereço não encontrado.');
                return;
            }
            map.setCenter(latlng, map.getZoom());
        }
        //]]>
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <div id="divProjetoVivaArte" class="TextoTitulo" runat="server">
        COMO CHEGAR
    </div>
    <br />
    <table>
        <tbody>
            <tr>
                <td colspan="2" style="text-align: center" class="txtFormulario">
                    <asp:Label ID="lblInstrucoes" runat="server" Text="Utilize o mapa abaixo para encontrar o endereço que será usado como origem para montar a rota até a instituição, para isso navegue no mapa e clique sobre o endereço desejado ou utilize o campo abaixo para digitar o endereço origem"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEndereco" runat="server" Text="Informe seu endereço: " CssClass="lblFomulario"></asp:Label>
                    <asp:TextBox ID="txtEndereco" runat="server" Width="250px" CssClass="txtFormulario"
                        AutoCompleteType="HomeStreetAddress"></asp:TextBox>
                </td>
                <td>
                    <input type="button" title="Montar rota" value="Montar rota" onclick="procuraEndereco();"
                        class="txtFormulario" style:color="white" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <div id="map" style="width: 600px; height: 400px">
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <div id="rota">
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
