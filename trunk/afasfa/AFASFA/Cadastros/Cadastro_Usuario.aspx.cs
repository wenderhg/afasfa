using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using acesso_dados;
using acesso_dados.DataSetAFASFATableAdapters;
using AFASFA.acesso_dados;
using System.IO;


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
            if (Page.IsValid)
            {
                InserirUsuario();
            }
        }

        private void InserirUsuario()
        {
            using (Conexao.AfasfaManager.usuariosTableAdapter = new usuariosTableAdapter())
            {
                Conexao.AfasfaManager.usuariosTableAdapter.Insert(this.LoginTextBox.Text,
                                                                  AFASFA.Servico.Seguranca.Seguranca.RetornaSenha(this.txtSenha.Text),
                                                                  this.AdministradorCheckBox.Checked ? "S" : "N",
                                                                  InserirInformacoesContato()
                                                                  );
            }
        }


        private int? InserirInformacoesContato()
        {
            int? result = null;
            using (Conexao.AfasfaManager.infocontatoTableAdapter = new infocontatoTableAdapter())
            {
                string _nomeArquivo = RetornaNomeArquivo();
                CarregaArquivo(_nomeArquivo);
                result = Conexao.AfasfaManager.infocontatoTableAdapter.Insert(
                            this.NomeTextBox.Text,
                            _nomeArquivo,
                            Convert.ToByte(this.ReceberInformacoesCheckBox.Checked),
                            null,
                            null,
                            null,
                            null,
                            null,
                            null,
                            null,
                            RetornaTelefone(this.TelefoneCelTextBox.Text),
                            RetornaTelefone(this.TelefoneResTextBox.Text),
                            this.EMailTextBox.Text,
                            ddlSexo.SelectedValue,
                            this.ApelidoTextBox.Text);
                //Se inseriu alguma coisa então busca o ID
                if (result >= 1)
                {
                    result = Convert.ToInt32(Conexao.AfasfaManager.infocontatoTableAdapter.RetornaUltimoID());
                }
            }
            return result;
        }

        private string RetornaNomeArquivo()
        {
            return String.Concat(AFASFA.Servico.Seguranca.Seguranca.RetornaSenha(this.fuFoto.FileName + DateTime.Now.ToString()),
                System.IO.Path.GetExtension(this.fuFoto.FileName));
        }

        private void CarregaArquivo(string nomeArquivo)
        {
            string _diretorio = String.Concat(Server.MapPath("/"), "foto/");
            //Se tem arquivo informado
            if (this.fuFoto.HasFile)
            {
                //Cria o diretorio se nao existir
                if (!Directory.Exists(_diretorio))
                {
                    Directory.CreateDirectory(_diretorio);
                }
                //Salva o arquivo com o hash gerado a partir do nome e a data atual
                this.fuFoto.SaveAs(_diretorio + nomeArquivo);
            }
        }

        private string RetornaTelefone(string telefone)
        {
            decimal _fone;
            if (decimal.TryParse(telefone, out _fone))
            {
                return _fone.ToString();
            }
            else
            {
                return null;
            }
        }

        private void AtualizaDados(DataSetAFASFA.usuariosDataTable _usuario)
        {

            //Conexao.AfasfaManager.usuariosTableAdapter.Insert(_usuario);
        }

        private string RetornaSexo()
        {
            CheckBox _ck = (this.FindControl("chkFeminino") as CheckBox);
            if (_ck == null)
            {
                return null;
            }
            if (_ck.Checked)
            {
                return "F";
            }
            else
            {
                return "M";
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            //this.ObjectDataSource1.Cancel
        }

        protected void CustomValidatorcbl_Sexo_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //Considera validador valido se um dos checks estiverem marcados
            CheckBox _chkFeminino = (this.FindControl("chkFeminino") as CheckBox);
            CheckBox _chkMasculino = (this.FindControl("chkMasculino") as CheckBox);
            args.IsValid = _chkFeminino.Checked != _chkMasculino.Checked;
        }

        protected void CustomValidatorLoginRepetido_ServerValidate(object source, ServerValidateEventArgs args)
        {
            using (Conexao.AfasfaManager.usuariosTableAdapter = new usuariosTableAdapter())
            {
                args.IsValid = Conexao.AfasfaManager.usuariosTableAdapter.RetornaLoginRepetido(this.LoginTextBox.Text) == 0;
            }            
        }

        protected void CustomValidatorContato_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //Se algum não for empty, retorna true
            args.IsValid = (!String.IsNullOrEmpty(this.TelefoneCelTextBox.Text) || !String.IsNullOrEmpty(this.TelefoneResTextBox.Text) ||
                !String.IsNullOrEmpty(this.EMailTextBox.Text));
        }
        
        protected void btnOK_Click(object sender, EventArgs e)
        {
            this.ModalPopupExtender1.Hide();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.ModalPopupExtender1.Hide();
        }

    }
}
