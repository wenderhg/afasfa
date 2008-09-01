// 
//  ____  _     __  __      _        _ 
// |  _ \| |__ |  \/  | ___| |_ __ _| |
// | | | | '_ \| |\/| |/ _ \ __/ _` | |
// | |_| | |_) | |  | |  __/ || (_| | |
// |____/|_.__/|_|  |_|\___|\__\__,_|_|
//
// Auto-generated from afasfadb on 31/8/2008 20:32:11.
// Please visit http://linq.to/db for more information.
//
namespace br.org.afasfadb
{
    using System;
    using System.ComponentModel;
    using System.Data;
    using System.Data.Linq.Mapping;
    using System.Diagnostics;
    using DbLinq.Linq;
    using DbLinq.Linq.Mapping;
    
    
    public partial class afasfadb : DbLinq.Linq.DataContext
    {
        
	partial void OnCreated();
        
        public afasfadb(IDbConnection connection) : 
                base(connection)
        {
            this.OnCreated();
        }
        
        public Table<Assistencias> Assistencias
        {
            get
            {
                return this.GetTable<Assistencias>();
            }
        }
        
        public Table<DadosQuantitativos> DadosQuantitativos
        {
            get
            {
                return this.GetTable<DadosQuantitativos>();
            }
        }
        
        public Table<Doacoes> Doacoes
        {
            get
            {
                return this.GetTable<Doacoes>();
            }
        }
        
        public Table<Eventos> Eventos
        {
            get
            {
                return this.GetTable<Eventos>();
            }
        }
        
        public Table<Projetos> Projetos
        {
            get
            {
                return this.GetTable<Projetos>();
            }
        }
        
        public Table<Usuarios> Usuarios
        {
            get
            {
                return this.GetTable<Usuarios>();
            }
        }
        
        public Table<Voluntarios> Voluntarios
        {
            get
            {
                return this.GetTable<Voluntarios>();
            }
        }
    }
    
    [Table(Name="afasfa.assistencias")]
    public partial class Assistencias : System.ComponentModel.INotifyPropertyChanged
    {
        
        [AutoGenId()]
        private uint _Assistencia;
        
        private string _Descricao;
        
        private string _Responsavel;
        
	partial void OnCreated();
	partial void OnAssistenciaChanging(System.UInt32 instance);
	partial void OnAssistenciaChanged();
	partial void OnDescricaoChanging(System.String instance);
	partial void OnDescricaoChanged();
	partial void OnResponsavelChanging(System.String instance);
	partial void OnResponsavelChanged();
        
        public Assistencias()
        {
            this.OnCreated();
        }
        
