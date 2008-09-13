using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using acesso_dados.Properties;

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
    }
}
