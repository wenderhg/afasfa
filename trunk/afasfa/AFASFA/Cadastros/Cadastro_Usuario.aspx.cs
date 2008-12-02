using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using acesso_dados;
using AFASFA.acesso_dados;
using System.IO;
using Servico.Util;
using AFASFA.acesso_dados.Seguranca;
using AFASFA.acesso_dados.DataSetAfasfaTableAdapters;


namespace AFASFA.Cadastros
{
    public partial class Cadastro_Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Se estiver autenticado traz os dados preenchidos
            if ((!this.IsPostBack) && this.Request.IsAuthenticated)
            {
                PreencheCamposEmTela();
            }
            AjustaControles();
        }

        private void AjustaControles()
        {
            trAdministrador.Visible = (this.Request.IsAuthenticated && (Session[Constantes.UsuarioLogado] as Usuario).Administrador);
            //Exibe se for alteracao
            UpdateButton.Visible = this.Request.IsAuthenticated;
            //Exibe se for inclusao
            InsertButton.Visible = !this.Request.IsAuthenticated;
            //Exibe se for alteracao
            FotoUsuario.Visible = this.Request.IsAuthenticated && //Se autenticado
                this.Session[viewStateNomeArquivo] != null && //se tiver o nome no viewstate
                (!String.IsNullOrEmpty(Convert.ToString(this.Session[viewStateNomeArquivo])));
            FotoUsuario.ImageUrl = String.Format("/foto/{0}", Convert.ToString(this.Session[viewStateNomeArquivo]));
            RequiredFieldtxtSenha.Visible = !this.Request.IsAuthenticated;
            RequiredFieldtxtSenha.Enabled = RequiredFieldtxtSenha.Visible;
            RequiredFieldtxtSenha.ValidationGroup = "NaoValidar";
            //CompareValidatortxtConfirmarSenha.Visible = RequiredFieldtxtSenha.Visible;
            //CompareValidatortxtConfirmarSenha.Enabled = RequiredFieldtxtSenha.Visible;
            //CompareValidatortxtConfirmarSenha.ValidationGroup = "NaoValidar";
            stSenha.Visible = RequiredFieldtxtSenha.Visible;
            stConfirmaSenha.Visible = RequiredFieldtxtSenha.Visible;
        }

        private void PreencheCamposEmTela()
        {
            using (Conexao.AfasfaManager.usuariosTableAdapter = new usuariosTableAdapter())
            {
                DataSetAfasfa.usuariosDataTable _usuario = Conexao.AfasfaManager.usuariosTableAdapter.BuscaPorID((Session[Constantes.UsuarioLogado] as Usuario).IdUsuario);
                DataSetAfasfa.infocontatoDataTable _infoContato = null;
                int _idContato = int.MinValue;
                //Verifica se tem valor na coluna de IDContato
                if (_usuario.Rows[0]["IDCONTATO"] != DBNull.Value)
                {
                    _idContato = Convert.ToInt32(_usuario.Rows[0]["IDCONTATO"]);
                }
                if (_idContato != int.MinValue)//Se carregou id busca as info de contato
                {
                    using (Conexao.AfasfaManager.infocontatoTableAdapter = new infocontatoTableAdapter())
                    {
                        _infoContato = Conexao.AfasfaManager.infocontatoTableAdapter.BuscaPorID(_idContato);
                    }
                }
                PreencheCamposEmTela(_usuario, _infoContato);
            }
        }

        private string viewStateLogin = "viewStateLogin";
        private string viewStateIdUsuario = "viewStateIdUsuario";
        private string viewStateIdContato = "viewStateIdContato";
        private string viewStateNomeArquivo = "viewStateNomeArquivo";

        private void PreencheValoresParaUpdate(int idUsuario, int idContato, string nomeArquivo)
        {
            this.Session[viewStateLogin] = LoginTextBox.Text;
            this.Session[viewStateIdUsuario] = idUsuario;
            this.Session[viewStateIdContato] = idContato;
            this.Session[viewStateNomeArquivo] = nomeArquivo;
        }

        private void PreencheCamposEmTela(DataSetAfasfa.usuariosDataTable _usuario, DataSetAfasfa.infocontatoDataTable _infoContato)
        {
            if (_usuario.Rows[0]["Login"] != DBNull.Value)
            {
                LoginTextBox.Text = Convert.ToString(_usuario.Rows[0]["Login"]);
            }
            if (_infoContato.Rows[0]["Nome"] != DBNull.Value)
            {
                NomeTextBox.Text = Convert.ToString(_infoContato.Rows[0]["Nome"]);
            }
            if (_infoContato.Rows[0]["Apelido"] != DBNull.Value)
            {
                ApelidoTextBox.Text = Convert.ToString(_infoContato.Rows[0]["Apelido"]);
            }
            if (_usuario.Rows[0]["administrador"] != DBNull.Value)
            {
                AdministradorCheckBox.Checked = Convert.ToString(_usuario.Rows[0]["administrador"]) == Constantes.FlagSim;
            }
            if (_infoContato.Rows[0]["TelefoneRes"] != DBNull.Value)
            {
                TelefoneResTextBox.Text = Convert.ToString(_infoContato.Rows[0]["TelefoneRes"]);
            }
            if (_infoContato.Rows[0]["TelefoneCel"] != DBNull.Value)
            {
                TelefoneCelTextBox.Text = Convert.ToString(_infoContato.Rows[0]["TelefoneCel"]);
            }
            if (_infoContato.Rows[0]["EMail"] != DBNull.Value)
            {
                EMailTextBox.Text = Convert.ToString(_infoContato.Rows[0]["EMail"]);
            }
            if (_infoContato.Rows[0]["Sexo"] != DBNull.Value)
            {
                ddlSexo.SelectedValue = Convert.ToString(_infoContato.Rows[0]["Sexo"]);
            }
            if (_infoContato.Rows[0]["RECEBERINFORMACOES"] != DBNull.Value)
            {
                ReceberInformacoesCheckBox.Checked = Convert.ToString(_infoContato.Rows[0]["RECEBERINFORMACOES"]) == Constantes.FlagSim;
            }
            string nomeArquivo = String.Empty;
            if (_infoContato.Rows[0]["FOTO"] != DBNull.Value)
            {
                nomeArquivo = Convert.ToString(_infoContato.Rows[0]["FOTO"]);
            }

            PreencheValoresParaUpdate(Convert.ToInt32(_usuario.Rows[0]["usuario"]), Convert.ToInt32(_usuario.Rows[0]["idcontato"]),
                nomeArquivo);
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

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            AtualizarUsuario();
            AjustaControles();
        }

        private void AtualizarUsuario()
        {
            using (Conexao.AfasfaManager.usuariosTableAdapter = new usuariosTableAdapter())
            {
                Conexao.AfasfaManager.usuariosTableAdapter.Update(this.LoginTextBox.Text,
                                                                  RetornaSenhaAtualizada(),
                                                                  this.AdministradorCheckBox.Checked ? "S" : "N",
                                                                  Convert.ToInt32(Session[viewStateIdContato]),
                                                                  Convert.ToInt32(Session[viewStateIdUsuario]),
                                                                  Convert.ToString(Session[viewStateLogin])
                                                                  );
            }
            using (Conexao.AfasfaManager.infocontatoTableAdapter = new infocontatoTableAdapter())
            {
                string _nomeArquivo = RetornaNomeArquivo();
                CarregaArquivo(_nomeArquivo);
                Conexao.AfasfaManager.infocontatoTableAdapter.Update(
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
                            this.ApelidoTextBox.Text,
                            Convert.ToUInt32(Session[viewStateIdContato]));
                this.Session[viewStateNomeArquivo] = _nomeArquivo;
            }
            AtualizaSessionUsuario();

            (this.Master as afasfa).AdicionaMensagemSucesso("Dados de usuário atualizados com sucesso.");
        }

        private void AtualizaSessionUsuario()
        {
            (Session[Constantes.UsuarioLogado] as Usuario).Login = this.LoginTextBox.Text;
            (Session[Constantes.UsuarioLogado] as Usuario).NomeUsuario = this.NomeTextBox.Text;
            (Session[Constantes.UsuarioLogado] as Usuario).Sexo = this.ddlSexo.SelectedValue;
            (Session[Constantes.UsuarioLogado] as Usuario).Apelido = this.ApelidoTextBox.Text;
            (this.Master as afasfa).AtualizaSaudacao((Session[Constantes.UsuarioLogado] as Usuario));

        }

        private string RetornaSenhaAtualizada()
        {
            if (String.IsNullOrEmpty(this.txtSenha.Text))
            {
                DataSetAfasfa.usuariosDataTable _usuario = Conexao.AfasfaManager.usuariosTableAdapter.BuscaPorID(Convert.ToInt32(Session[viewStateIdUsuario]));
                return Convert.ToString(_usuario.Rows[0]["Senha"]);
            }
            else
            {
                return AFASFA.Servico.Seguranca.Seguranca.RetornaSenha(this.txtSenha.Text);
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
                this.ModalPopupExtender2.Show();
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
                //if (result >= 1)
                {
                    result = Convert.ToInt32(Conexao.AfasfaManager.infocontatoTableAdapter.RetornaUltimoID());
                }
            }
            return result;
        }

        private string RetornaNomeArquivo()
        {
            if (this.fuFoto.HasFile)
            {
                return String.Concat(System.IO.Path.GetRandomFileName(), System.IO.Path.GetExtension(this.fuFoto.FileName));
            }
            else
            {
                return this.Session[viewStateNomeArquivo] == null ? null : Convert.ToString(this.Session[viewStateNomeArquivo]);
            }
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

        private void AtualizaDados(DataSetAfasfa.usuariosDataTable _usuario)
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
                if ((Session[Constantes.UsuarioLogado] as Usuario) != null)
                {
                    args.IsValid = Convert.ToInt32(Conexao.AfasfaManager.usuariosTableAdapter.RetornaLoginRepetidoComID(this.LoginTextBox.Text, (Session[Constantes.UsuarioLogado] as Usuario).IdUsuario)) == 0;
                }
                else
                {
                    args.IsValid = Convert.ToInt32(Conexao.AfasfaManager.usuariosTableAdapter.RetornaLoginRepetido(this.LoginTextBox.Text)) == 0;
                }
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
            Response.Redirect(Request.Url.PathAndQuery);
        }

        private void LimparCampos()
        {
            LoginTextBox.Text = string.Empty;

            NomeTextBox.Text = string.Empty;

            ApelidoTextBox.Text = string.Empty;

            AdministradorCheckBox.Checked = false;

            TelefoneResTextBox.Text = string.Empty;

            TelefoneCelTextBox.Text = string.Empty;

            EMailTextBox.Text = string.Empty;

            ddlSexo.ClearSelection();

            ReceberInformacoesCheckBox.Checked = true;


        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.ModalPopupExtender1.Hide();
        }

        protected void ReceberInformacoesCheckBox_OnCheckedChanged(object sender, EventArgs e)
        {
            (this.FindControl("lblReceberInformaoes") as Label).Visible = !(this.FindControl("ReceberInformacoesCheckBox") as CheckBox).Checked;
        }

    }
}
