using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AFASFA.Cadastros
{
    public partial class cadastro_voluntarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            this.ModalPopupExtender1.Show();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            this.ModalPopupExtender1.Hide();
            this.FormView1.ChangeMode(FormViewMode.ReadOnly);
            this.FormView1.ChangeMode(FormViewMode.Insert);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.ModalPopupExtender1.Hide();
        }

    }
}
