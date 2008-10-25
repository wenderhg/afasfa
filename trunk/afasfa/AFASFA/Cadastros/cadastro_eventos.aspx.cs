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
using AFASFA.acesso_dados;
using AFASFA.acesso_dados.Seguranca;
using acesso_dados.Properties;
using acesso_dados.DataSetAFASFATableAdapters;
using Servico.Util;


namespace AFASFA.Cadastros
{
    public partial class cadastro_eventos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //TextBox _txtDataEvento = (this.FormView1.FindControl("DataEventoTextBox") as TextBox);
            //if (_txtDataEvento != null)
            //{
            //    _txtDataEvento.Text = DateTime.Today.ToShortDateString();
            //}
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
        protected void InsertButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                InserirUsuario();
            }
        }
        private void InserirUsuario()
        {
            if (Conexao.AfasfaManager.eventosTableAdapter == null)
            {
                Conexao.AfasfaManager.eventosTableAdapter = new eventosTableAdapter();
            }
            string _nomeArquivo = RetornaNomeArquivo();
            CarregaArquivo(_nomeArquivo);
            Conexao.AfasfaManager.eventosTableAdapter.Insert(this.LocalEventoTextBox.Text,
                                                             this.LocalEventoTextBox.Text,
                                                             this.LocalEventoTextBox.Text,
                                                             _nomeArquivo,
                                                             Convert.ToByte(this.chkJaRealizado.Checked),
                                                             Convert.ToByte(this.ApresentarCheckBox.Checked),
                                                             Convert.ToByte(this.ReservaDisponivelCheckBox.Checked),
                                                             this.DataMaximaTextBox.Text,
                                                             this.ValorConviteAdultoTextBox.Text,
                                                             this.ValorConviteCriancaTextBox.Text,
                                                             this.ObservacaoTextBox.Text);
        }

        private string RetornaNomeArquivo()
        {
            return String.Concat(AFASFA.Servico.Seguranca.Seguranca.RetornaSenha(this.UploadFotoEvento.FileName + DateTime.Now.ToString()),
                System.IO.Path.GetExtension(this.UploadFotoEvento.FileName));
        }

        private void CarregaArquivo(string nomeArquivo)
        {
            string _diretorio = String.Concat(Server.MapPath("/"), "foto/");
            //Se tem arquivo informado
            if (this.UploadFotoEvento.HasFile)
            {
                //Cria o diretorio se nao existir
                if (!Directory.Exists(_diretorio))
                {
                    Directory.CreateDirectory(_diretorio);
                }
                //Salva o arquivo com o hash gerado a partir do nome e a data atual
                this.UploadFotoEvento.SaveAs(_diretorio + nomeArquivo);
            }
        }
        protected void chkJaRealizado_OnCheckedChanged(object sender, EventArgs e)
        {
            this.lblJaRealizado.Visible = this.chkJaRealizado.Checked;
        }

    }
}
