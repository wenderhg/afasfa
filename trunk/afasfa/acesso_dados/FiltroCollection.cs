using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace acesso_dados
{
    public class FiltroCollection: List<Filtro>
    {
        public string RetornaFiltroFormatado()
        {
            StringBuilder _result = new StringBuilder();
            if (this.Count == 0)
            {
                return string.Empty;
            }
            _result.AppendLine(this[0].RetornaFiltro());
            for (int cont = 1; cont < this.Count; cont++)
            {
                _result.AppendLine(this[cont].OperadorAND ? " AND " : " OR " + this[cont].RetornaFiltro());
            }
            return _result.ToString();
        }
    }
}
