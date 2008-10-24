using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace acesso_dados.WebServices
{
    public class Mes
    {
        public int NumeroDoMes { get; set; }
        public string NomeDoMes { get; set; }

        public Mes()
        {

        }

        public Mes(int Numero, string Nome)
        {
            this.NumeroDoMes = Numero;
            this.NomeDoMes = Nome;
        }
    }
}
