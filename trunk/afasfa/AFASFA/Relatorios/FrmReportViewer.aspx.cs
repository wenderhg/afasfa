using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using acesso_dados;
using acesso_dados.DataSetAFASFATableAdapters;
using AFASFA.acesso_dados;
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
                case Relatorio.relatorio_Doacoes:
                    CarregaRelatorioDoacoes(ddlRelatorios.SelectedValue);
                    break;
                case Relatorio.listagem_Voluntarios:
                    CarregaListagemVoluntario(ddlRelatorios.SelectedValue);
                    break;
                case Relatorio.listagem_assistencias:
                    CarregaListagemAssistencia(ddlRelatorios.SelectedValue);
                    break;
                case Relatorio.listagem_projetos:
                    CarregaListagemProjetos(ddlRelatorios.SelectedValue);
                    break;
                case Relatorio.listagem_eventos:
                    CarregaListagemEventos(ddlRelatorios.SelectedValue);
                    break;
                default:
                    break;
            }

            ReportViewer1.LocalReport.Refresh();
        }

        private void CarregaListagemVoluntario(string report)
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

        private void CarregaListagemProjetos(string report)
        {
            using (Conexao.AfasfaManager.projetosTableAdapter = new projetosTableAdapter())
            {
                DataSetAFASFA.projetosDataTable projetos = new DataSetAFASFA.projetosDataTable();
                Conexao.AfasfaManager.projetosTableAdapter.Fill(projetos);
                ReportDataSource datasource = new ReportDataSource("DataSetAFASFA_projetos", projetos);

                ReportViewer1.LocalReport.ReportPath = report;
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(datasource);
            }
        }

        private void CarregaListagemEventos(string report)
        {
            using (Conexao.AfasfaManager.eventosTableAdapter = new eventosTableAdapter())
            {
                DataSetAFASFA.eventosDataTable eventos = new DataSetAFASFA.eventosDataTable();
                Conexao.AfasfaManager.eventosTableAdapter.Fill(eventos);
                ReportDataSource datasource = new ReportDataSource("DataSetAFASFA_eventos", eventos);

                ReportViewer1.LocalReport.ReportPath = report;
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(datasource);
            }
        }

        private void CarregaRelatorioDoacoes(string report)
        {
            DateTime _DataDoacaoIni;
            DateTime _DataDoacaoFim;


            if (string.IsNullOrEmpty(this.txtDataDoacaoIni.Text))
            {

                _DataDoacaoIni = DateTime.MinValue;

            }
            else
            {
                _DataDoacaoIni = Convert.ToDateTime(this.txtDataDoacaoIni.Text);
            }

            if (string.IsNullOrEmpty(this.txtDataDoacaoFim.Text))
            {
                _DataDoacaoFim = DateTime.MaxValue;
            }
            else
            {
                _DataDoacaoFim = Convert.ToDateTime(this.txtDataDoacaoFim.Text);
            }
            using (Conexao.AfasfaManager.doacoesTableAdapter = new doacoesTableAdapter())
            {
                DataSetAFASFA.doacoesDataTable DoacoesPorData = new DataSetAFASFA.doacoesDataTable();
                Conexao.AfasfaManager.doacoesTableAdapter.Preenche(DoacoesPorData, _DataDoacaoIni, _DataDoacaoFim);
                ReportDataSource datasource = new ReportDataSource("DataSetAFASFA_doacoes", DoacoesPorData);

                ReportViewer1.LocalReport.ReportPath = report;
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(datasource);
            }
        }

        private void CarregaListagemAssistencia(string report)
        {
            using (Conexao.AfasfaManager.assistenciasTableAdapter = new assistenciasTableAdapter())
            {
                DataSetAFASFA.assistenciasDataTable assistencias = new DataSetAFASFA.assistenciasDataTable();
                Conexao.AfasfaManager.assistenciasTableAdapter.Fill(assistencias);
                ReportDataSource datasource = new ReportDataSource("DataSetAFASFA_assistencias", assistencias);

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
                default: break;
            }
        }

        private void EscondePaineis()
        {
            this.pnDoacoes.Visible = false;
            this.ReportViewer1.Visible = false;
        }
    }
}
