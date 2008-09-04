using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace AFASFA
{
    public partial class TesteGridFormView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LinqDataSource1_ContextCreating(object sender, LinqDataSourceContextEventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            FormView1.PageIndex = e.NewEditIndex;
            GridView1.Visible = false;
            FormView1.Visible = true;
            FormView1.ChangeMode(FormViewMode.Edit);
        }

        protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            if (e.Cancel || e.CancelingEdit)
            {
                FormView1.Visible = false;
                GridView1.Visible = true;
                GridView1.EditIndex = -1;
                FormView1.ChangeMode(FormViewMode.ReadOnly);
            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}
