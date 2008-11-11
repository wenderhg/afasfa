using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace acesso_dados
{
    public class Filtro
    {
        private string nomeCampo = string.Empty;
        public string NomeCampo
        {
            get
            {
                return nomeCampo;
            }
            set
            {
                nomeCampo = value;
            }
        }

        private TipoFiltro tipoFiltro = TipoFiltro.Igual;
        public TipoFiltro TipoFiltro
        {
            get
            {
                return tipoFiltro;
            }
            set
            {
                tipoFiltro = value;
            }
        }

        private string valorFiltro = string.Empty;
        public string ValorFiltro
        {
            get
            {
                return valorFiltro;
            }
            set
            {
                valorFiltro = value;
            }
        }

        public string RetornaFiltro()
        {
            return string.Format("{0} {1} '{2}'", this.nomeCampo, this.RetornaTipoFiltroFormatado(), this.valorFiltro);
        }

        public bool OperadorAND { get; set; }

        private string RetornaTipoFiltroFormatado()
        {
            switch (TipoFiltro)
            {
                case TipoFiltro.Maior:
                    return ">";
                case TipoFiltro.MaiorOuIgual:
                    return ">=";
                case TipoFiltro.Menor:
                    return "<";
                case TipoFiltro.MenorOuIgual:
                    return "<=";
                case TipoFiltro.Diferente:
                    return "<>";
                case TipoFiltro.ComecandoCom:
                    this.valorFiltro = "%" + this.valorFiltro;
                    return "like";
                case TipoFiltro.Contenha:
                    this.valorFiltro = "%" + this.valorFiltro + "%";
                    return "like";
                case TipoFiltro.TerminandoCom:
                    this.valorFiltro = this.valorFiltro + "%";
                    return "like";
                case TipoFiltro.Igual:
                default:
                    return "=";
            }
        }
    }
}
