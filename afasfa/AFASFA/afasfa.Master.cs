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
using Servico.Seguranca;

namespace AFASFA
{
    public partial class afasfa : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AtualizaPainelLogin(Request.IsAuthenticated);
        }

        private void AtualizaPainelLogin(bool autenticado)
        {
            pnLogin.Visible = !autenticado;
            pnLogout.Visible = autenticado;
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
        }


        /// <summary>
        /// Evento de click do botao de login
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //Gera hash da senha para confrontar com o que está no banco de dados
            if (Seguranca.LoginValido(Server.HtmlEncode(txtUsuario.Text), Server.HtmlEncode(txtSenha.Text)))
            {
                FormsAuthenticationTicket _ticket = new FormsAuthenticationTicket(1,
                                                                                  txtUsuario.Text,
                                                                                  DateTime.Now,
                                                                                  DateTime.Now.AddMinutes(30),
                                                                                  false,
                                                                                  string.Empty);
                Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(_ticket)));
                ltUsuario.Text = txtUsuario.Text;
                AtualizaPainelLogin(true);       
            }
            else
            {
                AtualizaPainelLogin(false);
                lbErro.Visible = true;
            }

        }

        /// <summary>
        /// Evento de click do Logout
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lkLogout_Click(object sender, EventArgs e)
        {
            Response.Cookies.Remove(FormsAuthentication.FormsCookieName);
            FormsAuthentication.SignOut();
            AtualizaPainelLogin(false);
        }

    }
}
