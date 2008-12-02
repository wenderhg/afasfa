using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace acesso_dados.WebServices
{
    /// <summary>
    /// Classe de UF
    /// </summary>
    public class UF
    {
        /// <summary>
        /// Construtor com parametros
        /// </summary>
        /// <param name="uf"></param>
        /// <param name="nome"></param>
        public UF(string codigo, string nome)
        {
            this.Codigo = codigo;
            this.Nome = nome;
        }

        /// <summary>
        /// Construtor padrao
        /// </summary>
        public UF()
        {

        }
        /// <summary>
        /// Codigo da UF
        /// </summary>
        public string Codigo { get; set; }

        /// <summary>
        /// Nome do estado
        /// </summary>
        public string Nome { get; set; }
    }
}
