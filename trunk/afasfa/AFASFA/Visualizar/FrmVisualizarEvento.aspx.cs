using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AFASFA.acesso_dados;
using System.Data;
using AFASFA.acesso_dados.DataSetAfasfaTableAdapters;

namespace AFASFA.Visualizar
{
    public partial class FrmVisualizarEvento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (Conexao.AfasfaManager.eventosTableAdapter = new eventosTableAdapter())
            {
                rptEvento.DataSource = Conexao.AfasfaManager.eventosTableAdapter.BuscaPorData();
            }
            rptEvento.DataBind();

        }

        protected void rptEvento_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                //e.Item.FindControl("btnReservarConvite").ToString();
                var _btnReservarConvite = (e.Item.FindControl("btnReservarConvite") as Button);
                var _litJarealizado = (e.Item.FindControl("litJarealizado") as Literal);
                var _eventos = ((e.Item.DataItem as DataRowView).Row as DataSetAfasfa.eventosRow);
                if (!_eventos.IsNull("JaRealizado"))
                {
                    if (_eventos.JaRealizado)
                    {
                        _btnReservarConvite.Visible = false;
                        _litJarealizado.Text = "EVENTO JÁ REALIZADO";


                    }
                    else
                    {
                        _btnReservarConvite.Visible = true;
                        _litJarealizado.Text = "";

                    }
                    _btnReservarConvite.Visible = _eventos.ReservaDisponivel;

                }
                //(e.Item.FindControl("img") as Image).ImageUrl = (e.Item.DataItem as DataRow
            }
        }

        private bool isIsValid(bool p)
        {
            throw new NotImplementedException();
        }
    }
}
