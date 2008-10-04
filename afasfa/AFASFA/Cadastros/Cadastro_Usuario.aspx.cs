using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace AFASFA.Cadastros
{
    public partial class Cadastro_Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPreencheApelido_Click(object sender, EventArgs e)
        {
            this.ApelidoTextBox.Text = this.LoginTextBox.Text;
            this.NomeTextBox.Focus();
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            
            this.ObjectDataSource1.InsertParameters["Login"].DefaultValue = LoginTextBox.Text;
            this.ObjectDataSource1.InsertParameters["Nome"].DefaultValue = NomeTextBox.Text;
            this.ObjectDataSource1.InsertParameters["Apelido"].DefaultValue = ApelidoTextBox.Text;
            //this.ObjectDataSource1.InsertParameters["Administrador"].DefaultValue = AdministradorCheckBox.Checked ? "S" : "N";
            this.ObjectDataSource1.InsertParameters["SENHA"].DefaultValue = txtSenha.Text;
            this.ObjectDataSource1.InsertParameters["TelefoneRes"].DefaultValue = TelefoneResTextBox.Text;
            this.ObjectDataSource1.InsertParameters["TelefoneCel"].DefaultValue = TelefoneCelTextBox.Text;
            this.ObjectDataSource1.InsertParameters["EMail"].DefaultValue = EMailTextBox.Text;
            //this.ObjectDataSource1.InsertParameters["EMail"].DefaultValue = fuFoto.FileName;
            
            this.ObjectDataSource1.InsertParameters["RECEBERINFORMACOES"].DefaultValue = ReceberInformacoesCheckBox.Checked ? "S" : "N";
            this.ObjectDataSource1.Insert();
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            //this.ObjectDataSource1.Cancel
        }
    }
}
