<%@ Page Title="" Language="C#" MasterPageFile="~/afasfa.Master" AutoEventWireup="true"
    CodeBehind="ComoChegar.aspx.cs" Inherits="AFASFA.ComoChegar.ComoChegar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAS2v6XLJZdnkdSkVSdtzxpBR6lFJuOo_Kjbh4z5CsiAf7zyP9yBQTlro8cZobrOTc1okRo5Ak0LYQuw"
        type="text/javascript"></script>

    <script type="text/javascript">

        //<![CDATA[

        //Lar:-23.098996821848434, -47.199647426605225


        var map = null;
        function load() {
            if (GBrowserIsCompatible()) {
                map = new GMap2(document.getElementById("map"));
                map.setCenter(new GLatLng(-23.098996821848434, -47.199647426605225), 18);
                map.enableInfoWindow();
                map.enableScrollWheelZoom();
                map.setMapType(G_HYBRID_MAP);
                map.addControl(new GOverviewMapControl());
                map.addControl(new GSmallMapControl());
                map.addControl(new GMenuMapTypeControl());

                map.addOverlay(new GMarker(map.getCenter(), { title: "Lar São Francisco" }));

                GEvent.addListener(map, "click", function(overlay, latlng) {
                    if (latlng != null)
                        alert("Aqui é:" + latlng.lat() + " " + latlng.lng() + " " + map.getZoom());
                });
            }
        }

        function procuraEndereco() {
            var txtEndereco = document.getElementById("<% =txtEndereco.ClientID %>");
            var _busca = new GClientGeocoder();
            _busca.getLatLng(txtEndereco.value, resultadoBusca);
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
    <table>
        <tbody>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Label ID="lblInstrucoes" runat="server" Text="Utilize o mapa abaixo para encontrar o endereço que será usado como origem para montar a rota até a instituição, para isso navegue no mapa e clique sobre o endereço desejado ou utilize o campo abaixo para digitar o endereço origem"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEndereco" runat="server" Text="Informe seu endereço: "></asp:Label>
                    <asp:TextBox ID="txtEndereco" runat="server"></asp:TextBox>
                </td>
                <td>
                    <input type="button" title="Montar rota" value="Montar rota" onclick="procuraEndereco();" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <div id="map" style="width: 600px; height: 400px">
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
