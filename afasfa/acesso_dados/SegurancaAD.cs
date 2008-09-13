using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;

namespace AFASFA.acesso_dados
{
    /// <summary>
    /// Classe de Acesso a dados referente a seguranca
    /// </summary>
    public class SegurancaAD
    {
        private static SegurancaAD _instance = null;
        /// <summary>
        /// Retorna a instancia da classe SegurancaAD (É a implementação do dessign pattern Singleton)
        /// </summary>
        public static SegurancaAD Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new SegurancaAD();
                }
                return _instance;
            }
        }

        /// <summary>
        /// Retorna quantidade de registros encontrados para o usuario e senha em questao
        /// </summary>
        /// <param name="usuario">Usuario</param>
        /// <param name="senha">Senha</param>
        /// <returns>int</returns>
        public int RetornaUsuarioSenha(string usuario, string senha)
        {
            int _result;
            using (MySqlCommand _command = new MySqlCommand("Select count(1) from usuarios where login = @usuario and senha = @senha", Conexao.Instance))
            {

                _command.Parameters.Add("usuario", MySqlDbType.VarChar, 20);
                _command.Parameters["usuario"].Value = usuario;
                _command.Parameters.Add("senha", MySqlDbType.VarChar, 100);
                _command.Parameters["senha"].Value = senha;
                _command.Connection.Open();
                _result = Convert.ToInt16(_command.ExecuteScalar());
                _command.Connection.Close();
            }

            return _result;
        }

    }
}
