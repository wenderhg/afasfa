using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using acesso_dados.WebServices;
using AFASFA.acesso_dados.WebServices;
using AFASFA.acesso_dados.DataSetAfasfaTableAdapters;

namespace AFASFA.acesso_dados
{
    /// <summary>
    /// Classe que prove conexao
    /// </summary>
    public class Conexao
    {
        private static MySqlConnection _instance = null;
        /// <summary>
        /// Retorna a instancia de conexao com o banco, mantendo apenas uma instancia dessa conexao
        /// </summary>
        public static MySqlConnection Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["afasfaConnectionString"].ConnectionString);
                }
                return _instance;
            }
        }

        private static TableAdapterManager _afasfaManager = null;
        /// <summary>
        /// Retornar instancia de TableAdapterManager (representa o modelo do banco)
        /// </summary>
        public static TableAdapterManager AfasfaManager
        {
            get
            {
                if (_afasfaManager == null)
                {
                    _afasfaManager = new TableAdapterManager();
                    _afasfaManager.Connection = Instance;
                }
                return _afasfaManager;
            }
        }

        private static wsAfasfa _afasfaWebService = null;
        public static wsAfasfa afasfaWebService
        {
            get
            {
                if (_afasfaWebService == null)
                {
                    _afasfaWebService = new wsAfasfa();
                }
                return _afasfaWebService;
            }
        }
    }
}
