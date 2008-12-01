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
using System.IO;


namespace AFASFA.Cadastros
{
    public partial class cadastro_eventos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Master as afasfa).VerificaAcessoNegado(true))
            {
                return;
            }
            
            if (!IsPostBack)
            {
                (this.FormView1.FindControl("DataEventoTextBox") as TextBox).Text = DateTime.Today.ToString();
                (this.FormView1.FindControl("DataMaximaTextBox") as TextBox).Text = DateTime.Today.AddYears(1).ToString();
            }

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
        
        private string RetornaNomeArquivo()
        {
            //if ((this.FormView1.FindControl("UploadFotoEvento") as FileUpload).HasFile)
            {
                return String.Concat(System.IO.Path.GetRandomFileName(), System.IO.Path.GetExtension((this.FormView1.FindControl("UploadFotoEvento") as FileUpload).FileName));
            }
        }

        private void CarregaArquivo(string nomeArquivo)
        {
            string _diretorio = String.Concat(Server.MapPath("/"), "foto/");
            //Se tem arquivo informado
            if ((this.FormView1.FindControl("UploadFotoEvento") as FileUpload).HasFile)
            {
                //Cria o diretorio se nao existir
                if (!Directory.Exists(_diretorio))
                {
                    Directory.CreateDirectory(_diretorio);
                }
                //Salva o arquivo com o hash gerado a partir do nome e a data atual
                (this.FormView1.FindControl("UploadFotoEvento") as FileUpload).SaveAs(_diretorio + nomeArquivo);
            }
        }
        protected void chkJaRealizado_OnCheckedChanged(object sender, EventArgs e)
        {
            (this.FormView1.FindControl("lblJaRealizado") as Label).Visible = (this.FormView1.FindControl("chkJaRealizado") as CheckBox).Checked;
            (this.FormView1.FindControl("lblNaoRealizado") as Label).Visible = !(this.FormView1.FindControl("chkJaRealizado") as CheckBox).Checked;

        }

        protected void ApresentarCheckBox_OnCheckedChanged(object sender, EventArgs e)
        {
            (this.FormView1.FindControl("lblNaoApresentarEvento") as Label).Visible = !(this.FormView1.FindControl("ApresentarCheckBox") as CheckBox).Checked;
            (this.FormView1.FindControl("lblApresentarEvento") as Label).Visible = (this.FormView1.FindControl("ApresentarCheckBox") as CheckBox).Checked;

        }

        protected void ReservaDisponivelCheckBox_OnCheckedChanged(object sender, EventArgs e)
        {
            (this.FormView1.FindControl("ReservaDisponivel") as Label).Visible = (this.FormView1.FindControl("ReservaDisponivelCheckBox") as CheckBox).Checked;
            (this.FormView1.FindControl("ReservaNaoDisponivel") as Label).Visible = !(this.FormView1.FindControl("ReservaDisponivelCheckBox") as CheckBox).Checked;

        }
        
        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            string _nomeArquivo = RetornaNomeArquivo();
            CarregaArquivo(_nomeArquivo);
            e.Values["FOTOINICIAL"] = _nomeArquivo;
            e.Values["Apresentar"] = (this.FormView1.FindControl("ApresentarCheckBox") as CheckBox).Checked;
            e.Values["JaRealizado"] = (this.FormView1.FindControl("chkJaRealizado") as CheckBox).Checked;
            e.Values["ReservaDisponivel"] = (this.FormView1.FindControl("ReservaDisponivelCheckBox") as CheckBox).Checked;
            e.Values["DataEvento"] = (this.FormView1.FindControl("DataEventoTextBox") as TextBox).Text;
        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            this.ModalPopupExtender2.Show();
        }

    }
}
