using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AFASFA.acesso_dados;
using acesso_dados.DataSetAFASFATableAdapters;
using AFASFA.afasfaWebService;
using Servico.Util;

namespace AFASFA
{
    public partial class mala_direta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                afasfaWebService.wsAfasfa result = new AFASFA.afasfaWebService.wsAfasfa();
                this.drMeses.DataSource = result.RetornaMeses();
                this.drMeses.DataBind();
            }
        }
        protected void btnCriarPesquisa_Click(object sender, EventArgs e)
        {
            if (this.chkGeral.Checked)
            {
                this.pnPesquisaGeral.Visible = true;
                this.pnPesquisaAniversariantes.Visible = false;
            }
            else
            {
                this.pnPesquisaGeral.Visible = false;
                this.pnPesquisaAniversariantes.Visible = true;                
            }
        }
        protected void chkGeral_OnCheckedChanged(object sender, EventArgs e)
        {
            this.drMeses.Enabled = !this.chkGeral.Checked;
        }
    }
}
