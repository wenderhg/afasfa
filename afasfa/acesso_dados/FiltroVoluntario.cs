using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using AFASFA.acesso_dados;

namespace acesso_dados
{
    public class FiltroVoluntario
    {
        public static DataSetAFASFA.voluntariosDataTable RetornaResultado(string command)
        {
            DataSetAFASFA.voluntariosDataTable _result = null;
            using (MySqlCommand _command = new MySqlCommand(command, Conexao.Instance))
            {
                using (MySqlDataReader _reader = _command.ExecuteReader())
                {
                    while (_reader.Read())
                    {
                        if (_result == null)
                        {
                            _result = new DataSetAFASFA.voluntariosDataTable();
                        }
                        DataSetAFASFA.voluntariosRow _row = _result.NewvoluntariosRow();
                        _row.APELIDO = Convert.ToString(_reader["APELIDO"]);
                        _row.VOLUNTARIO = Convert.ToUInt32(_reader["VOLUNTARIO"]);
                        _result.AddvoluntariosRow(_row);
                        //_result.APELIDOColumn. = 

                          //  `, ``, `NACIONALIDADE`, `DATANASCIMENTO`, `ESTADOORIGEM`, `CIDADEORIGEM`, `HABILITADO`, `ESTADOCIVIL`, `TRABALHA`, `ESCOLARIDADE`, `PROFISSAO`, `LOCALDETRABALHO`, `COMOFICOUSABENDO`, `TIPOVOLUNTARIO`, `QUALATIVIDADE`, `QUADISPONIBILIDADE`, `QUAISDIAS`, `ACEITATERMO`, `TEMPODOVOLUNTARIO`, `ESTADO`, `IDCONTATO`, `PAISORIGEM
                    }
                }
            }
            return _result;
        }
    }
}
