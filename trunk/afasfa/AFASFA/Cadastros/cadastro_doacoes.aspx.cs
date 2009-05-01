using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Servico.Util;
using System.Text;
using System.Collections;

namespace AFASFA.cadastros
{
    public partial class cadastro_doacoes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((this.FormView1.FindControl("DataDoacaoTextBox") as TextBox) != null)
                    (this.FormView1.FindControl("DataDoacaoTextBox") as TextBox).Text = DateTime.Today.ToString();
            }
            (this.Page.Master as afasfa).Resumo.EnableClientScript = true;
        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            this.ModalPopupExtender1.Show();
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            //System.Net.Mail.MailMessage _message = new System.Net.Mail.MailMessage();
            //_message.IsBodyHtml = true;
            //_message.From = new System.Net.Mail.MailAddress(@"afa@afasaofranciscodeassis.org.br");
            //_message.Subject = "Doação aguardando aprovação.";
            //_message.Body = "Foi incluido uma doação";
            //_message.To.Add(@"rodrigoprog@gmail.com");
            //System.Net.Mail.SmtpClient _smtp = new System.Net.Mail.SmtpClient("afasaofranciscodeassis.org.br");
            ////_smtp.Host = "smtp.";
            ////_smtp.Port = 587;
            //_smtp.EnableSsl = false;
            ////System.Net.Security.NegotiateStream _auth = new System.Net.Security.NegotiateStream();
            ////_auth.AuthenticateAsServer(
            //    //System.Security.Authentication.SslProtocols.Tls _cred = new System.Net.NetworkCredential();
            //System.Net.NetworkCredential _cred = new System.Net.NetworkCredential();
            ////_cred.Domain = @"afasaofranciscodeassis.org.br";
            //_cred.UserName = "afasaofranciscodeass";
            //_cred.Password = @"RODRIGO1212";            
            //_smtp.Credentials = _cred;
            ////_smtp.ServicePoint.Address = new Uri(@"afasaofranciscodeassis.org.br");
            //_smtp.Send(_message);
            this.ModalPopupExtender2.Show();
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

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            this.ModalPopupExtender2.Show();
        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {

            TextBox _email = (this.FormView1.FindControl("emailTextBox") as TextBox);
            MailSender.EnviarEMail(_email.Text, "Doação",
                    RetornaCampos(e.Values));

            if (_email != null && !String.IsNullOrEmpty(_email.Text))
            {
                MailSender.EnviarEMail(_email.Text, "Agradecimento pela doação.",
                    "Muito Obrigado por disponibilizar sua doação. Logo entraremos em contato");
            }
        }

        private string RetornaCampos(System.Collections.Specialized.IOrderedDictionary iOrderedDictionary)
        {
            StringBuilder str = new StringBuilder();

            foreach (DictionaryEntry item in iOrderedDictionary)
            {
                str.Append(string.Format("{0} \t\t {1}\n", item.Key, item.Value));
            }

            return str.ToString();
        }

    }
}
