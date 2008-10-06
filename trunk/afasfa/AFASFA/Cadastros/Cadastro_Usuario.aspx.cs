using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using acesso_dados;
using acesso_dados.DataSetAFASFATableAdapters;
using AFASFA.acesso_dados;


namespace AFASFA.Cadastros
{
    public partial class Cadastro_Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPreencheApelido_Click(object sender, EventArgs e)
        {
            (this.FindControl("ApelidoTextBox") as TextBox).Text = (this.FindControl("LoginTextBox") as TextBox).Text;
            //this.ApelidoTextBox.Text = this.LoginTextBox.Text;
            (this.FindControl("NomeTextBox") as TextBox).Focus();
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {


                //Cria instancia da Tabela de usuario
                using (DataSetAFASFA.usuariosDataTable _usuario = new DataSetAFASFA.usuariosDataTable())
                {

                    //Cria instancia do objeto que referencia uma linha da tabela
                    DataSetAFASFA.usuariosRow _row = _usuario.NewusuariosRow();

                    PreencheCampos(_row);

                    _usuario.AddusuariosRow(_row);
                    _usuario.AcceptChanges();

                    AtualizaDados(_usuario);

                }
            }
        }

        private void AtualizaDados(DataSetAFASFA.usuariosDataTable _usuario)
        {
            if (Conexao.AfasfaManager.usuariosTableAdapter == null)
            {
                Conexao.AfasfaManager.usuariosTableAdapter = new usuariosTableAdapter();
            }

            Conexao.AfasfaManager.usuariosTableAdapter.Update(_usuario);
        }

        private void PreencheCampos(DataSetAFASFA.usuariosRow _row)
        {
            //_row.Login = LoginTextBox.Text;
            //_row.Nome = NomeTextBox.Text;
            //_row.APELIDO = ApelidoTextBox.Text;
            //_row.ADMINISTRADOR = AdministradorCheckBox.Checked ? "S" : "N";
            ////Retorna senha criptografada para ser gravada no banco
            //_row.Senha = Servico.Seguranca.Seguranca.RetornaSenha(txtSenha.Text);
            //Decimal _telefone = decimal.MinValue;
            //if (Decimal.TryParse(TelefoneResTextBox.Text, out _telefone))
            //    _row.TELEFONERES = _telefone;
            //_telefone = decimal.MinValue;
            //if (Decimal.TryParse(TelefoneCelTextBox.Text, out _telefone))
            //    _row.TELEFONECEL = _telefone;

            //_row.EMAIL = EMailTextBox.Text;
            //_row.ReceberInformacaoes = ReceberInformacoesCheckBox.Checked ? "S" : "N";
            //_row.Usuario = 0;
            //_row.SEXO = RetornaSexo();
        }

        private string RetornaSexo()
        {
            CheckBox _ck = (this.FindControl("chkFeminino") as CheckBox);
            if (_ck == null)
            {
                return string.Empty;
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

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {

        }
    }
}
