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
        public static DataSetAFASFA.vwvoluntariosDataTable RetornaResultado(string command)
        {
            DataSetAFASFA.vwvoluntariosDataTable _result = null;
            if (!String.IsNullOrEmpty(command))
            {
                command = "where " + command;
            }
            using (MySqlCommand _command = new MySqlCommand("select * from vwVoluntarios " + command, Conexao.Instance))
            {
                Conexao.Instance.Open();
                using (MySqlDataReader _reader = _command.ExecuteReader(System.Data.CommandBehavior.CloseConnection))
                {
                    while (_reader.Read())
                    {
                        if (_result == null)
                        {
                            _result = new DataSetAFASFA.vwvoluntariosDataTable();
                        }
                        DataSetAFASFA.vwvoluntariosRow _row = _result.NewvwvoluntariosRow();
                        if (_reader["APELIDO"] != DBNull.Value)
                            _row.Apelido = Convert.ToString(_reader["APELIDO"]);
                        if (_reader["DataEnvio"] != DBNull.Value)
                            _row.DataEnvio = Convert.ToDateTime(_reader["DataEnvio"]);
                        if (_reader["VOLUNTARIO"] != DBNull.Value)
                            _row.Voluntario = Convert.ToUInt32(_reader["VOLUNTARIO"]);
                        if (_reader["NACIONALIDADE"] != DBNull.Value)
                            _row.Nacionalidade = Convert.ToString(_reader["NACIONALIDADE"]);
                        if (_reader["DATANASCIMENTO"] != DBNull.Value)
                            _row.DataNascimento = Convert.ToDateTime(_reader["DATANASCIMENTO"]);
                        if (_reader["ESTADOORIGEM"] != DBNull.Value)
                            _row.EstadoOrigem = Convert.ToInt32(_reader["ESTADOORIGEM"]);
                        if (_reader["CIDADEORIGEM"] != DBNull.Value)
                            _row.CidadeOrigem = Convert.ToString(_reader["CIDADEORIGEM"]);
                        if (_reader["HABILITADO"] != DBNull.Value)
                            _row.Habilitado = Convert.ToBoolean(_reader["HABILITADO"]);
                        if (_reader["ESTADOCIVIL"] != DBNull.Value)
                            _row.EstadoCivil = Convert.ToString(_reader["ESTADOCIVIL"]);
                        if (_reader["TRABALHA"] != DBNull.Value)
                            _row.Trabalha = Convert.ToBoolean(_reader["TRABALHA"]);
                        if (_reader["ESCOLARIDADE"] != DBNull.Value)
                            _row.Escolaridade = Convert.ToString(_reader["ESCOLARIDADE"]);
                        if (_reader["PROFISSAO"] != DBNull.Value)
                            _row.Profissao = Convert.ToString(_reader["PROFISSAO"]);
                        if (_reader["LOCALDETRABALHO"] != DBNull.Value)
                            _row.LocaldeTrabalho = Convert.ToString(_reader["LOCALDETRABALHO"]);
                        if (_reader["COMOFICOUSABENDO"] != DBNull.Value)
                            _row.ComoFicouSabendo = Convert.ToString(_reader["COMOFICOUSABENDO"]);
                        if (_reader["TIPOVOLUNTARIO"] != DBNull.Value)
                            _row.TipoVoluntario = Convert.ToString(_reader["TIPOVOLUNTARIO"]);
                        if (_reader["QUALATIVIDADE"] != DBNull.Value)
                            _row.QualAtividade = Convert.ToString(_reader["QUALATIVIDADE"]);
                        if (_reader["QUADISPONIBILIDADE"] != DBNull.Value)
                            _row.QualDisponibilidade = Convert.ToUInt32(_reader["QUADISPONIBILIDADE"]);
                        if (_reader["QUAISDIAS"] != DBNull.Value)
                            _row.QuaisDias = Convert.ToString(_reader["QUAISDIAS"]);
                        if (_reader["ACEITATERMO"] != DBNull.Value)
                            _row.AceitaTermo = Convert.ToBoolean(_reader["ACEITATERMO"]);
                        if (_reader["TEMPODOVOLUNTARIO"] != DBNull.Value)
                            _row.TempodoVoluntario = Convert.ToString(_reader["TEMPODOVOLUNTARIO"]);
                        if (_reader["ESTADO"] != DBNull.Value)
                            _row.Estado = Convert.ToString(_reader["ESTADO"]);
                        if (_reader["IDCONTATO"] != DBNull.Value)
                            _row.IDContato = Convert.ToInt32(_reader["IDCONTATO"]);
                        if (_reader["PAISORIGEM"] != DBNull.Value)
                            _row.PaisOrigem = Convert.ToString(_reader["PAISORIGEM"]);
                        if (_reader["sigla"] != DBNull.Value)
                            _row.Sigla = Convert.ToString(_reader["sigla"]);
                        if (_reader["NomeEstado"] != DBNull.Value)
                            _row.NomeEstado = Convert.ToString(_reader["NomeEstado"]);
                        if (_reader["NomeCidade"] != DBNull.Value)
                            _row.NomeCidade = Convert.ToString(_reader["NomeCidade"]);
                        if (_reader["NomeContato"] != DBNull.Value)
                            _row.NomeContato = Convert.ToString(_reader["NomeContato"]);
                        if (_reader["CEP"] != DBNull.Value)
                            _row.CEP = Convert.ToString(_reader["CEP"]);
                        if (_reader["LOGRADOURO"] != DBNull.Value)
                            _row.Logradouro = Convert.ToString(_reader["LOGRADOURO"]);
                        if (_reader["NUMERO"] != DBNull.Value)
                            _row.Numero = Convert.ToUInt32(_reader["NUMERO"]);
                        if (_reader["COMPLEMENTO"] != DBNull.Value)
                            _row.Complemento = Convert.ToString(_reader["COMPLEMENTO"]);
                        if (_reader["BAIRRO"] != DBNull.Value)
                            _row.Bairro = Convert.ToString(_reader["BAIRRO"]);
                        if (_reader["CIDADE"] != DBNull.Value)
                            _row.Cidade = Convert.ToString(_reader["CIDADE"]);
                        if (_reader["UF"] != DBNull.Value)
                            _row.UF = Convert.ToString(_reader["UF"]);
                        if (_reader["TELEFONECEL"] != DBNull.Value)
                            _row.TelefoneCel = Convert.ToDecimal(_reader["TELEFONECEL"]);
                        if (_reader["TELEFONERES"] != DBNull.Value)
                            _row.TelefoneRes = Convert.ToDecimal(_reader["TELEFONERES"]);
                        if (_reader["EMAIL"] != DBNull.Value)
                            _row.EMail = Convert.ToString(_reader["EMAIL"]);
                        if (_reader["SEXO"] != DBNull.Value)
                            _row.Sexo = Convert.ToString(_reader["SEXO"]);
                        if (_reader["ApelidoContato"] != DBNull.Value)
                            _row.ApelidoContato = Convert.ToString(_reader["ApelidoContato"]);


                        _result.AddvwvoluntariosRow(_row);

                    }
                }
            }
            return _result;
        }
    }
}
