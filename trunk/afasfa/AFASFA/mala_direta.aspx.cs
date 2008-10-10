using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using AFASFA.Servico.Seguranca;
using AFASFA.acesso_dados.Seguranca;
using Servico.Util;

namespace AFASFA
{
    public partial class mala_direta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Usuario _usuario = Seguranca.RetornaUsuarioValido(Server.HtmlEncode(txtUsuario.Text), Server.HtmlEncode(txtSenha.Text));
        }

        protected void btnCriarPesquisa_Clik(object sender, EventArgs e)
        //public Usuario RetornaPesquisaMalaDireta(string usuario, string senha)
        {
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
        }
        //public Usuario RetornaSolicitaSenha(string login, string email)
        //{
        //    Usuario _result = null;
        //    //Cria objeto que faz Select no banco
        //    using (MySqlCommand _command = new MySqlCommand("Select senha from usuarios where login = @login or email = @email", Conexao.Instance))
        //    {
        //        //Define os parametros
        //        _command.Parameters.Add("login", MySqlDbType.VarChar, 20);
        //        _command.Parameters["login"].Value = login;
        //        _command.Parameters.Add("email", MySqlDbType.VarChar, 100);
        //        _command.Parameters["email"].Value = email;
        //        //Abre a conexao
        //        _command.Connection.Open();
        //        //Executa o select e cria objeto que só vai para frente apontando para uma linha do retorno
        //        using (IDataReader reader = _command.ExecuteReader())
        //        {
        //            if (reader.Read())//Avança uma linha no retorno do select
        //            {
        //                _result = new Usuario(); //Cria usuario
        //                //Se o campo nao for nulo preenche a propriedade do objeto usuario
        //                if (reader["Senha"] != DBNull.Value)
        //                {
        //                    _result.Senha = Convert.ToString(reader["Senha"]);
        //                }
        //            }
        //        }
        //        _command.Connection.Close(); //Fecha conexao
        //    }

        //    return _result;//Retorna usuario
        //}
    }
}
