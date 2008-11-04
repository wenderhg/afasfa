using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AFASFA.acesso_dados;
using acesso_dados.DataSetAFASFATableAdapters;

namespace AFASFA.Visualizar
{
    public partial class FrmVisualizarEvento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (Conexao.AfasfaManager.eventosTableAdapter = new eventosTableAdapter())
            {
                rptEvento.DataSource = Conexao.AfasfaManager.eventosTableAdapter.GetData();
            }
            
            rptEvento.DataBind();
        }

        protected void rptEvento_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                //(e.Item.FindControl("img") as Image).ImageUrl = (e.Item.DataItem as DataRow
            }
        }
    }
}
