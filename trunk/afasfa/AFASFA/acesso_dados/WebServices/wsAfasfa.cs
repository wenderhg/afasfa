using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AFASFA.acesso_dados;
using acesso_dados.WebServices;

namespace AFASFA.acesso_dados.WebServices
{
    public class wsAfasfa
    {
        /// <summary>
        /// Retorna as cidades
        /// </summary>
        /// <returns></returns>
        public DataSetAfasfa.cidadeDataTable RetornaCidades()
        {
            DataSetAfasfa.cidadeDataTable _cidades;
            using (AFASFA.acesso_dados.DataSetAfasfaTableAdapters.cidadeTableAdapter _cidadeAdapter = new AFASFA.acesso_dados.DataSetAfasfaTableAdapters.cidadeTableAdapter())
            {
                _cidades = _cidadeAdapter.GetData();
            }
            return _cidades;
        }

        /// <summary>
        /// Retorna as cidades do estado
        /// </summary>
        /// <param name="codigoEstado"></param>
        /// <returns></returns>
        public acesso_dados.DataSetAfasfa.cidadeDataTable RetornaCidadesPorEstado(short codigoEstado)
        {
            acesso_dados.DataSetAfasfa.cidadeDataTable _cidades;
            using (acesso_dados.DataSetAfasfaTableAdapters.cidadeTableAdapter _cidadeAdapter = new acesso_dados.DataSetAfasfaTableAdapters.cidadeTableAdapter())
            {
                _cidades = _cidadeAdapter.RetornaCidadesPorEstado(codigoEstado);
            }
            return _cidades;
        }

        /// <summary>
        /// Retorna os estados
        /// </summary>
        /// <returns></returns>
        public acesso_dados.DataSetAfasfa.estadoDataTable RetornaEstados()
        {
            acesso_dados.DataSetAfasfa.estadoDataTable _estados;
            using (acesso_dados.DataSetAfasfaTableAdapters.estadoTableAdapter _estadoAdapter = new acesso_dados.DataSetAfasfaTableAdapters.estadoTableAdapter())
            {
                _estados = _estadoAdapter.GetData();
            }
            return _estados;
        }



        /// <summary>
        /// Retorna a lista de UFs do Brasil
        /// </summary>
        /// <returns>List de UF</returns>
        public List<UF> RetornaUF()
        {
            List<UF> result = new List<UF>();

            result.Add(new UF());//Item em branco para o bind
            result.Add(new UF("AC", "Acre"));
            result.Add(new UF("AL", "Alagoas"));
            result.Add(new UF("AP", "Amapá"));
            result.Add(new UF("AM", "Amazonas"));
            result.Add(new UF("BA", "Bahia"));
            result.Add(new UF("CE", "Ceará"));
            result.Add(new UF("DF", "Distrito Federal"));
            result.Add(new UF("ES", "Espirito Santo"));
            result.Add(new UF("GO", "Goiás"));
            result.Add(new UF("MA", "Maranhão"));
            result.Add(new UF("MT", "Mato Grosso"));
            result.Add(new UF("MS", "Mato Grosso do Sul"));
            result.Add(new UF("MG", "Minas Gerais"));
            result.Add(new UF("PA", "Pará"));
            result.Add(new UF("PB", "Paraiba"));
            result.Add(new UF("PR", "Paraná"));
            result.Add(new UF("PE", "Pernambuco"));
            result.Add(new UF("PI", "Piauí"));
            result.Add(new UF("RJ", "Rio de Janeiro"));
            result.Add(new UF("RN", "Rio Grande do Norte"));
            result.Add(new UF("RS", "Rio Grande do Sul"));
            result.Add(new UF("RO", "Rondônia"));
            result.Add(new UF("RR", "Roraima"));
            result.Add(new UF("SC", "Santa Catarina"));
            result.Add(new UF("SP", "São Paulo"));
            result.Add(new UF("SE", "Sergipe"));
            result.Add(new UF("TO", "Tocantins"));
            result.Add(new UF("EX", "Estrangeiro"));

            return result;
        }

        public List<Mes> RetornaMeses()
        {
            List<Mes> _result = new List<Mes>();
            _result.Add(new Mes());
            _result.Add(new Mes(1, "Janeiro"));
            _result.Add(new Mes(2, "Fevereiro"));
            _result.Add(new Mes(3, "Março"));
            _result.Add(new Mes(4, "Abril"));
            _result.Add(new Mes(5, "Maio"));
            _result.Add(new Mes(6, "Junho"));
            _result.Add(new Mes(7, "Julho"));
            _result.Add(new Mes(8, "Agosto"));
            _result.Add(new Mes(9, "Setembro"));
            _result.Add(new Mes(10, "Outubro"));
            _result.Add(new Mes(11, "Novembro"));
            _result.Add(new Mes(12, "Dezembro"));
            return _result;
        }

    }
}
