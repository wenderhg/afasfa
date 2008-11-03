using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AFASFA.acesso_dados;
using acesso_dados;
using acesso_dados.DataSetAFASFATableAdapters;
using Microsoft.Reporting.WebForms;

namespace AFASFA.Relatorios
{
    public partial class FrmReportViewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btGerar_Click(object sender, EventArgs e)
        {
            ReportViewer1.Visible = true;
            ReportViewer1.Reset();
            switch ((Relatorio)ddlRelatorios.SelectedIndex)
            {
                case Relatorio.Doacoes : 
                    CarregaDoacoes(ddlRelatorios.SelectedValue);
                    break;
                case Relatorio.Voluntarios:
                    CarregaVoluntario(ddlRelatorios.SelectedValue);
                    break;
                default:
                    break;
            }

            ReportViewer1.LocalReport.Refresh();
        }

        private void CarregaVoluntario(string report)
        {
            using (Conexao.AfasfaManager.voluntariosTableAdapter = new voluntariosTableAdapter())
            {

                DataSetAFASFA.voluntariosDataTable voluntario = new DataSetAFASFA.voluntariosDataTable();
                Conexao.AfasfaManager.voluntariosTableAdapter.Fill(voluntario);
                ReportDataSource datasource = new ReportDataSource("DataSetAFASFA_voluntarios", voluntario);

                ReportViewer1.LocalReport.ReportPath = report;
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(datasource);

            }
        }

        private void CarregaDoacoes(string report)
        {
            using (Conexao.AfasfaManager.doacoesTableAdapter = new doacoesTableAdapter())
            {

                DataSetAFASFA.doacoesDataTable doacoes = new DataSetAFASFA.doacoesDataTable();
                Conexao.AfasfaManager.doacoesTableAdapter.PreenchePorDataItens(doacoes, Convert.ToDateTime(txtDataDoacaoIni.Text), Convert.ToDateTime(txtDataDoacaoFim.Text), this.txtItens.Text);
                ReportDataSource datasource = new ReportDataSource("DataSetAFASFA_doacoes", doacoes);

                ReportViewer1.LocalReport.ReportPath = report;
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(datasource);

            }
        }

        protected void ddlRelatorios_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Adicionar paineis para esconder
            EscondePaineis();

            switch (ddlRelatorios.SelectedIndex)
            {
                case 1: this.pnDoacoes.Visible = true;
                    break;
                default:
                    break;
            }
        }

        private void EscondePaineis()
        {
            this.pnDoacoes.Visible = false;
        }
    }
}
