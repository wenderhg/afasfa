using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AFASFA.acesso_dados;
using acesso_dados.DataSetAFASFATableAdapters;
using AFASFA.afasfaWebService;
using Servico.Util;

namespace AFASFA.Cadastros
{
    public partial class cadastro_voluntarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (wsAfasfa _ws = new wsAfasfa())
                {
                    this.EstadoOrigemDropDownList.DataSource = _ws.RetornaEstados();
                    this.EstadoOrigemDropDownList.DataBind();
                    this.UfDropDownList.DataSource = this.EstadoOrigemDropDownList.DataSource;
                    this.UfDropDownList.DataBind();
                }
            }
        }
        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            this.ModalPopupExtender1.Show();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            this.ModalPopupExtender1.Hide();
            //this.FormView1.ChangeMode(FormViewMode.ReadOnly);
            //this.FormView1.ChangeMode(FormViewMode.Insert);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.ModalPopupExtender1.Hide();
        }

        protected void Inserir_Click(object sender, EventArgs e)
        {
            if (rblNacionalidade.SelectedIndex == 0)
            {
                Page.Validate("Brasileira");
            }
            else
            {
                Page.Validate("Estrangeiro");
            }
            if (Page.IsValid)
            {
                using (Conexao.AfasfaManager.voluntariosTableAdapter = new voluntariosTableAdapter())
                {
                    Conexao.AfasfaManager.voluntariosTableAdapter.Insert(
                        this.ApelidoTextBox.Text, 
                        this.rblNacionalidade.SelectedIndex == 0 ? "B" : "E",
                        Convert.ToDateTime(this.DataNascimentoTextBox.Text),
                        this.rblNacionalidade.SelectedIndex == 0 ? Convert.ToInt32(this.EstadoOrigemDropDownList.SelectedValue) : 28 /*Codigo de UF Estrangeiro*/,
                        this.rblNacionalidade.SelectedIndex == 0 ? this.ddlCidadeOrigem.SelectedValue : this.CidadeOrigemTextBox.Text,
                        Convert.ToByte(this.HabilitadoCheckBox.Checked),
                        this.EstadoCivilDropDownList.SelectedValue,
                        Convert.ToByte(this.TrabalhoCheckBox.Checked),
                        this.EscolaridadeDropDown.SelectedValue,
                        this.ProfissaoTextBox.Text,
                        this.Local_de_TrabalhoTextBox.Text,
                        this.ComoFicouSabendoTextBox.Text,
                        this.rbVoluntarioDireto.Checked ? "D" : "I",
                        this.QualAtividadeTextBox.Text,
                        this.RetornaDisponibilidade(),
                        this.RetornaQualDia(),
                        Convert.ToByte(this.AceitaTermoCheckBox.Checked),
                        this.TempoDoVoluntarioTextBox.Text,
                        "P", //Cadastro de voluntário pendente
                        this.RetornaIdContato(),
                        this.rblNacionalidade.SelectedIndex == 1 ? this.PaisOrigemTextBox.Text : null
                        );
                }
                this.EnviarEmails();
            }
        }

        private void EnviarEmails()
        {
            //Envia email para a instituicao
            this.EnviarEmailInstituicao();
            //Envia email para o voluntário
            this.EnviarEmailVoluntário();
        }

        private void EnviarEmailVoluntário()
        {
            if (!String.IsNullOrEmpty(this.EmailTextBox.Text))
            {
                MailSender.EnviarEMailHTML(this.EmailTextBox.Text,
                    "Agradecimento de Associação Filantrópica e Assistencial São Francisco de Assis",
                    String.Format("{0},<br /><br />&nbsp;A Associação Filantrópica e Assistencial São Francisco de Assis agradece seu interesse em se tornar um voluntário.<br />Aguarde que entraremos em contato.<br />Atenciosamente,<br />A Direção.", this.NomeTextBox.Text));
            }
        }

        private void EnviarEmailInstituicao()
        {
            MailSender.EnviarEMailHTML("afasaofranciscodeassis@afasaofranciscodeassis.com.br",
                "Interesse em ser voluntário",
                String.Format("{0} inseriu cadastro de interesse em ser voluntário.", this.NomeTextBox.Text));
        }

        private int? RetornaIdContato()
        {
            int? result = null;
            using (Conexao.AfasfaManager.infocontatoTableAdapter = new infocontatoTableAdapter())
            {
                result = Conexao.AfasfaManager.infocontatoTableAdapter.Insert(
                            this.NomeTextBox.Text,
                            null,
                            Convert.ToByte(true),
                            this.CepTextBox.Text,
                            this.LogradouroTextbox.Text,
                            Convert.ToUInt32(this.NumeroTextbox.Text),
                            this.ComplementoTextbox.Text,
                            this.BairroTextBox.Text,
                            this.CidadeTextBox.Text,
                            this.UfDropDownList.SelectedValue,
                            RetornaTelefone(this.TelefoneCelTextBox.Text),
                            RetornaTelefone(this.TelefoneResTextBox.Text),
                            this.EmailTextBox.Text,
                            this.ddlSexo.SelectedValue,
                            this.ApelidoTextBox.Text);
                //Se inseriu alguma coisa então busca o ID
                if (result >= 1)
                {
                    result = Convert.ToInt32(Conexao.AfasfaManager.infocontatoTableAdapter.RetornaUltimoID());
                }
            }
            return result;
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

        private string RetornaQualDia()
        {
            System.Text.StringBuilder result = new System.Text.StringBuilder();
            if (ckDomingo.Checked)
            {
                result.Append(1);
            }
            else if (ckSegunda.Checked)
            {
                result.Append(2);
            }
            else if (ckTerca.Checked)
            {
                result.Append(3);
            }
            else if (ckQuarta.Checked)
            {
                result.Append(4);
            }
            else if (ckQuinta.Checked)
            {
                result.Append(5);
            }
            else if (ckSexta.Checked)
            {
                result.Append(6);
            }
            else if (ckSabado.Checked)
            {
                result.Append(7);
            }
            return result.ToString();
        }

        private int? RetornaDisponibilidade()
        {
            int? result = null;
            if (ckduasHoras.Checked)
            {
                result = 2;
            }
            else if (ckquatroHoras.Checked)
            {
                result = 4;
            }
            else if (ckseisHoras.Checked)
            {
                result = 6;
            }
            else if (ckoitoHoras.Checked)
            {
                result = 8;
            }
            return result;
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            this.ModalPopupExtender1.Show();
        }

        protected void btnCEP_Click(object sender, EventArgs e)
        {
            //Instancia WebService
            using (br.com.bronzebusiness.www.wscep _cep = new AFASFA.br.com.bronzebusiness.www.wscep())
            {
                //Chama Metodo que retorna o endereco
                System.Data.DataSet _dsCEP = _cep.cep(this.CepTextBox.Text);
                if ((_dsCEP == null) && (_dsCEP.Tables.Count > 0) && (_dsCEP.Tables[0].Rows.Count > 0))
                {

                    //(this.Page.Master as afasfa).Resumo.
                    //"CEP não encontrado.";
                    return;
                }
                this.LogradouroTextbox.Text = String.Format("{0} {1}", _dsCEP.Tables[0].Rows[0]["logradouro"].ToString(),
                    _dsCEP.Tables[0].Rows[0]["nome"].ToString());
                this.BairroTextBox.Text = _dsCEP.Tables[0].Rows[0]["bairro"].ToString();
                this.UfDropDownList.SelectedValue = _dsCEP.Tables[0].Rows[0]["UF"].ToString();
                this.CidadeTextBox.Text = _dsCEP.Tables[0].Rows[0]["cidade"].ToString();
            }
            //Retorno do WebService
            //<xs:element name="logradouro" type="xs:string" minOccurs="0"/>
            //<xs:element name="nome" type="xs:string" minOccurs="0"/>
            //<xs:element name="bairro" type="xs:string" minOccurs="0"/>
            //<xs:element name="UF" type="xs:string" minOccurs="0"/>
            //<xs:element name="cidade" type="xs:string" minOccurs="0"/>
        }

        protected void EstadoOrigemDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (wsAfasfa _ws = new wsAfasfa())
            {
                short _estado;
                //Tenta fazer o parser do codigo do estado selecionado
                if (!short.TryParse(this.EstadoOrigemDropDownList.SelectedValue, out _estado))
                {
                    return;
                }
                this.ddlCidadeOrigem.Items.Clear();
                this.ddlCidadeOrigem.Items.Add(new ListItem());
                this.ddlCidadeOrigem.DataSource = _ws.RetornaCidadesPorEstado(_estado);
                this.ddlCidadeOrigem.DataBind();
            }
        }

        protected void CustomValidatorContato_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //Se algum não for empty, retorna true
            args.IsValid = (!String.IsNullOrEmpty(this.TelefoneCelTextBox.Text) || !String.IsNullOrEmpty(this.TelefoneResTextBox.Text) ||
                !String.IsNullOrEmpty(this.EmailTextBox.Text));
        }

        protected void CustomValidatorEstado_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //Se algum não for empty, retorna true
            args.IsValid = (!String.IsNullOrEmpty(this.UfDropDownList.SelectedValue));
        }

        protected void rblNacionalidade_SelectedIndexChanged(object source, EventArgs e)
        {
            //Selecionado a nacionalidade Brasileira
            this.tr_EstadosBrasileiros.Visible = (rblNacionalidade.SelectedIndex == 0);
            this.tr_CidadeBrasileira.Visible = (rblNacionalidade.SelectedIndex == 0);
            this.tr_PaisEstrangeiro.Visible = (rblNacionalidade.SelectedIndex == 1);
            this.tr_CidadeEstrangeira.Visible = (rblNacionalidade.SelectedIndex == 1);
        }

    }
}