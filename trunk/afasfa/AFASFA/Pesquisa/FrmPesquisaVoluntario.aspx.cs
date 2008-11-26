using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using acesso_dados;
using AFASFA.acesso_dados;

namespace AFASFA.Pesquisa
{
    public partial class FrmPesquisaVoluntario : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Master as afasfa).VerificaAcessoNegado(true))
            {
                return;
            }
            if (!IsPostBack)
            {

                using (DataSetAFASFA.voluntariosDataTable _table = new DataSetAFASFA.voluntariosDataTable())
                {
                    this.ddlCampos.DataSource = _table.Columns;
                    this.ddlCampos.DataBind();
                }

            }
        }

        protected void ckFiltroPersonalizado_CheckedChanged(object sender, EventArgs e)
        {
            this.phFiltroPersonalizado.Visible = this.ckFiltroPersonalizado.Checked;
            if (!this.ckFiltroPersonalizado.Checked)
            {
                this.Filtros.Clear();
            }
            else
            {
                this.ddlCampos.Focus();
            }
        }

        protected void btnAdicionarFiltro_Click(object sender, EventArgs e)
        {
            this.Filtros.Add(RetornaFiltroAtual());
            this.gdFiltros.DataSource = this.Filtros;
            this.gdFiltros.DataBind();
        }

        protected void ddlCampos_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Ver o tipo do campo e habilitar o placeholder que precisar
            int index = ddlCampos.SelectedIndex;
            this.phControlesData.Visible = false;
            this.phControlesNumero.Visible = false;
            using (DataSetAFASFA.voluntariosDataTable _table = new DataSetAFASFA.voluntariosDataTable())
            {
                if (_table.Columns[index].DataType.Equals(typeof(DateTime))) //Se for tipo data
                {
                    this.phControlesData.Visible = true;
                }
                else if ((_table.Columns[index].DataType.Equals(typeof(UInt32))) ||
                         (_table.Columns[index].DataType.Equals(typeof(Decimal)))) //Se for tipo numerico
                {
                    this.phControlesNumero.Visible = true;
                }
            }

        }

        private Filtro RetornaFiltroAtual()
        {
            Filtro _filtro = new Filtro();
            _filtro.NomeCampo = this.ddlCampos.SelectedItem.Text;
            _filtro.TipoFiltro = ((TipoFiltro)Enum.Parse(typeof(TipoFiltro), this.ddlTipoFiltro.SelectedValue));
            _filtro.ValorFiltro = this.txtValor.Text;
            _filtro.OperadorAND = (this.ddlOperador.SelectedIndex == 0);//Se for AND selecionado
            return _filtro;
        }

        private FiltroCollection _filtros = null;
        public FiltroCollection Filtros
        {
            get
            {
                if (_filtros == null)
                {
                    _filtros = new FiltroCollection();
                }
                return _filtros;
            }
        }
    }
}
