using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using System.Data;

namespace AFASFA.acesso_dados.Seguranca
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
        /// <returns>string</returns>
        public Usuario RetornaUsuarioSenha(string usuario, string senha)
        {
            Usuario _result = null;
            //Cria objeto que faz Select no banco
            using (MySqlCommand _command = new MySqlCommand("Select nome, login, sexo, apelido from usuarios where login = @usuario and senha = @senha", Conexao.Instance))
            {
                //Define os parametros
                _command.Parameters.Add("usuario", MySqlDbType.VarChar, 20);
                _command.Parameters["usuario"].Value = usuario;
                _command.Parameters.Add("senha", MySqlDbType.VarChar, 100);
                _command.Parameters["senha"].Value = senha;
                //Abre a conexao
                _command.Connection.Open();
                //Executa o select e cria objeto que só vai para frente apontando para uma linha do retorno
                using (IDataReader reader = _command.ExecuteReader())
                {
                    if (reader.Read())//Avança uma linha no retorno do select
                    {
                        _result = new Usuario(); //Cria usuario
                        //Se o campo nao for nulo preenche a propriedade do objeto usuario
                        if (reader["Apelido"] != DBNull.Value)
                        {
                            _result.Apelido = Convert.ToString(reader["Apelido"]);
                        }
                        if (reader["sexo"] != DBNull.Value)
                        {
                            _result.Sexo = Convert.ToString(reader["sexo"]);
                        }
                        if (reader["login"] != DBNull.Value)
                        {
                            _result.Login = Convert.ToString(reader["login"]);
                        }
                        if (reader["nome"] != DBNull.Value)
                        {
                            _result.NomeUsuario = Convert.ToString(reader["nome"]);
                        }
                    }
                }
                _command.Connection.Close(); //Fecha conexao
            }

            return _result;//Retorna usuario
        }


        public Usuario RetornaSolicitaSenha(string login, string email)
        {
            Usuario _result = null;
            //Cria objeto que faz Select no banco
            using (MySqlCommand _command = new MySqlCommand("Select senha from usuarios where login = @login or email = @email", Conexao.Instance))
            {
                //Define os parametros
                _command.Parameters.Add("login", MySqlDbType.VarChar, 20);
                _command.Parameters["login"].Value = login;
                _command.Parameters.Add("email", MySqlDbType.VarChar, 100);
                _command.Parameters["email"].Value = email;
                //Abre a conexao
                _command.Connection.Open();
                //Executa o select e cria objeto que só vai para frente apontando para uma linha do retorno
                using (IDataReader reader = _command.ExecuteReader())
                {
                    if (reader.Read())//Avança uma linha no retorno do select
                    {
                        _result = new Usuario(); //Cria usuario
                        //Se o campo nao for nulo preenche a propriedade do objeto usuario
                        if (reader["Senha"] != DBNull.Value)
                        {
                            _result.Senha = Convert.ToString(reader["Senha"]);
                        }
                    }
                }
                _command.Connection.Close(); //Fecha conexao
            }

            return _result;//Retorna usuario
        }
    }
}
