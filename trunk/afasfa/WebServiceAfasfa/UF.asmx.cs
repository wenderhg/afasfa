using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using acesso_dados.Cadastro;

namespace WebServiceAfasfa
{
    /// <summary>
    /// Summary description for Service1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class UFService : System.Web.Services.WebService
    {
        /// <summary>
        /// Retorna a lista de UFs do Brasil
        /// </summary>
        /// <returns>List de UF</returns>
        [WebMethod]
        public List<UF> RetornaUF()
        {
            List<UF> result = new List<UF>();

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

            return result;
        }
    }
}
