using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AFASFA.acesso_dados.Seguranca
{
    /// <summary>
    /// Classe de usuario
    /// </summary>
    public class Usuario
    {
        public string Login { get; set; }
        public string NomeUsuario { get; set; }
        public string Sexo { get; set; }
        public string Apelido { get; set; }
        public string Senha { get; set; }
        public Int64 IdUsuario { get; set; }
        
    }
}
