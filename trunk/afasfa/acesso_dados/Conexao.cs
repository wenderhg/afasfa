using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using acesso_dados.Properties;
using acesso_dados.DataSetAFASFATableAdapters;

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
                    _instance = new MySqlConnection(Settings.Default.afasfaConnectionString);
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
    }
}
