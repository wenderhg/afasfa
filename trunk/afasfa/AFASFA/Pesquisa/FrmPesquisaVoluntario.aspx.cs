using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using acesso_dados;

namespace AFASFA.Pesquisa
{
    public partial class FrmPesquisaVoluntario : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Master as afasfa).VerificaAcessoNegado(true))
            {
                return;
            }
            if (!IsPostBack)
            {
                this.Filtros = new FiltroCollection();
            }
        }

        protected void ckFiltroPersonalizado_CheckedChanged(object sender, EventArgs e)
        {
            this.phFiltroPersonalizado.Visible = this.ckFiltroPersonalizado.Checked;
            if (!this.ckFiltroPersonalizado.Checked)
            {
                this.Filtros.Clear();
            }
        }

        public FiltroCollection Filtros { get; set; }
    }
}
