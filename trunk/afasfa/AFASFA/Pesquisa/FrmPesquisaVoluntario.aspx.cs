using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using acesso_dados;
using AFASFA.acesso_dados;
using Servico.Util;
using System.Data;
using AFASFA.acesso_dados.DataSetAfasfaTableAdapters;

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
                using (DataSetAfasfa.vwvoluntariosDataTable _table = new DataSetAfasfa.vwvoluntariosDataTable())
                {
                    foreach (DataColumn _column in _table.Columns)
                    {
                        if ((RetornaCampoExcluidos().IndexOf(_column.ColumnName)) != -1)
                        {
                            continue;
                        }
                        ddlCampos.Items.Add(new ListItem(_column.ColumnName, String.Format("{0}{1}", _column.Ordinal, _column.DataType)));
                    }
                }
                this.Filtros.Clear();
            }
            (this.Page.Master as afasfa).Resumo.EnableClientScript = true;
        }

        private string RetornaCampoExcluidos()
        {
            return "IDContato, EstadoOrigem, CidadeOrigem, PaisOrigem, Habilitado, EstadoCivil, Trabalha, AceitaTermo, " +
                   "QuaisDias, AceitaTermo, TempodoVoluntario, Escolaridade, Sigla, NomeContato";
        }

        protected void ckFiltroPersonalizado_CheckedChanged(object sender, EventArgs e)
        {
            this.phFiltroPersonalizado.Visible = this.ckFiltroPersonalizado.Checked;
            if (!this.ckFiltroPersonalizado.Checked)
            {
                this.Filtros.Clear();
                this.phGrid.Visible = false;
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
            this.LimpaCampos();
            this.AtualizaGrid();
        }

        private void LimpaCampos()
        {
            this.ddlCampos.ClearSelection();
            this.ddlTipoFiltro.ClearSelection();
            this.txtValor.Text = string.Empty;
            this.ddlOperador.ClearSelection();
        }

        private void AtualizaGrid()
        {
            this.phGrid.Visible = (this.Filtros.Count != 0);
            this.gdFiltros.Visible = (this.Filtros.Count != 0);
            if (this.Filtros.Count == 0)
                this.gdFiltros.DataSource = null;
            else
                this.gdFiltros.DataSource = this.Filtros;
            this.gdFiltros.DataBind();
        }

        protected void ddlCampos_SelectedIndexChanged(object sender, EventArgs e)
        {
            AjustarControle();
        }

        private void AjustarControle()
        {
            //Ver o tipo do campo e habilitar o placeholder que precisar
            this.phControlesData.Visible = ddlCampos.SelectedValue.Contains("DateTime"); //Se for tipo data
            this.phControlesNumero.Visible = ddlCampos.SelectedValue.Contains("Decimal"); //Se for tipo numerico
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
        private string ssFiltros = "ssFiltros";
        public FiltroCollection Filtros
        {
            get
            {
                if (_filtros == null)
                {
                    _filtros = (Session[ssFiltros] as FiltroCollection);
                }
                if (_filtros == null)
                {
                    _filtros = new FiltroCollection();
                    Session[ssFiltros] = _filtros;
                }
                return _filtros;
            }
        }

        protected void gdFiltros_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Filtros.RemoveAt(e.RowIndex); //Remove o indice
            AtualizaGrid(); //Atualiza grid
        }

        protected void gdFiltros_DataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow) //Ajusta o texto do operador
            {
                Filtro _filtro = e.Row.DataItem as Filtro;
                e.Row.Cells[3].Text = _filtro.OperadorAND ? "E" : "OU";
            }
        }

        protected void gdFiltros_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Carrega o filtro para edicao
            Filtro _filtro = Filtros[e.NewEditIndex];
            this.ddlCampos.ClearSelection();
            this.ddlCampos.Items.FindByText(_filtro.NomeCampo).Selected = true;
            this.ddlTipoFiltro.ClearSelection();
            this.ddlTipoFiltro.SelectedValue = _filtro.TipoFiltro.ToString();
            this.txtValor.Text = _filtro.ValorFiltro;
            this.ddlOperador.ClearSelection();
            this.ddlOperador.SelectedIndex = _filtro.OperadorAND ? 0 : 1;
            ExibeAlterar(true);
            this.btnAtualizarFiltro.CommandArgument = e.NewEditIndex.ToString();
            AjustarControle();
        }

        private void ExibeAlterar(bool exibir)
        {
            this.btnAdicionarFiltro.Visible = !exibir;
            this.btnAtualizarFiltro.Visible = exibir;
        }

        protected void btnAtualizarFiltro_Command(object sender, CommandEventArgs e)
        {
            Filtros[Convert.ToInt32(e.CommandArgument)] = RetornaFiltroAtual();
            this.LimpaCampos();
            ExibeAlterar(false);
            AtualizaGrid(); //Atualiza grid
        }

        protected void btnPesquisar_Click(object sender, EventArgs e)
        {
            gvResultado.DataSource = FiltroVoluntario.RetornaResultado(RetornaFiltro());
            gvResultado.DataBind();
            this.phResultado.Visible = true;
        }

        private string RetornaFiltro()
        {
            string _result = string.Empty;

            if (!String.IsNullOrEmpty(txtNome.Text))
            {
                _result = String.Format(" NomeContato like '%{0}%' ", txtNome.Text);
            }

            if (ddlStatus.SelectedIndex != 0) //se nao for todos
            {
                _result += (String.IsNullOrEmpty(_result) ? string.Empty : " AND ") + String.Format("estado = '{0}'", ddlStatus.SelectedValue);
            }

            return _result + ((Filtros.Count > 0) && !(String.IsNullOrEmpty(_result)) ? " AND " : string.Empty) + Filtros.RetornaFiltroFormatado();
        }

        protected void gvResultado_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataSetAfasfa.vwvoluntariosRow _row = (e.Row.DataItem as DataRowView).Row as DataSetAfasfa.vwvoluntariosRow;
                //Trata status
                if (e.Row.Cells[5].Text.Equals("P"))
                {
                    e.Row.Cells[5].Text = "Pendente de aprovação";
                    Button _btn = (e.Row.FindControl("btnAprovar") as Button);
                    _btn.CommandArgument = _row.Voluntario.ToString();
                    _btn.Visible = true;
                    _btn = (e.Row.FindControl("btnRejeitar") as Button);
                    _btn.CommandArgument = _row.Voluntario.ToString();
                    _btn.Visible = true;
                }
                else if (e.Row.Cells[5].Text.Equals("A"))
                {
                    e.Row.Cells[5].Text = "Aprovado";
                    Button _btn = (e.Row.FindControl("btnInativar") as Button);
                    _btn.CommandArgument = _row.Voluntario.ToString();
                    _btn.Visible = true;
                }
                else if (e.Row.Cells[5].Text.Equals("R"))
                {
                    e.Row.Cells[5].Text = "Rejeitado";
                    Button _btn = (e.Row.FindControl("btnReativar") as Button);
                    _btn.CommandArgument = _row.Voluntario.ToString();
                    _btn.Visible = true;
                }
                else if (e.Row.Cells[5].Text.Equals("I"))
                {
                    e.Row.Cells[5].Text = "Inativo";
                    Button _btn = (e.Row.FindControl("btnReativar") as Button);
                    _btn.CommandArgument = _row.Voluntario.ToString();
                    _btn.Visible = true;
                }

                //Trata direto ou indireto
                if (e.Row.Cells[6].Text.Equals("D"))
                {
                    e.Row.Cells[6].Text = "Direto";
                }
                else if (e.Row.Cells[6].Text.Equals("I"))
                {
                    e.Row.Cells[6].Text = "Indireto";
                }

                //ajusta os links
                HyperLink _hl = e.Row.FindControl("hlEditar") as HyperLink;
                _hl.NavigateUrl = String.Format(_hl.NavigateUrl, _row.Voluntario);
            }
        }

        protected void gvResultado_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Aprovar"))
            {
                using (Conexao.AfasfaManager.voluntariosTableAdapter = new voluntariosTableAdapter())
                {
                    Conexao.AfasfaManager.voluntariosTableAdapter.AtualizaEstado("A", Convert.ToInt32(e.CommandArgument));
                }
            }
            else if (e.CommandName.Equals("Rejeitar"))
            {
                using (Conexao.AfasfaManager.voluntariosTableAdapter = new voluntariosTableAdapter())
                {
                    Conexao.AfasfaManager.voluntariosTableAdapter.AtualizaEstado("R", Convert.ToInt32(e.CommandArgument));
                }
            }
            else if (e.CommandName.Equals("Inativar"))
            {
                using (Conexao.AfasfaManager.voluntariosTableAdapter = new voluntariosTableAdapter())
                {
                    Conexao.AfasfaManager.voluntariosTableAdapter.AtualizaEstado("I", Convert.ToInt32(e.CommandArgument));
                }
            }
            else if (e.CommandName.Equals("Reativar"))
            {
                using (Conexao.AfasfaManager.voluntariosTableAdapter = new voluntariosTableAdapter())
                {
                    Conexao.AfasfaManager.voluntariosTableAdapter.AtualizaEstado("A", Convert.ToInt32(e.CommandArgument));
                }
            }
            btnPesquisar_Click(null, null);
        }

    }
}