        [Column(Storage="assistEnCia", Name="ASSISTENCIA", DbType="int unsigned", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public uint Assistencia
        {
            get
            {
                return this._Assistencia;
            }
            set
            {
                if (_Assistencia != value)
                {
                    this.OnAssistenciaChanging(value);
                    this._Assistencia = value;
                    this.SendPropertyChanged("Assistencia");
                    this.OnAssistenciaChanged();
                }
            }
        }
        
        [Column(Storage="desCrIcaO", Name="DESCRICAO", DbType="varchar(60)", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public string Descricao
        {
            get
            {
                return this._Descricao;
            }
            set
            {
                if (_Descricao != value)
                {
                    this.OnDescricaoChanging(value);
                    this._Descricao = value;
                    this.SendPropertyChanged("Descricao");
                    this.OnDescricaoChanged();
                }
            }
        }
        
        [Column(Storage="reSpOnSaveL", Name="RESPONSAVEL", DbType="varchar(30)", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public string Responsavel
        {
            get
            {
                return this._Responsavel;
            }
            set
            {
                if (_Responsavel != value)
                {
                    this.OnResponsavelChanging(value);
                    this._Responsavel = value;
                    this.SendPropertyChanged("Responsavel");
                    this.OnResponsavelChanged();
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected virtual void SendPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
            {
                this.PropertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [Table(Name="afasfa.dados_quantitativos")]
    public partial class DadosQuantitativos : System.ComponentModel.INotifyPropertyChanged
    {
        
        private uint _Assistencias;
        
        private string _Descricao;
        
        private string _MesAno;
        
        private uint _QtdeAdolescenteFeminino;
        
        private uint _QtdeAdolescenteMasculino;
        
        private uint _QtdeAdultosFeminino;
        
        private uint _QtdeAdultosMasculino;
        
        private uint _QtdeCriancasFeminino;
        
        private uint _QtdeCriancasMasculino;
        
        private uint _QtdeFamilias;
        
        private string _Responsavel;
        
	partial void OnCreated();
	partial void OnAssistenciasChanging(System.UInt32 instance);
	partial void OnAssistenciasChanged();
	partial void OnDescricaoChanging(System.String instance);
	partial void OnDescricaoChanged();
	partial void OnMesAnoChanging(System.String instance);
	partial void OnMesAnoChanged();
	partial void OnQtdeAdolescenteFemininoChanging(System.UInt32 instance);
	partial void OnQtdeAdolescenteFemininoChanged();
	partial void OnQtdeAdolescenteMasculinoChanging(System.UInt32 instance);
	partial void OnQtdeAdolescenteMasculinoChanged();
	partial void OnQtdeAdultosFemininoChanging(System.UInt32 instance);
	partial void OnQtdeAdultosFemininoChanged();
	partial void OnQtdeAdultosMasculinoChanging(System.UInt32 instance);
	partial void OnQtdeAdultosMasculinoChanged();
	partial void OnQtdeCriancasFemininoChanging(System.UInt32 instance);
	partial void OnQtdeCriancasFemininoChanged();
	partial void OnQtdeCriancasMasculinoChanging(System.UInt32 instance);
	partial void OnQtdeCriancasMasculinoChanged();
	partial void OnQtdeFamiliasChanging(System.UInt32 instance);
	partial void OnQtdeFamiliasChanged();
	partial void OnResponsavelChanging(System.String instance);
	partial void OnResponsavelChanged();
        
        public DadosQuantitativos()
        {
            this.OnCreated();
        }
        
        [Column(Storage="assistEnCia", Name="ASSISTENCIA", DbType="int unsigned", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public uint Assistencias
        {
            get
            {
                return this._Assistencias;
            }
            set
            {
                if (_Assistencias != value)
                {
                    this.OnAssistenciasChanging(value);
                    this._Assistencias = value;
                    this.SendPropertyChanged("Assistencias");
                    this.OnAssistenciasChanged();
                }
            }
        }
        
        [Column(Storage="desCrIcaO", Name="DESCRICAO", DbType="varchar(40)", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public string Descricao
        {
            get
            {
                return this._Descricao;
            }
            set
            {
                if (_Descricao != value)
                {
                    this.OnDescricaoChanging(value);
                    this._Descricao = value;
                    this.SendPropertyChanged("Descricao");
                    this.OnDescricaoChanged();
                }
            }
        }
        
        [Column(Storage="meSanO", Name="MESANO", DbType="varchar(6)", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public string MesAno
        {
            get
            {
                return this._MesAno;
            }
            set
            {
                if (_MesAno != value)
                {
                    this.OnMesAnoChanging(value);
                    this._MesAno = value;
                    this.SendPropertyChanged("MesAno");
                    this.OnMesAnoChanged();
                }
            }
        }
        
        [Column(Storage="qtDEaDolescentEsF", Name="QTDEADOLESCENTESF", DbType="int unsigned", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public uint QtdeAdolescenteFeminino
        {
            get
            {
                return this._QtdeAdolescenteFeminino;
            }
            set
            {
                if (_QtdeAdolescenteFeminino != value)
                {
                    this.OnQtdeAdolescenteFemininoChanging(value);
                    this._QtdeAdolescenteFeminino = value;
                    this.SendPropertyChanged("QtdeAdolescenteFeminino");
                    this.OnQtdeAdolescenteFemininoChanged();
                }
            }
        }
        
        [Column(Storage="qtDEaDolescentEsM", Name="QTDEADOLESCENTESM", DbType="int unsigned", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public uint QtdeAdolescenteMasculino
        {
            get
            {
                return this._QtdeAdolescenteMasculino;
            }
            set
            {
                if (_QtdeAdolescenteMasculino != value)
                {
                    this.OnQtdeAdolescenteMasculinoChanging(value);
                    this._QtdeAdolescenteMasculino = value;
                    this.SendPropertyChanged("QtdeAdolescenteMasculino");
                    this.OnQtdeAdolescenteMasculinoChanged();
                }
            }
        }
        
        [Column(Storage="qtDEaDultOsF", Name="QTDEADULTOSF", DbType="int unsigned", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public uint QtdeAdultosFeminino
        {
            get
            {
                return this._QtdeAdultosFeminino;
            }
            set
            {
                if (_QtdeAdultosFeminino != value)
                {
                    this.OnQtdeAdultosFemininoChanging(value);
                    this._QtdeAdultosFeminino = value;
                    this.SendPropertyChanged("QtdeAdultosFeminino");
                    this.OnQtdeAdultosFemininoChanged();
                }
            }
        }
        
        [Column(Storage="qtDEaDultOsM", Name="QTDEADULTOSM", DbType="int unsigned", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public uint QtdeAdultosMasculino
        {
            get
            {
                return this._QtdeAdultosMasculino;
            }
            set
            {
                if (_QtdeAdultosMasculino != value)
                {
                    this.OnQtdeAdultosMasculinoChanging(value);
                    this._QtdeAdultosMasculino = value;
                    this.SendPropertyChanged("QtdeAdultosMasculino");
                    this.OnQtdeAdultosMasculinoChanged();
                }
            }
        }
        
        [Column(Storage="qtDEcRiAnCasF", Name="QTDECRIANCASF", DbType="int unsigned", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public uint QtdeCriancasFeminino
        {
            get
            {
                return this._QtdeCriancasFeminino;
            }
            set
            {
                if (_QtdeCriancasFeminino != value)
                {
                    this.OnQtdeCriancasFemininoChanging(value);
                    this._QtdeCriancasFeminino = value;
                    this.SendPropertyChanged("QtdeCriancasFeminino");
                    this.OnQtdeCriancasFemininoChanged();
                }
            }
        }
        
        [Column(Storage="qtDEcRiAnCasM", Name="QTDECRIANCASM", DbType="int unsigned", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public uint QtdeCriancasMasculino
        {
            get
            {
                return this._QtdeCriancasMasculino;
            }
            set
            {
                if (_QtdeCriancasMasculino != value)
                {
                    this.OnQtdeCriancasMasculinoChanging(value);
                    this._QtdeCriancasMasculino = value;
                    this.SendPropertyChanged("QtdeCriancasMasculino");
                    this.OnQtdeCriancasMasculinoChanged();
                }
            }
        }
        
        [Column(Storage="qtdEfAmIlIa", Name="QTDEFAMILIA", DbType="int unsigned", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public uint QtdeFamilias
        {
            get
            {
                return this._QtdeFamilias;
            }
            set
            {
                if (_QtdeFamilias != value)
                {
                    this.OnQtdeFamiliasChanging(value);
                    this._QtdeFamilias = value;
                    this.SendPropertyChanged("QtdeFamilias");
                    this.OnQtdeFamiliasChanged();
                }
            }
        }
        
        [Column(Storage="reSpOnSaveL", Name="RESPONSAVEL", DbType="varchar(60)", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public string Responsavel
        {
            get
            {
                return this._Responsavel;
            }
            set
            {
                if (_Responsavel != value)
                {
                    this.OnResponsavelChanging(value);
                    this._Responsavel = value;
                    this.SendPropertyChanged("Responsavel");
                    this.OnResponsavelChanged();
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected virtual void SendPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
            {
                this.PropertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [Table(Name="afasfa.doacoes")]
    public partial class Doacoes : System.ComponentModel.INotifyPropertyChanged
    {
        
        private System.DateTime _DataDoacao;
        
        private string _Disponibilidade;
        
        [AutoGenId()]
        private uint _Doacao;
        
        private string _Email;
        
        private string _Estado;
        
        private string _Itens;
        
        private string _Nome;
        
        private string _Observacao;
        
        private decimal _TelefoneCelular;
        
        private decimal _TelefoneResidencial;
        
	partial void OnCreated();
	partial void OnDataDoacaoChanging(System.DateTime instance);
	partial void OnDataDoacaoChanged();
	partial void OnDisponibilidadeChanging(System.String instance);
	partial void OnDisponibilidadeChanged();
	partial void OnDoacaoChanging(System.UInt32 instance);
	partial void OnDoacaoChanged();
	partial void OnEmailChanging(System.String instance);
	partial void OnEmailChanged();
	partial void OnEstadoChanging(System.String instance);
	partial void OnEstadoChanged();
	partial void OnItensChanging(System.String instance);
	partial void OnItensChanged();
	partial void OnNomeChanging(System.String instance);
	partial void OnNomeChanged();
	partial void OnObservacaoChanging(System.String instance);
	partial void OnObservacaoChanged();
	partial void OnTelefoneCelularChanging(System.Decimal instance);
	partial void OnTelefoneCelularChanged();
	partial void OnTelefoneResidencialChanging(System.Decimal instance);
	partial void OnTelefoneResidencialChanged();
        
        public Doacoes()
        {
            this.OnCreated();
        }
        
        [Column(Storage="dataDoaCaO", Name="DATADOACAO", DbType="date", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public System.DateTime DataDoacao
        {
            get
            {
                return this._DataDoacao;
            }
            set
            {
                if (_DataDoacao != value)
                {
                    this.OnDataDoacaoChanging(value);
                    this._DataDoacao = value;
                    this.SendPropertyChanged("DataDoacao");
                    this.OnDataDoacaoChanged();
                }
            }
        }
        
        [Column(Storage="diSpOnIbiLiDade", Name="DISPONIBILIDADE", DbType="text", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public string Disponibilidade
        {
            get
            {
                return this._Disponibilidade;
            }
            set
            {
                if (_Disponibilidade != value)
                {
                    this.OnDisponibilidadeChanging(value);
                    this._Disponibilidade = value;
                    this.SendPropertyChanged("Disponibilidade");
                    this.OnDisponibilidadeChanged();
                }
            }
        }
        
        [Column(Storage="doaCaO", Name="DOACAO", DbType="int unsigned", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public uint Doacao
        {
            get
            {
                return this._Doacao;
            }
            set
            {
                if (_Doacao != value)
                {
                    this.OnDoacaoChanging(value);
                    this._Doacao = value;
                    this.SendPropertyChanged("Doacao");
                    this.OnDoacaoChanged();
                }
            }
        }
        
        [Column(Storage="email", Name="EMAIL", DbType="varchar(100)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string Email
        {
            get
            {
                return this._Email;
            }
            set
            {
                if (_Email != value)
                {
                    this.OnEmailChanging(value);
                    this._Email = value;
                    this.SendPropertyChanged("Email");
                    this.OnEmailChanged();
                }
            }
        }
        
        [Column(Storage="estAdo", Name="ESTADO", DbType="char(1)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string Estado
        {
            get
            {
                return this._Estado;
            }
            set
            {
                if (_Estado != value)
                {
                    this.OnEstadoChanging(value);
                    this._Estado = value;
                    this.SendPropertyChanged("Estado");
                    this.OnEstadoChanged();
                }
            }
        }
        
        [Column(Storage="itEns", Name="ITENS", DbType="text", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public string Itens
        {
            get
            {
                return this._Itens;
            }
            set
            {
                if (_Itens != value)
                {
                    this.OnItensChanging(value);
                    this._Itens = value;
                    this.SendPropertyChanged("Itens");
                    this.OnItensChanged();
                }
            }
        }
        
        [Column(Storage="nome", Name="NOME", DbType="varchar(60)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string Nome
        {
            get
            {
                return this._Nome;
            }
            set
            {
                if (_Nome != value)
                {
                    this.OnNomeChanging(value);
                    this._Nome = value;
                    this.SendPropertyChanged("Nome");
                    this.OnNomeChanged();
                }
            }
        }
        
        [Column(Storage="obSErVAcAo", Name="OBSERVACAO", DbType="text", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string Observacao
        {
            get
            {
                return this._Observacao;
            }
            set
            {
                if (_Observacao != value)
                {
                    this.OnObservacaoChanging(value);
                    this._Observacao = value;
                    this.SendPropertyChanged("Observacao");
                    this.OnObservacaoChanged();
                }
            }
        }
        
        [Column(Storage="teLefoNeCeL", Name="TELEFONECEL", DbType="decimal", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public decimal TelefoneCelular
        {
            get
            {
                return this._TelefoneCelular;
            }
            set
            {
                if (_TelefoneCelular != value)
                {
                    this.OnTelefoneCelularChanging(value);
                    this._TelefoneCelular = value;
                    this.SendPropertyChanged("TelefoneCelular");
                    this.OnTelefoneCelularChanged();
                }
            }
        }
        
        [Column(Storage="teLefoNeReS", Name="TELEFONERES", DbType="decimal", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public decimal TelefoneResidencial
        {
            get
            {
                return this._TelefoneResidencial;
            }
            set
            {
                if (_TelefoneResidencial != value)
                {
                    this.OnTelefoneResidencialChanging(value);
                    this._TelefoneResidencial = value;
                    this.SendPropertyChanged("TelefoneResidencial");
                    this.OnTelefoneResidencialChanged();
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected virtual void SendPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
            {
                this.PropertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [Table(Name="afasfa.eventos")]
    public partial class Eventos : System.ComponentModel.INotifyPropertyChanged
    {
        
        private bool _Apresentar;
        
        private System.DateTime _DataEvento;
        
        private System.DateTime _DataMaxima;
        
        private string _Descricao;
        
        private uint _Evento;
        
        private string _FotoInicial;
        
        private byte _JaRealizado;
        
        private string _LocalEvento;
        
        private string _Observacao;
        
        private bool _ReservaDisponivel;
        
        private decimal _ValorConviteAnticipado;
        
        private decimal _ValorConvite;
        
	partial void OnCreated();
	partial void OnApresentarChanging(System.Boolean instance);
	partial void OnApresentarChanged();
	partial void OnDataEventoChanging(System.DateTime instance);
	partial void OnDataEventoChanged();
	partial void OnDataMaximaChanging(System.DateTime instance);
	partial void OnDataMaximaChanged();
	partial void OnDescricaoChanging(System.String instance);
	partial void OnDescricaoChanged();
	partial void OnEventoChanging(System.UInt32 instance);
	partial void OnEventoChanged();
	partial void OnFotoInicialChanging(System.String instance);
	partial void OnFotoInicialChanged();
	partial void OnJaRealizadoChanging(System.Byte instance);
	partial void OnJaRealizadoChanged();
	partial void OnLocalEventoChanging(System.String instance);
	partial void OnLocalEventoChanged();
	partial void OnObservacaoChanging(System.String instance);
	partial void OnObservacaoChanged();
	partial void OnReservaDisponivelChanging(System.Boolean instance);
	partial void OnReservaDisponivelChanged();
	partial void OnValorConviteAnticipadoChanging(System.Decimal instance);
	partial void OnValorConviteAnticipadoChanged();
	partial void OnValorConviteChanging(System.Decimal instance);
	partial void OnValorConviteChanged();
        
        public Eventos()
        {
            this.OnCreated();
        }
        
        [Column(Storage="apResentAr", Name="APRESENTAR", DbType="tinyint(1)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public bool Apresentar
        {
            get
            {
                return this._Apresentar;
            }
            set
            {
                if (_Apresentar != value)
                {
                    this.OnApresentarChanging(value);
                    this._Apresentar = value;
                    this.SendPropertyChanged("Apresentar");
                    this.OnApresentarChanged();
                }
            }
        }
        
        [Column(Storage="dataEventO", Name="DATAEVENTO", DbType="date", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public System.DateTime DataEvento
        {
            get
            {
                return this._DataEvento;
            }
            set
            {
                if (_DataEvento != value)
                {
                    this.OnDataEventoChanging(value);
                    this._DataEvento = value;
                    this.SendPropertyChanged("DataEvento");
                    this.OnDataEventoChanged();
                }
            }
        }
        
        [Column(Storage="dataMaxima", Name="DATAMAXIMA", DbType="date", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public System.DateTime DataMaxima
        {
            get
            {
                return this._DataMaxima;
            }
            set
            {
                if (_DataMaxima != value)
                {
                    this.OnDataMaximaChanging(value);
                    this._DataMaxima = value;
                    this.SendPropertyChanged("DataMaxima");
                    this.OnDataMaximaChanged();
                }
            }
        }
        
        [Column(Storage="desCrIcaO", Name="DESCRICAO", DbType="varchar(60)", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public string Descricao
        {
            get
            {
                return this._Descricao;
            }
            set
            {
                if (_Descricao != value)
                {
                    this.OnDescricaoChanging(value);
                    this._Descricao = value;
                    this.SendPropertyChanged("Descricao");
                    this.OnDescricaoChanged();
                }
            }
        }
        
        [Column(Storage="eventO", Name="EVENTO", DbType="int unsigned", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public uint Evento
        {
            get
            {
                return this._Evento;
            }
            set
            {
                if (_Evento != value)
                {
                    this.OnEventoChanging(value);
                    this._Evento = value;
                    this.SendPropertyChanged("Evento");
                    this.OnEventoChanged();
                }
            }
        }
        
        [Column(Storage="foTOiNIcIaL", Name="FOTOINICIAL", DbType="varchar(100)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string FotoInicial
        {
            get
            {
                return this._FotoInicial;
            }
            set
            {
                if (_FotoInicial != value)
                {
                    this.OnFotoInicialChanging(value);
                    this._FotoInicial = value;
                    this.SendPropertyChanged("FotoInicial");
                    this.OnFotoInicialChanged();
                }
            }
        }
        
        [Column(Storage="jaReaLizAdo", Name="JAREALIZADO", DbType="tinyint(1)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public byte JaRealizado
        {
            get
            {
                return this._JaRealizado;
            }
            set
            {
                if (_JaRealizado != value)
                {
                    this.OnJaRealizadoChanging(value);
                    this._JaRealizado = value;
                    this.SendPropertyChanged("JaRealizado");
                    this.OnJaRealizadoChanged();
                }
            }
        }
        
        [Column(Storage="localeVentO", Name="LOCALEVENTO", DbType="varchar(150)", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public string LocalEvento
        {
            get
            {
                return this._LocalEvento;
            }
            set
            {
                if (_LocalEvento != value)
                {
                    this.OnLocalEventoChanging(value);
                    this._LocalEvento = value;
                    this.SendPropertyChanged("LocalEvento");
                    this.OnLocalEventoChanged();
                }
            }
        }
        
        [Column(Storage="obSErVAcAo", Name="OBSERVACAO", DbType="text", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string Observacao
        {
            get
            {
                return this._Observacao;
            }
            set
            {
                if (_Observacao != value)
                {
                    this.OnObservacaoChanging(value);
                    this._Observacao = value;
                    this.SendPropertyChanged("Observacao");
                    this.OnObservacaoChanged();
                }
            }
        }
        
        [Column(Storage="reSeRvAdisPoNIvel", Name="RESERVADISPONIVEL", DbType="tinyint(1)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public bool ReservaDisponivel
        {
            get
            {
                return this._ReservaDisponivel;
            }
            set
            {
                if (_ReservaDisponivel != value)
                {
                    this.OnReservaDisponivelChanging(value);
                    this._ReservaDisponivel = value;
                    this.SendPropertyChanged("ReservaDisponivel");
                    this.OnReservaDisponivelChanged();
                }
            }
        }
        
        [Column(Storage="valorConViTea", Name="VALORCONVITEA", DbType="decimal(10,2)", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public decimal ValorConviteAnticipado
        {
            get
            {
                return this._ValorConviteAnticipado;
            }
            set
            {
                if (_ValorConviteAnticipado != value)
                {
                    this.OnValorConviteAnticipadoChanging(value);
                    this._ValorConviteAnticipado = value;
                    this.SendPropertyChanged("ValorConviteAnticipado");
                    this.OnValorConviteAnticipadoChanged();
                }
            }
        }
        
        [Column(Storage="valorConViTeC", Name="VALORCONVITEC", DbType="decimal(10,2)", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public decimal ValorConvite
        {
            get
            {
                return this._ValorConvite;
            }
            set
            {
                if (_ValorConvite != value)
                {
                    this.OnValorConviteChanging(value);
                    this._ValorConvite = value;
                    this.SendPropertyChanged("ValorConvite");
                    this.OnValorConviteChanged();
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected virtual void SendPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
            {
                this.PropertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [Table(Name="afasfa.projetos")]
    public partial class Projetos : System.ComponentModel.INotifyPropertyChanged
    {
        
        private string _DadosProjeto;
        
        private string _Descricao;
        
        private string _Foto;
        
        private int _OrdemApresentacao;
        
        [AutoGenId()]
        private uint _Projeto;
        
	partial void OnCreated();
	partial void OnDadosProjetoChanging(System.String instance);
	partial void OnDadosProjetoChanged();
	partial void OnDescricaoChanging(System.String instance);
	partial void OnDescricaoChanged();
	partial void OnFotoChanging(System.String instance);
	partial void OnFotoChanged();
	partial void OnOrdemApresentacaoChanging(System.Int32 instance);
	partial void OnOrdemApresentacaoChanged();
	partial void OnProjetoChanging(System.UInt32 instance);
	partial void OnProjetoChanged();
        
        public Projetos()
        {
            this.OnCreated();
        }
        
        [Column(Storage="dadoSdOprOjEtO", Name="DADOSDOPROJETO", DbType="text", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string DadosProjeto
        {
            get
            {
                return this._DadosProjeto;
            }
            set
            {
                if (_DadosProjeto != value)
                {
                    this.OnDadosProjetoChanging(value);
                    this._DadosProjeto = value;
                    this.SendPropertyChanged("DadosProjeto");
                    this.OnDadosProjetoChanged();
                }
            }
        }
        
        [Column(Storage="desCrIcaO", Name="DESCRICAO", DbType="varchar(50)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string Descricao
        {
            get
            {
                return this._Descricao;
            }
            set
            {
                if (_Descricao != value)
                {
                    this.OnDescricaoChanging(value);
                    this._Descricao = value;
                    this.SendPropertyChanged("Descricao");
                    this.OnDescricaoChanged();
                }
            }
        }
        
        [Column(Storage="foTO", Name="FOTO", DbType="varchar(100)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string Foto
        {
            get
            {
                return this._Foto;
            }
            set
            {
                if (_Foto != value)
                {
                    this.OnFotoChanging(value);
                    this._Foto = value;
                    this.SendPropertyChanged("Foto");
                    this.OnFotoChanged();
                }
            }
        }
        
        [Column(Storage="orDemApResentAcAo", Name="ORDEMAPRESENTACAO", DbType="int", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public int OrdemApresentacao
        {
            get
            {
                return this._OrdemApresentacao;
            }
            set
            {
                if (_OrdemApresentacao != value)
                {
                    this.OnOrdemApresentacaoChanging(value);
                    this._OrdemApresentacao = value;
                    this.SendPropertyChanged("OrdemApresentacao");
                    this.OnOrdemApresentacaoChanged();
                }
            }
        }
        
        [Column(Storage="proJetO", Name="PROJETO", DbType="int unsigned", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public uint Projeto
        {
            get
            {
                return this._Projeto;
            }
            set
            {
                if (_Projeto != value)
                {
                    this.OnProjetoChanging(value);
                    this._Projeto = value;
                    this.SendPropertyChanged("Projeto");
                    this.OnProjetoChanged();
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected virtual void SendPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
            {
                this.PropertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [Table(Name="afasfa.usuarios")]
    public partial class Usuarios : System.ComponentModel.INotifyPropertyChanged
    {
        
        private string _Bairro;
        
        private string _CEP;
        
        private string _Cidade;
        
        private string _Complemento;
        
        private string _Email;
        
        private string _Foto;
        
        private string _Login;
        
        private string _Logradouro;
        
        private string _Nome;
        
        private uint _Numero;
        
        private bool _ReceberInformacoes;
        
        private string _Senha;
        
        private decimal _TelefoneCelular;
        
        private decimal _TelefoneResidencial;
        
        private string _UF;
        
        [AutoGenId()]
        private uint _Usuario;
        
	partial void OnCreated();
	partial void OnBairroChanging(System.String instance);
	partial void OnBairroChanged();
	partial void OnCEPChanging(System.String instance);
	partial void OnCEPChanged();
	partial void OnCidadeChanging(System.String instance);
	partial void OnCidadeChanged();
	partial void OnComplementoChanging(System.String instance);
	partial void OnComplementoChanged();
	partial void OnEmailChanging(System.String instance);
	partial void OnEmailChanged();
	partial void OnFotoChanging(System.String instance);
	partial void OnFotoChanged();
	partial void OnLoginChanging(System.String instance);
	partial void OnLoginChanged();
	partial void OnLogradouroChanging(System.String instance);
	partial void OnLogradouroChanged();
	partial void OnNomeChanging(System.String instance);
	partial void OnNomeChanged();
	partial void OnNumeroChanging(System.UInt32 instance);
	partial void OnNumeroChanged();
	partial void OnReceberInformacoesChanging(System.Boolean instance);
	partial void OnReceberInformacoesChanged();
	partial void OnSenhaChanging(System.String instance);
	partial void OnSenhaChanged();
	partial void OnTelefoneCelularChanging(System.Decimal instance);
	partial void OnTelefoneCelularChanged();
	partial void OnTelefoneResidencialChanging(System.Decimal instance);
	partial void OnTelefoneResidencialChanged();
	partial void OnUFChanging(System.String instance);
	partial void OnUFChanged();
	partial void OnUsuarioChanging(System.UInt32 instance);
	partial void OnUsuarioChanged();
        
        public Usuarios()
        {
            this.OnCreated();
        }
        
        [Column(Storage="baIrRo", Name="BAIRRO", DbType="varchar(30)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string Bairro
        {
            get
            {
                return this._Bairro;
            }
            set
            {
                if (_Bairro != value)
                {
                    this.OnBairroChanging(value);
                    this._Bairro = value;
                    this.SendPropertyChanged("Bairro");
                    this.OnBairroChanged();
                }
            }
        }
        
        [Column(Storage="ceP", Name="CEP", DbType="varchar(10)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string CEP
        {
            get
            {
                return this._CEP;
            }
            set
            {
                if (_CEP != value)
                {
                    this.OnCEPChanging(value);
                    this._CEP = value;
                    this.SendPropertyChanged("CEP");
                    this.OnCEPChanged();
                }
            }
        }
        
        [Column(Storage="cidAdE", Name="CIDADE", DbType="varchar(30)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string Cidade
        {
            get
            {
                return this._Cidade;
            }
            set
            {
                if (_Cidade != value)
                {
                    this.OnCidadeChanging(value);
                    this._Cidade = value;
                    this.SendPropertyChanged("Cidade");
                    this.OnCidadeChanged();
                }
            }
        }
        
        [Column(Storage="complementO", Name="COMPLEMENTO", DbType="varchar(20)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string Complemento
        {
            get
            {
                return this._Complemento;
            }
            set
            {
                if (_Complemento != value)
                {
                    this.OnComplementoChanging(value);
                    this._Complemento = value;
                    this.SendPropertyChanged("Complemento");
                    this.OnComplementoChanged();
                }
            }
        }
        
        [Column(Storage="email", Name="EMAIL", DbType="varchar(100)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string Email
        {
            get
            {
                return this._Email;
            }
            set
            {
                if (_Email != value)
                {
                    this.OnEmailChanging(value);
                    this._Email = value;
                    this.SendPropertyChanged("Email");
                    this.OnEmailChanged();
                }
            }
        }
        
        [Column(Storage="foTO", Name="FOTO", DbType="varchar(150)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string Foto
        {
            get
            {
                return this._Foto;
            }
            set
            {
                if (_Foto != value)
                {
                    this.OnFotoChanging(value);
                    this._Foto = value;
                    this.SendPropertyChanged("Foto");
                    this.OnFotoChanged();
                }
            }
        }
        
        [Column(Storage="login", Name="LOGIN", DbType="varchar(10)", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public string Login
        {
            get
            {
                return this._Login;
            }
            set
            {
                if (_Login != value)
                {
                    this.OnLoginChanging(value);
                    this._Login = value;
                    this.SendPropertyChanged("Login");
                    this.OnLoginChanged();
                }
            }
        }
        
        [Column(Storage="logRadOurO", Name="LOGRADOURO", DbType="varchar(50)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string Logradouro
        {
            get
            {
                return this._Logradouro;
            }
            set
            {
                if (_Logradouro != value)
                {
                    this.OnLogradouroChanging(value);
                    this._Logradouro = value;
                    this.SendPropertyChanged("Logradouro");
                    this.OnLogradouroChanged();
                }
            }
        }
        
        [Column(Storage="nome", Name="NOME", DbType="varchar(60)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string Nome
        {
            get
            {
                return this._Nome;
            }
            set
            {
                if (_Nome != value)
                {
                    this.OnNomeChanging(value);
                    this._Nome = value;
                    this.SendPropertyChanged("Nome");
                    this.OnNomeChanged();
                }
            }
        }
        
        [Column(Storage="numEro", Name="NUMERO", DbType="int unsigned", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public uint Numero
        {
            get
            {
                return this._Numero;
            }
            set
            {
                if (_Numero != value)
                {
                    this.OnNumeroChanging(value);
                    this._Numero = value;
                    this.SendPropertyChanged("Numero");
                    this.OnNumeroChanged();
                }
            }
        }
        
        [Column(Storage="recEbERiNFormAcOeS", Name="RECEBERINFORMACOES", DbType="tinyint(1)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public bool ReceberInformacoes
        {
            get
            {
                return this._ReceberInformacoes;
            }
            set
            {
                if (_ReceberInformacoes != value)
                {
                    this.OnReceberInformacoesChanging(value);
                    this._ReceberInformacoes = value;
                    this.SendPropertyChanged("ReceberInformacoes");
                    this.OnReceberInformacoesChanged();
                }
            }
        }
        
        [Column(Storage="seNHa", Name="SENHA", DbType="varchar(10)", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public string Senha
        {
            get
            {
                return this._Senha;
            }
            set
            {
                if (_Senha != value)
                {
                    this.OnSenhaChanging(value);
                    this._Senha = value;
                    this.SendPropertyChanged("Senha");
                    this.OnSenhaChanged();
                }
            }
        }
        
        [Column(Storage="teLefoNeCeL", Name="TELEFONECEL", DbType="decimal", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public decimal TelefoneCelular
        {
            get
            {
                return this._TelefoneCelular;
            }
            set
            {
                if (_TelefoneCelular != value)
                {
                    this.OnTelefoneCelularChanging(value);
                    this._TelefoneCelular = value;
                    this.SendPropertyChanged("TelefoneCelular");
                    this.OnTelefoneCelularChanged();
                }
            }
        }
        
        [Column(Storage="teLefoNeReS", Name="TELEFONERES", DbType="decimal", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public decimal TelefoneResidencial
        {
            get
            {
                return this._TelefoneResidencial;
            }
            set
            {
                if (_TelefoneResidencial != value)
                {
                    this.OnTelefoneResidencialChanging(value);
                    this._TelefoneResidencial = value;
                    this.SendPropertyChanged("TelefoneResidencial");
                    this.OnTelefoneResidencialChanged();
                }
            }
        }
        
        [Column(Storage="uf", Name="UF", DbType="char(2)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string UF
        {
            get
            {
                return this._UF;
            }
            set
            {
                if (_UF != value)
                {
                    this.OnUFChanging(value);
                    this._UF = value;
                    this.SendPropertyChanged("UF");
                    this.OnUFChanged();
                }
            }
        }
        
        [Column(Storage="usUarIo", Name="USUARIO", DbType="int unsigned", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public uint Usuario
        {
            get
            {
                return this._Usuario;
            }
            set
            {
                if (_Usuario != value)
                {
                    this.OnUsuarioChanging(value);
                    this._Usuario = value;
                    this.SendPropertyChanged("Usuario");
                    this.OnUsuarioChanged();
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected virtual void SendPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
            {
                this.PropertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [Table(Name="afasfa.voluntarios")]
    public partial class Voluntarios : System.ComponentModel.INotifyPropertyChanged
    {
        
        private byte _AceitaTermo;
        
        private string _Apelido;
        
        private string _CidadeOrigem;
        
        private string _ComoFicouSabendo;
        
        private System.DateTime _DataNascimento;
        
        private string _Escolaridade;
        
        private string _UF;
        
        private string _EstadoCivil;
        
        private string _UFOrigem;
        
        private byte _Habilitado;
        
        private string _LocalDeTrabalho;
        
        private string _Nacionalidade;
        
        private string _Nome;
        
        private string _Profissao;
        
        private uint _Disponibilidade;
        
        private uint _DiasDisponiveis;
        
        private string _Atividade;
        
        private string _TempoDoVoluntario;
        
        private string _TipoVoluntario;
        
        private bool _Trabalha;
        
        private uint _Usuario;
        
	partial void OnCreated();
	partial void OnAceitaTermoChanging(System.Byte instance);
	partial void OnAceitaTermoChanged();
	partial void OnApelidoChanging(System.String instance);
	partial void OnApelidoChanged();
	partial void OnCidadeOrigemChanging(System.String instance);
	partial void OnCidadeOrigemChanged();
	partial void OnComoFicouSabendoChanging(System.String instance);
	partial void OnComoFicouSabendoChanged();
	partial void OnDataNascimentoChanging(System.DateTime instance);
	partial void OnDataNascimentoChanged();
	partial void OnEscolaridadeChanging(System.String instance);
	partial void OnEscolaridadeChanged();
	partial void OnUFChanging(System.String instance);
	partial void OnUFChanged();
	partial void OnEstadoCivilChanging(System.String instance);
	partial void OnEstadoCivilChanged();
	partial void OnUFOrigemChanging(System.String instance);
	partial void OnUFOrigemChanged();
	partial void OnHabilitadoChanging(System.Byte instance);
	partial void OnHabilitadoChanged();
	partial void OnLocalDeTrabalhoChanging(System.String instance);
	partial void OnLocalDeTrabalhoChanged();
	partial void OnNacionalidadeChanging(System.String instance);
	partial void OnNacionalidadeChanged();
	partial void OnNomeChanging(System.String instance);
	partial void OnNomeChanged();
	partial void OnProfissaoChanging(System.String instance);
	partial void OnProfissaoChanged();
	partial void OnDisponibilidadeChanging(System.UInt32 instance);
	partial void OnDisponibilidadeChanged();
	partial void OnDiasDisponiveisChanging(System.UInt32 instance);
	partial void OnDiasDisponiveisChanged();
	partial void OnAtividadeChanging(System.String instance);
	partial void OnAtividadeChanged();
	partial void OnTempoDoVoluntarioChanging(System.String instance);
	partial void OnTempoDoVoluntarioChanged();
	partial void OnTipoVoluntarioChanging(System.String instance);
	partial void OnTipoVoluntarioChanged();
	partial void OnTrabalhaChanging(System.Boolean instance);
	partial void OnTrabalhaChanged();
	partial void OnUsuarioChanging(System.UInt32 instance);
	partial void OnUsuarioChanged();
        
        public Voluntarios()
        {
            this.OnCreated();
        }
        
        [Column(Storage="aceItAterMo", Name="ACEITATERMO", DbType="tinyint(1)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public byte AceitaTermo
        {
            get
            {
                return this._AceitaTermo;
            }
            set
            {
                if (_AceitaTermo != value)
                {
                    this.OnAceitaTermoChanging(value);
                    this._AceitaTermo = value;
                    this.SendPropertyChanged("AceitaTermo");
                    this.OnAceitaTermoChanged();
                }
            }
        }
        
        [Column(Storage="apeLido", Name="APELIDO", DbType="varchar(20)", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public string Apelido
        {
            get
            {
                return this._Apelido;
            }
            set
            {
                if (_Apelido != value)
                {
                    this.OnApelidoChanging(value);
                    this._Apelido = value;
                    this.SendPropertyChanged("Apelido");
                    this.OnApelidoChanged();
                }
            }
        }
        
        [Column(Storage="cidAdEorIgEm", Name="CIDADEORIGEM", DbType="varchar(40)", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public string CidadeOrigem
        {
            get
            {
                return this._CidadeOrigem;
            }
            set
            {
                if (_CidadeOrigem != value)
                {
                    this.OnCidadeOrigemChanging(value);
                    this._CidadeOrigem = value;
                    this.SendPropertyChanged("CidadeOrigem");
                    this.OnCidadeOrigemChanged();
                }
            }
        }
        
        [Column(Storage="comOfIcouSAbEndO", Name="COMOFICOUSABENDO", DbType="varchar(60)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string ComoFicouSabendo
        {
            get
            {
                return this._ComoFicouSabendo;
            }
            set
            {
                if (_ComoFicouSabendo != value)
                {
                    this.OnComoFicouSabendoChanging(value);
                    this._ComoFicouSabendo = value;
                    this.SendPropertyChanged("ComoFicouSabendo");
                    this.OnComoFicouSabendoChanged();
                }
            }
        }
        
        [Column(Storage="dataNasCiMenTo", Name="DATANASCIMENTO", DbType="date", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public System.DateTime DataNascimento
        {
            get
            {
                return this._DataNascimento;
            }
            set
            {
                if (_DataNascimento != value)
                {
                    this.OnDataNascimentoChanging(value);
                    this._DataNascimento = value;
                    this.SendPropertyChanged("DataNascimento");
                    this.OnDataNascimentoChanged();
                }
            }
        }
        
        [Column(Storage="esColaRiDade", Name="ESCOLARIDADE", DbType="varchar(30)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string Escolaridade
        {
            get
            {
                return this._Escolaridade;
            }
            set
            {
                if (_Escolaridade != value)
                {
                    this.OnEscolaridadeChanging(value);
                    this._Escolaridade = value;
                    this.SendPropertyChanged("Escolaridade");
                    this.OnEscolaridadeChanged();
                }
            }
        }
        
        [Column(Storage="estAdo", Name="ESTADO", DbType="char(1)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string UF
        {
            get
            {
                return this._UF;
            }
            set
            {
                if (_UF != value)
                {
                    this.OnUFChanging(value);
                    this._UF = value;
                    this.SendPropertyChanged("UF");
                    this.OnUFChanged();
                }
            }
        }
        
        [Column(Storage="estAdoCivil", Name="ESTADOCIVIL", DbType="char(1)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string EstadoCivil
        {
            get
            {
                return this._EstadoCivil;
            }
            set
            {
                if (_EstadoCivil != value)
                {
                    this.OnEstadoCivilChanging(value);
                    this._EstadoCivil = value;
                    this.SendPropertyChanged("EstadoCivil");
                    this.OnEstadoCivilChanged();
                }
            }
        }
        
        [Column(Storage="estAdoOrIgEm", Name="ESTADOORIGEM", DbType="varchar(2)", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public string UFOrigem
        {
            get
            {
                return this._UFOrigem;
            }
            set
            {
                if (_UFOrigem != value)
                {
                    this.OnUFOrigemChanging(value);
                    this._UFOrigem = value;
                    this.SendPropertyChanged("UFOrigem");
                    this.OnUFOrigemChanged();
                }
            }
        }
        
        [Column(Storage="haBiLItAdo", Name="HABILITADO", DbType="tinyint(1)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public byte Habilitado
        {
            get
            {
                return this._Habilitado;
            }
            set
            {
                if (_Habilitado != value)
                {
                    this.OnHabilitadoChanging(value);
                    this._Habilitado = value;
                    this.SendPropertyChanged("Habilitado");
                    this.OnHabilitadoChanged();
                }
            }
        }
        
        [Column(Storage="localDetrABaLhO", Name="LOCALDETRABALHO", DbType="varchar(40)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string LocalDeTrabalho
        {
            get
            {
                return this._LocalDeTrabalho;
            }
            set
            {
                if (_LocalDeTrabalho != value)
                {
                    this.OnLocalDeTrabalhoChanging(value);
                    this._LocalDeTrabalho = value;
                    this.SendPropertyChanged("LocalDeTrabalho");
                    this.OnLocalDeTrabalhoChanged();
                }
            }
        }
        
        [Column(Storage="naCIonAlIDade", Name="NACIONALIDADE", DbType="char(1)", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public string Nacionalidade
        {
            get
            {
                return this._Nacionalidade;
            }
            set
            {
                if (_Nacionalidade != value)
                {
                    this.OnNacionalidadeChanging(value);
                    this._Nacionalidade = value;
                    this.SendPropertyChanged("Nacionalidade");
                    this.OnNacionalidadeChanged();
                }
            }
        }
        
        [Column(Storage="nome", Name="NOME", DbType="varchar(60)", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public string Nome
        {
            get
            {
                return this._Nome;
            }
            set
            {
                if (_Nome != value)
                {
                    this.OnNomeChanging(value);
                    this._Nome = value;
                    this.SendPropertyChanged("Nome");
                    this.OnNomeChanged();
                }
            }
        }
        
        [Column(Storage="profIsSao", Name="PROFISSAO", DbType="varchar(40)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string Profissao
        {
            get
            {
                return this._Profissao;
            }
            set
            {
                if (_Profissao != value)
                {
                    this.OnProfissaoChanging(value);
                    this._Profissao = value;
                    this.SendPropertyChanged("Profissao");
                    this.OnProfissaoChanged();
                }
            }
        }
        
        [Column(Storage="quadIsPOnIbiLiDade", Name="QUADISPONIBILIDADE", DbType="int unsigned", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public uint Disponibilidade
        {
            get
            {
                return this._Disponibilidade;
            }
            set
            {
                if (_Disponibilidade != value)
                {
                    this.OnDisponibilidadeChanging(value);
                    this._Disponibilidade = value;
                    this.SendPropertyChanged("Disponibilidade");
                    this.OnDisponibilidadeChanged();
                }
            }
        }
        
        [Column(Storage="quaiSdiAs", Name="QUAISDIAS", DbType="int unsigned", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public uint DiasDisponiveis
        {
            get
            {
                return this._DiasDisponiveis;
            }
            set
            {
                if (_DiasDisponiveis != value)
                {
                    this.OnDiasDisponiveisChanging(value);
                    this._DiasDisponiveis = value;
                    this.SendPropertyChanged("DiasDisponiveis");
                    this.OnDiasDisponiveisChanged();
                }
            }
        }
        
        [Column(Storage="quaLaTivIDade", Name="QUALATIVIDADE", DbType="varchar(100)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string Atividade
        {
            get
            {
                return this._Atividade;
            }
            set
            {
                if (_Atividade != value)
                {
                    this.OnAtividadeChanging(value);
                    this._Atividade = value;
                    this.SendPropertyChanged("Atividade");
                    this.OnAtividadeChanged();
                }
            }
        }
        
        [Column(Storage="tempoDoVolUNtArIo", Name="TEMPODOVOLUNTARIO", DbType="varchar(100)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string TempoDoVoluntario
        {
            get
            {
                return this._TempoDoVoluntario;
            }
            set
            {
                if (_TempoDoVoluntario != value)
                {
                    this.OnTempoDoVoluntarioChanging(value);
                    this._TempoDoVoluntario = value;
                    this.SendPropertyChanged("TempoDoVoluntario");
                    this.OnTempoDoVoluntarioChanged();
                }
            }
        }
        
        [Column(Storage="tipOvolUNtArIo", Name="TIPOVOLUNTARIO", DbType="char(1)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public string TipoVoluntario
        {
            get
            {
                return this._TipoVoluntario;
            }
            set
            {
                if (_TipoVoluntario != value)
                {
                    this.OnTipoVoluntarioChanging(value);
                    this._TipoVoluntario = value;
                    this.SendPropertyChanged("TipoVoluntario");
                    this.OnTipoVoluntarioChanged();
                }
            }
        }
        
        [Column(Storage="trABaLhA", Name="TRABALHA", DbType="tinyint(1)", CanBeNull=true)]
        [DebuggerNonUserCode()]
        public bool Trabalha
        {
            get
            {
                return this._Trabalha;
            }
            set
            {
                if (_Trabalha != value)
                {
                    this.OnTrabalhaChanging(value);
                    this._Trabalha = value;
                    this.SendPropertyChanged("Trabalha");
                    this.OnTrabalhaChanged();
                }
            }
        }
        
        [Column(Storage="usUarIoSuSUarIo", Name="USUARIOS_USUARIO", DbType="int unsigned", CanBeNull=false)]
        [DebuggerNonUserCode()]
        public uint Usuario
        {
            get
            {
                return this._Usuario;
            }
            set
            {
                if (_Usuario != value)
                {
                    this.OnUsuarioChanging(value);
                    this._Usuario = value;
                    this.SendPropertyChanged("Usuario");
                    this.OnUsuarioChanged();
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected virtual void SendPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
            {
                this.PropertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
}
