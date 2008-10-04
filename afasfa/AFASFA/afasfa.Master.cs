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
using AFASFA.Servico.Seguranca;
using AFASFA.acesso_dados.Seguranca;
using Servico.Util;

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
            pnMenuCadastro.Visible = autenticado;
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
            //Retorna objeto usuario se o usuario existir e a senha estiver valida
            Usuario _usuario = Seguranca.RetornaUsuarioValido(Server.HtmlEncode(txtUsuario.Text), Server.HtmlEncode(txtSenha.Text));
            if (_usuario != null)
            {
                FormsAuthenticationTicket _ticket = new FormsAuthenticationTicket(1,
                                                                                  txtUsuario.Text,
                                                                                  DateTime.Now,
                                                                                  DateTime.Now.AddMinutes(30),
                                                                                  false,
                                                                                  string.Empty);
                Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(_ticket)));
                ltSaudacao.Text = RetornaSaudacaoCompleta(_usuario);
                //ltUsuario.Text = txtUsuario.Text;
                AtualizaPainelLogin(true);
            }
            else
            {
                AtualizaPainelLogin(false);
                this.ModalPopupExtenderGeral.TargetControlID = this.btnSolicitarSenha.ID;
                this.ModalPopupExtenderGeral.PopupControlID = this.pnErroLogin.ClientID;
                //this.ModalPopupExtenderGeral.Show();
            }

        }

        private string RetornaSaudacaoCompleta(Usuario usuario)
        {
            //Retorna string formatada da saudacao
            return String.Format("{0} {1} seja bem vind{2}", RetornaSaudacao(),
                usuario.Apelido,
                usuario.Sexo.Equals("M") ? "o" : "a" //tipo iif, expressao ? true : false
                );
        }

        private string RetornaSaudacao()
        {
            if (DateTime.Now.Hour < 12)
            {
                return "Bom dia";
            }
            else if (DateTime.Now.Hour < 19)
            {
                return "Boa tarde";
            }
            else
                return "Boa noite";
        }

        /// <summary>
        /// Evento de click do Logout
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkLogoff_Click(object sender, EventArgs e)
        {
            //Response.Cookies.Remove(FormsAuthentication.FormsCookieName);
            //FormsAuthentication.SignOut();
            //AtualizaPainelLogin(false);
            this.ModalPopupExtenderEfetuarLogoff.Show();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            this.ModalPopupExtenderGeral.TargetControlID = this.btnLogin.ID;
            //this.ModalPopupExtenderGeral.Hide();
        }


        protected void btnOkSolicitarSenha_Click(object sender, EventArgs e)
        {
            Usuario _usuario = Seguranca.RetornaSolicitaSenha(Server.HtmlEncode(LoginTextBox.Text), Server.HtmlEncode(EmailTextBox.Text));
            if (_usuario != null)
            {
                Usuario _senha = Seguranca.RetornaSolicitaSenha(Server.HtmlEncode(LoginTextBox.Text), Server.HtmlEncode(EmailTextBox.Text));
                //MailSender.EnviarEMail("rodrigopro@gmail.com", "rodrigoprog", "ceci2701");
            }
            this.ModalPopupExtenderGeral.Hide();
        }
        
        protected void btnCancelarEfetuarLogoff_Click(object sender, EventArgs e)
        {
            //this.ModalPopupExtenderEfetuarLogoff.Show();
        }

        /// <summary>
        /// Evento click do botão OK do modalpopup efetuar logoff
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnOkEfetuarLogoff_Click(object sender, EventArgs e)
        {
            Response.Cookies.Remove(FormsAuthentication.FormsCookieName);
            FormsAuthentication.SignOut();
            AtualizaPainelLogin(false);
            this.ModalPopupExtenderEfetuarLogoff.Hide();
        }
    }
}
