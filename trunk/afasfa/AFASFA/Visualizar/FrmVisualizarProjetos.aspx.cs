using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AFASFA.acesso_dados;
using acesso_dados.DataSetAFASFATableAdapters;
using acesso_dados;
using System.Data;


namespace AFASFA.Visualizar
{
    public partial class FrmVisualizarProjetos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)           
        {
            using (Conexao.AfasfaManager.projetosTableAdapter = new projetosTableAdapter())
            {
                rptProjetos.DataSource = Conexao.AfasfaManager.projetosTableAdapter.GetData();
            }            
            rptProjetos.DataBind();
        }

        protected void rptProjetos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                //e.Item.FindControl("btnReservarConvite").ToString();
            }
        }
    }
}
            
            