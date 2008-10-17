using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AFASFA.Cadastros
{
    public partial class cadastro_voluntarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AFASFA.AfasfaWebService.UFService _ufService = new AFASFA.AfasfaWebService.UFService();
                this.EstadoOrigemDropDownList.DataSource = _ufService.RetornaUF();
                this.EstadoOrigemDropDownList.DataBind();
                this.UfDropDownList.DataSource = this.EstadoOrigemDropDownList.DataSource;
                this.UfDropDownList.DataBind();
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

        }

        protected void btnCEP_Click(object sender, EventArgs e)
        {
            //Instancia WebService
            br.com.bronzebusiness.www.wscep _cep = new AFASFA.br.com.bronzebusiness.www.wscep();
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

            //Retorno do WebService
            //<xs:element name="logradouro" type="xs:string" minOccurs="0"/>
            //<xs:element name="nome" type="xs:string" minOccurs="0"/>
            //<xs:element name="bairro" type="xs:string" minOccurs="0"/>
            //<xs:element name="UF" type="xs:string" minOccurs="0"/>
            //<xs:element name="cidade" type="xs:string" minOccurs="0"/>
        }

    }
}
