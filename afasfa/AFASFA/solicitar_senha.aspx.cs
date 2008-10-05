using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AFASFA.Servico.Seguranca;
using AFASFA.acesso_dados.Seguranca;
using Servico.Util;

namespace AFASFA
{
    public partial class solicitar_senha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviarSenha_Click(object sender, EventArgs e)
        {
            Usuario _usuario = Seguranca.RetornaSolicitaSenha(Server.HtmlEncode(UsuarioTextBox.Text), Server.HtmlEncode(EmailTextBox.Text));
            if (_usuario != null)
            {
                Usuario _senha = Seguranca.RetornaSolicitaSenha(Server.HtmlEncode(UsuarioTextBox.Text), Server.HtmlEncode(EmailTextBox.Text));
                MailSender.EnviarEMail("rodrigopro@gmail.com", "rodrigoprog", "ceci2701");
            }
            else
            { 

            }
        }
    }
}
