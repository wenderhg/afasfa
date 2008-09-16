#region Auto-generated classes for AFASFA database on 2008-09-07 17:54:30Z

//
//  ____  _     __  __      _        _
// |  _ \| |__ |  \/  | ___| |_ __ _| |
// | | | | '_ \| |\/| |/ _ \ __/ _` | |
// | |_| | |_) | |  | |  __/ || (_| | |
// |____/|_.__/|_|  |_|\___|\__\__,_|_|
//
// Auto-generated from AFASFA on 2008-09-07 17:54:30Z
// Please visit http://linq.to/db for more information

#endregion

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Linq.Mapping;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Text;


namespace linq.afasfa
{
	public partial class AfAsFa : DbLinq.Linq.DataContext
	{
		public AfAsFa(System.Data.IDbConnection connection)
		: base(connection, new DbLinq.MySql.MySqlVendor())
		{
		}

		public AfAsFa(System.Data.IDbConnection connection, DbLinq.Vendor.IVendor vendor)
		: base(connection, vendor)
		{
		}

		public Table<AssistEnCiaS> AssistEnCiaS { get { return GetTable<AssistEnCiaS>(); } }
		public Table<DadoSQuaNtItAtIVOs> DadoSQuaNtItAtIVOs { get { return GetTable<DadoSQuaNtItAtIVOs>(); } }
		public Table<DoaCOeS> DoaCOeS { get { return GetTable<DoaCOeS>(); } }
		public Table<EventOs> EventOs { get { return GetTable<EventOs>(); } }
		public Table<ProJetOs> ProJetOs { get { return GetTable<ProJetOs>(); } }
		public Table<UsUarIoS> UsUarIoS { get { return GetTable<UsUarIoS>(); } }
		public Table<VOLuNTarIoS> VOLuNTarIoS { get { return GetTable<VOLuNTarIoS>(); } }

	}

	[Table(Name = "afasfa.assistencias")]
	public partial class AssistEnCiaS : INotifyPropertyChanged
	{
		#region INotifyPropertyChanged handling

		public event PropertyChangedEventHandler PropertyChanged;

		protected virtual void OnPropertyChanged(string propertyName)
		{
			if (PropertyChanged != null)
			{
				PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}

		#endregion

		#region uint AssistEnCia

		[AutoGenId]
		private uint assistEnCia;
		[DebuggerNonUserCode]
		[Column(Storage = "assistEnCia", Name = "ASSISTENCIA", DbType = "int unsigned", IsPrimaryKey = true, IsDbGenerated = true, CanBeNull = false, Expression = null)]
		public uint AssistEnCia
		{
			get
			{
				return assistEnCia;
			}
			set
			{
				if (value != assistEnCia)
				{
					assistEnCia = value;
					OnPropertyChanged("AssistEnCia");
				}
			}
		}

		#endregion

		#region string DesCrIcaO

		private string desCrIcaO;
		[DebuggerNonUserCode]
		[Column(Storage = "desCrIcaO", Name = "DESCRICAO", DbType = "varchar(60)", CanBeNull = false, Expression = null)]
		public string DesCrIcaO
		{
			get
			{
				return desCrIcaO;
			}
			set
			{
				if (value != desCrIcaO)
				{
					desCrIcaO = value;
					OnPropertyChanged("DesCrIcaO");
				}
			}
		}

		#endregion

		#region string ReSpOnSaveL

		private string reSpOnSaveL;
		[DebuggerNonUserCode]
		[Column(Storage = "reSpOnSaveL", Name = "RESPONSAVEL", DbType = "varchar(30)", CanBeNull = false, Expression = null)]
		public string ReSpOnSaveL
		{
			get
			{
				return reSpOnSaveL;
			}
			set
			{
				if (value != reSpOnSaveL)
				{
					reSpOnSaveL = value;
					OnPropertyChanged("ReSpOnSaveL");
				}
			}
		}

		#endregion

	}

	[Table(Name = "afasfa.dados_quantitativos")]
	public partial class DadoSQuaNtItAtIVOs : INotifyPropertyChanged
	{
		#region INotifyPropertyChanged handling

		public event PropertyChangedEventHandler PropertyChanged;

		protected virtual void OnPropertyChanged(string propertyName)
		{
			if (PropertyChanged != null)
			{
				PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}

		#endregion

		#region uint AssistEnCia

		private uint assistEnCia;
		[DebuggerNonUserCode]
		[Column(Storage = "assistEnCia", Name = "ASSISTENCIA", DbType = "int unsigned", IsPrimaryKey = true, CanBeNull = false, Expression = null)]
		public uint AssistEnCia
		{
			get
			{
				return assistEnCia;
			}
			set
			{
				if (value != assistEnCia)
				{
					assistEnCia = value;
					OnPropertyChanged("AssistEnCia");
				}
			}
		}

		#endregion

		#region string DesCrIcaO

		private string desCrIcaO;
		[DebuggerNonUserCode]
		[Column(Storage = "desCrIcaO", Name = "DESCRICAO", DbType = "varchar(40)", CanBeNull = false, Expression = null)]
		public string DesCrIcaO
		{
			get
			{
				return desCrIcaO;
			}
			set
			{
				if (value != desCrIcaO)
				{
					desCrIcaO = value;
					OnPropertyChanged("DesCrIcaO");
				}
			}
		}

		#endregion

		#region string MeSanO

		private string meSanO;
		[DebuggerNonUserCode]
		[Column(Storage = "meSanO", Name = "MESANO", DbType = "varchar(6)", IsPrimaryKey = true, CanBeNull = false, Expression = null)]
		public string MeSanO
		{
			get
			{
				return meSanO;
			}
			set
			{
				if (value != meSanO)
				{
					meSanO = value;
					OnPropertyChanged("MeSanO");
				}
			}
		}

		#endregion

		#region uint? QTdEAdolescentEsF

		private uint? qtDEaDolescentEsF;
		[DebuggerNonUserCode]
		[Column(Storage = "qtDEaDolescentEsF", Name = "QTDEADOLESCENTESF", DbType = "int unsigned", Expression = null)]
		public uint? QTdEAdolescentEsF
		{
			get
			{
				return qtDEaDolescentEsF;
			}
			set
			{
				if (value != qtDEaDolescentEsF)
				{
					qtDEaDolescentEsF = value;
					OnPropertyChanged("QTdEAdolescentEsF");
				}
			}
		}

		#endregion

		#region uint? QTdEAdolescentEsM

		private uint? qtDEaDolescentEsM;
		[DebuggerNonUserCode]
		[Column(Storage = "qtDEaDolescentEsM", Name = "QTDEADOLESCENTESM", DbType = "int unsigned", Expression = null)]
		public uint? QTdEAdolescentEsM
		{
			get
			{
				return qtDEaDolescentEsM;
			}
			set
			{
				if (value != qtDEaDolescentEsM)
				{
					qtDEaDolescentEsM = value;
					OnPropertyChanged("QTdEAdolescentEsM");
				}
			}
		}

		#endregion

		#region uint? QTdEAdultOsF

		private uint? qtDEaDultOsF;
		[DebuggerNonUserCode]
		[Column(Storage = "qtDEaDultOsF", Name = "QTDEADULTOSF", DbType = "int unsigned", Expression = null)]
		public uint? QTdEAdultOsF
		{
			get
			{
				return qtDEaDultOsF;
			}
			set
			{
				if (value != qtDEaDultOsF)
				{
					qtDEaDultOsF = value;
					OnPropertyChanged("QTdEAdultOsF");
				}
			}
		}

		#endregion

		#region uint? QTdEAdultOsM

		private uint? qtDEaDultOsM;
		[DebuggerNonUserCode]
		[Column(Storage = "qtDEaDultOsM", Name = "QTDEADULTOSM", DbType = "int unsigned", Expression = null)]
		public uint? QTdEAdultOsM
		{
			get
			{
				return qtDEaDultOsM;
			}
			set
			{
				if (value != qtDEaDultOsM)
				{
					qtDEaDultOsM = value;
					OnPropertyChanged("QTdEAdultOsM");
				}
			}
		}

		#endregion

		#region uint? QTdEcRiAnCasF

		private uint? qtDEcRiAnCasF;
		[DebuggerNonUserCode]
		[Column(Storage = "qtDEcRiAnCasF", Name = "QTDECRIANCASF", DbType = "int unsigned", Expression = null)]
		public uint? QTdEcRiAnCasF
		{
			get
			{
				return qtDEcRiAnCasF;
			}
			set
			{
				if (value != qtDEcRiAnCasF)
				{
					qtDEcRiAnCasF = value;
					OnPropertyChanged("QTdEcRiAnCasF");
				}
			}
		}

		#endregion

		#region uint? QTdEcRiAnCasM

		private uint? qtDEcRiAnCasM;
		[DebuggerNonUserCode]
		[Column(Storage = "qtDEcRiAnCasM", Name = "QTDECRIANCASM", DbType = "int unsigned", Expression = null)]
		public uint? QTdEcRiAnCasM
		{
			get
			{
				return qtDEcRiAnCasM;
			}
			set
			{
				if (value != qtDEcRiAnCasM)
				{
					qtDEcRiAnCasM = value;
					OnPropertyChanged("QTdEcRiAnCasM");
				}
			}
		}

		#endregion

		#region uint? QTDefAmIlIA

		private uint? qtdEfAmIlIa;
		[DebuggerNonUserCode]
		[Column(Storage = "qtdEfAmIlIa", Name = "QTDEFAMILIA", DbType = "int unsigned", Expression = null)]
		public uint? QTDefAmIlIA
		{
			get
			{
				return qtdEfAmIlIa;
			}
			set
			{
				if (value != qtdEfAmIlIa)
				{
					qtdEfAmIlIa = value;
					OnPropertyChanged("QTDefAmIlIA");
				}
			}
		}

		#endregion

		#region string ReSpOnSaveL

		private string reSpOnSaveL;
		[DebuggerNonUserCode]
		[Column(Storage = "reSpOnSaveL", Name = "RESPONSAVEL", DbType = "varchar(60)", CanBeNull = false, Expression = null)]
		public string ReSpOnSaveL
		{
			get
			{
				return reSpOnSaveL;
			}
			set
			{
				if (value != reSpOnSaveL)
				{
					reSpOnSaveL = value;
					OnPropertyChanged("ReSpOnSaveL");
				}
			}
		}

		#endregion

	}

	[Table(Name = "afasfa.doacoes")]
	public partial class DoaCOeS : INotifyPropertyChanged
	{
		#region INotifyPropertyChanged handling

		public event PropertyChangedEventHandler PropertyChanged;

		protected virtual void OnPropertyChanged(string propertyName)
		{
			if (PropertyChanged != null)
			{
				PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}

		#endregion

		#region string BaIrRO

		private string baIrRo;
		[DebuggerNonUserCode]
		[Column(Storage = "baIrRo", Name = "BAIRRO", DbType = "varchar(45)", CanBeNull = false, Expression = null)]
		public string BaIrRO
		{
			get
			{
				return baIrRo;
			}
			set
			{
				if (value != baIrRo)
				{
					baIrRo = value;
					OnPropertyChanged("BaIrRO");
				}
			}
		}

		#endregion

		#region System.DateTime? DataDoaCaO

		private System.DateTime? dataDoaCaO;
		[DebuggerNonUserCode]
		[Column(Storage = "dataDoaCaO", Name = "DATADOACAO", DbType = "date", Expression = null)]
		public System.DateTime? DataDoaCaO
		{
			get
			{
				return dataDoaCaO;
			}
			set
			{
				if (value != dataDoaCaO)
				{
					dataDoaCaO = value;
					OnPropertyChanged("DataDoaCaO");
				}
			}
		}

		#endregion

		#region string DiSpOnIbiLiDade

		private string diSpOnIbiLiDade;
		[DebuggerNonUserCode]
		[Column(Storage = "diSpOnIbiLiDade", Name = "DISPONIBILIDADE", DbType = "text", CanBeNull = false, Expression = null)]
		public string DiSpOnIbiLiDade
		{
			get
			{
				return diSpOnIbiLiDade;
			}
			set
			{
				if (value != diSpOnIbiLiDade)
				{
					diSpOnIbiLiDade = value;
					OnPropertyChanged("DiSpOnIbiLiDade");
				}
			}
		}

		#endregion

		#region uint DoaCaO

		[AutoGenId]
		private uint doaCaO;
		[DebuggerNonUserCode]
		[Column(Storage = "doaCaO", Name = "DOACAO", DbType = "int unsigned", IsPrimaryKey = true, IsDbGenerated = true, CanBeNull = false, Expression = null)]
		public uint DoaCaO
		{
			get
			{
				return doaCaO;
			}
			set
			{
				if (value != doaCaO)
				{
					doaCaO = value;
					OnPropertyChanged("DoaCaO");
				}
			}
		}

		#endregion

		#region string Email

		private string email;
		[DebuggerNonUserCode]
		[Column(Storage = "email", Name = "EMAIL", DbType = "varchar(100)", Expression = null)]
		public string Email
		{
			get
			{
				return email;
			}
			set
			{
				if (value != email)
				{
					email = value;
					OnPropertyChanged("Email");
				}
			}
		}

		#endregion

		#region string EnderEcO

		private string enderEcO;
		[DebuggerNonUserCode]
		[Column(Storage = "enderEcO", Name = "ENDERECO", DbType = "varchar(45)", CanBeNull = false, Expression = null)]
		public string EnderEcO
		{
			get
			{
				return enderEcO;
			}
			set
			{
				if (value != enderEcO)
				{
					enderEcO = value;
					OnPropertyChanged("EnderEcO");
				}
			}
		}

		#endregion

		#region string EstAdo

		private string estAdo;
		[DebuggerNonUserCode]
		[Column(Storage = "estAdo", Name = "ESTADO", DbType = "char(1)", Expression = null)]
		public string EstAdo
		{
			get
			{
				return estAdo;
			}
			set
			{
				if (value != estAdo)
				{
					estAdo = value;
					OnPropertyChanged("EstAdo");
				}
			}
		}

		#endregion

		#region string ITens

		private string itEns;
		[DebuggerNonUserCode]
		[Column(Storage = "itEns", Name = "ITENS", DbType = "text", CanBeNull = false, Expression = null)]
		public string ITens
		{
			get
			{
				return itEns;
			}
			set
			{
				if (value != itEns)
				{
					itEns = value;
					OnPropertyChanged("ITens");
				}
			}
		}

		#endregion

		#region string Nome

		private string nome;
		[DebuggerNonUserCode]
		[Column(Storage = "nome", Name = "NOME", DbType = "varchar(60)", Expression = null)]
		public string Nome
		{
			get
			{
				return nome;
			}
			set
			{
				if (value != nome)
				{
					nome = value;
					OnPropertyChanged("Nome");
				}
			}
		}

		#endregion

		#region string OBsERvAcAO

		private string obSErVAcAo;
		[DebuggerNonUserCode]
		[Column(Storage = "obSErVAcAo", Name = "OBSERVACAO", DbType = "text", Expression = null)]
		public string OBsERvAcAO
		{
			get
			{
				return obSErVAcAo;
			}
			set
			{
				if (value != obSErVAcAo)
				{
					obSErVAcAo = value;
					OnPropertyChanged("OBsERvAcAO");
				}
			}
		}

		#endregion

		#region decimal? TeLEFOneCeL

		private decimal? teLefoNeCeL;
		[DebuggerNonUserCode]
		[Column(Storage = "teLefoNeCeL", Name = "TELEFONECEL", DbType = "decimal", Expression = null)]
		public decimal? TeLEFOneCeL
		{
			get
			{
				return teLefoNeCeL;
			}
			set
			{
				if (value != teLefoNeCeL)
				{
					teLefoNeCeL = value;
					OnPropertyChanged("TeLEFOneCeL");
				}
			}
		}

		#endregion

		#region decimal TeLEFOneReS

		private decimal teLefoNeReS;
		[DebuggerNonUserCode]
		[Column(Storage = "teLefoNeReS", Name = "TELEFONERES", DbType = "decimal", CanBeNull = false, Expression = null)]
		public decimal TeLEFOneReS
		{
			get
			{
				return teLefoNeReS;
			}
			set
			{
				if (value != teLefoNeReS)
				{
					teLefoNeReS = value;
					OnPropertyChanged("TeLEFOneReS");
				}
			}
		}

		#endregion

	}

	[Table(Name = "afasfa.eventos")]
	public partial class EventOs : INotifyPropertyChanged
	{
		#region INotifyPropertyChanged handling

		public event PropertyChangedEventHandler PropertyChanged;

		protected virtual void OnPropertyChanged(string propertyName)
		{
			if (PropertyChanged != null)
			{
				PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}

		#endregion

		#region byte? ApResentAR

		private byte? apResentAr;
		[DebuggerNonUserCode]
		[Column(Storage = "apResentAr", Name = "APRESENTAR", DbType = "tinyint(1)", Expression = null)]
		public byte? ApResentAR
		{
			get
			{
				return apResentAr;
			}
			set
			{
				if (value != apResentAr)
				{
					apResentAr = value;
					OnPropertyChanged("ApResentAR");
				}
			}
		}

		#endregion

		#region System.DateTime DataEventO

		private System.DateTime dataEventO;
		[DebuggerNonUserCode]
		[Column(Storage = "dataEventO", Name = "DATAEVENTO", DbType = "date", CanBeNull = false, Expression = null)]
		public System.DateTime DataEventO
		{
			get
			{
				return dataEventO;
			}
			set
			{
				if (value != dataEventO)
				{
					dataEventO = value;
					OnPropertyChanged("DataEventO");
				}
			}
		}

		#endregion

		#region System.DateTime? DataMaxima

		private System.DateTime? dataMaxima;
		[DebuggerNonUserCode]
		[Column(Storage = "dataMaxima", Name = "DATAMAXIMA", DbType = "date", Expression = null)]
		public System.DateTime? DataMaxima
		{
			get
			{
				return dataMaxima;
			}
			set
			{
				if (value != dataMaxima)
				{
					dataMaxima = value;
					OnPropertyChanged("DataMaxima");
				}
			}
		}

		#endregion

		#region string DesCrIcaO

		private string desCrIcaO;
		[DebuggerNonUserCode]
		[Column(Storage = "desCrIcaO", Name = "DESCRICAO", DbType = "varchar(60)", CanBeNull = false, Expression = null)]
		public string DesCrIcaO
		{
			get
			{
				return desCrIcaO;
			}
			set
			{
				if (value != desCrIcaO)
				{
					desCrIcaO = value;
					OnPropertyChanged("DesCrIcaO");
				}
			}
		}

		#endregion

		#region uint EventO

		private uint eventO;
		[DebuggerNonUserCode]
		[Column(Storage = "eventO", Name = "EVENTO", DbType = "int unsigned", IsPrimaryKey = true, CanBeNull = false, Expression = null)]
		public uint EventO
		{
			get
			{
				return eventO;
			}
			set
			{
				if (value != eventO)
				{
					eventO = value;
					OnPropertyChanged("EventO");
				}
			}
		}

		#endregion

		#region string FOtOInICiaL

		private string foTOiNIcIaL;
		[DebuggerNonUserCode]
		[Column(Storage = "foTOiNIcIaL", Name = "FOTOINICIAL", DbType = "varchar(100)", Expression = null)]
		public string FOtOInICiaL
		{
			get
			{
				return foTOiNIcIaL;
			}
			set
			{
				if (value != foTOiNIcIaL)
				{
					foTOiNIcIaL = value;
					OnPropertyChanged("FOtOInICiaL");
				}
			}
		}

		#endregion

		#region byte? JAreaLizAdo

		private byte? jaReaLizAdo;
		[DebuggerNonUserCode]
		[Column(Storage = "jaReaLizAdo", Name = "JAREALIZADO", DbType = "tinyint(1)", Expression = null)]
		public byte? JAreaLizAdo
		{
			get
			{
				return jaReaLizAdo;
			}
			set
			{
				if (value != jaReaLizAdo)
				{
					jaReaLizAdo = value;
					OnPropertyChanged("JAreaLizAdo");
				}
			}
		}

		#endregion

		#region string LocaleVentO

		private string localeVentO;
		[DebuggerNonUserCode]
		[Column(Storage = "localeVentO", Name = "LOCALEVENTO", DbType = "varchar(150)", CanBeNull = false, Expression = null)]
		public string LocaleVentO
		{
			get
			{
				return localeVentO;
			}
			set
			{
				if (value != localeVentO)
				{
					localeVentO = value;
					OnPropertyChanged("LocaleVentO");
				}
			}
		}

		#endregion

		#region string OBsERvAcAO

		private string obSErVAcAo;
		[DebuggerNonUserCode]
		[Column(Storage = "obSErVAcAo", Name = "OBSERVACAO", DbType = "text", Expression = null)]
		public string OBsERvAcAO
		{
			get
			{
				return obSErVAcAo;
			}
			set
			{
				if (value != obSErVAcAo)
				{
					obSErVAcAo = value;
					OnPropertyChanged("OBsERvAcAO");
				}
			}
		}

		#endregion

		#region byte? REseRvAdisPOnIVEL

		private byte? reSeRvAdisPoNIvel;
		[DebuggerNonUserCode]
		[Column(Storage = "reSeRvAdisPoNIvel", Name = "RESERVADISPONIVEL", DbType = "tinyint(1)", Expression = null)]
		public byte? REseRvAdisPOnIVEL
		{
			get
			{
				return reSeRvAdisPoNIvel;
			}
			set
			{
				if (value != reSeRvAdisPoNIvel)
				{
					reSeRvAdisPoNIvel = value;
					OnPropertyChanged("REseRvAdisPOnIVEL");
				}
			}
		}

		#endregion

		#region decimal ValorConViTea

		private decimal valorConViTea;
		[DebuggerNonUserCode]
		[Column(Storage = "valorConViTea", Name = "VALORCONVITEA", DbType = "decimal(10,2)", CanBeNull = false, Expression = null)]
		public decimal ValorConViTea
		{
			get
			{
				return valorConViTea;
			}
			set
			{
				if (value != valorConViTea)
				{
					valorConViTea = value;
					OnPropertyChanged("ValorConViTea");
				}
			}
		}

		#endregion

		#region decimal ValorConViTeC

		private decimal valorConViTeC;
		[DebuggerNonUserCode]
		[Column(Storage = "valorConViTeC", Name = "VALORCONVITEC", DbType = "decimal(10,2)", CanBeNull = false, Expression = null)]
		public decimal ValorConViTeC
		{
			get
			{
				return valorConViTeC;
			}
			set
			{
				if (value != valorConViTeC)
				{
					valorConViTeC = value;
					OnPropertyChanged("ValorConViTeC");
				}
			}
		}

		#endregion

	}

	[Table(Name = "afasfa.projetos")]
	public partial class ProJetOs : INotifyPropertyChanged
	{
		#region INotifyPropertyChanged handling

		public event PropertyChangedEventHandler PropertyChanged;

		protected virtual void OnPropertyChanged(string propertyName)
		{
			if (PropertyChanged != null)
			{
				PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}

		#endregion

		#region string DadoSdOprOJetO

		private string dadoSdOprOjEtO;
		[DebuggerNonUserCode]
		[Column(Storage = "dadoSdOprOjEtO", Name = "DADOSDOPROJETO", DbType = "text", Expression = null)]
		public string DadoSdOprOJetO
		{
			get
			{
				return dadoSdOprOjEtO;
			}
			set
			{
				if (value != dadoSdOprOjEtO)
				{
					dadoSdOprOjEtO = value;
					OnPropertyChanged("DadoSdOprOJetO");
				}
			}
		}

		#endregion

		#region string DesCrIcaO

		private string desCrIcaO;
		[DebuggerNonUserCode]
		[Column(Storage = "desCrIcaO", Name = "DESCRICAO", DbType = "varchar(50)", Expression = null)]
		public string DesCrIcaO
		{
			get
			{
				return desCrIcaO;
			}
			set
			{
				if (value != desCrIcaO)
				{
					desCrIcaO = value;
					OnPropertyChanged("DesCrIcaO");
				}
			}
		}

		#endregion

		#region string FOtO

		private string foTO;
		[DebuggerNonUserCode]
		[Column(Storage = "foTO", Name = "FOTO", DbType = "varchar(100)", Expression = null)]
		public string FOtO
		{
			get
			{
				return foTO;
			}
			set
			{
				if (value != foTO)
				{
					foTO = value;
					OnPropertyChanged("FOtO");
				}
			}
		}

		#endregion

		#region int OrDemApResentAcAO

		private int orDemApResentAcAo;
		[DebuggerNonUserCode]
		[Column(Storage = "orDemApResentAcAo", Name = "ORDEMAPRESENTACAO", DbType = "int", CanBeNull = false, Expression = null)]
		public int OrDemApResentAcAO
		{
			get
			{
				return orDemApResentAcAo;
			}
			set
			{
				if (value != orDemApResentAcAo)
				{
					orDemApResentAcAo = value;
					OnPropertyChanged("OrDemApResentAcAO");
				}
			}
		}

		#endregion

		#region uint ProJetO

		[AutoGenId]
		private uint proJetO;
		[DebuggerNonUserCode]
		[Column(Storage = "proJetO", Name = "PROJETO", DbType = "int unsigned", IsPrimaryKey = true, IsDbGenerated = true, CanBeNull = false, Expression = null)]
		public uint ProJetO
		{
			get
			{
				return proJetO;
			}
			set
			{
				if (value != proJetO)
				{
					proJetO = value;
					OnPropertyChanged("ProJetO");
				}
			}
		}

		#endregion

	}

	[Table(Name = "afasfa.usuarios")]
	public partial class UsUarIoS : INotifyPropertyChanged
	{
		#region INotifyPropertyChanged handling

		public event PropertyChangedEventHandler PropertyChanged;

		protected virtual void OnPropertyChanged(string propertyName)
		{
			if (PropertyChanged != null)
			{
				PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}

		#endregion

		#region string BaIrRO

		private string baIrRo;
		[DebuggerNonUserCode]
		[Column(Storage = "baIrRo", Name = "BAIRRO", DbType = "varchar(30)", Expression = null)]
		public string BaIrRO
		{
			get
			{
				return baIrRo;
			}
			set
			{
				if (value != baIrRo)
				{
					baIrRo = value;
					OnPropertyChanged("BaIrRO");
				}
			}
		}

		#endregion

		#region string CeP

		private string ceP;
		[DebuggerNonUserCode]
		[Column(Storage = "ceP", Name = "CEP", DbType = "varchar(10)", Expression = null)]
		public string CeP
		{
			get
			{
				return ceP;
			}
			set
			{
				if (value != ceP)
				{
					ceP = value;
					OnPropertyChanged("CeP");
				}
			}
		}

		#endregion

		#region string CidAdE

		private string cidAdE;
		[DebuggerNonUserCode]
		[Column(Storage = "cidAdE", Name = "CIDADE", DbType = "varchar(30)", Expression = null)]
		public string CidAdE
		{
			get
			{
				return cidAdE;
			}
			set
			{
				if (value != cidAdE)
				{
					cidAdE = value;
					OnPropertyChanged("CidAdE");
				}
			}
		}

		#endregion

		#region string ComplementO

		private string complementO;
		[DebuggerNonUserCode]
		[Column(Storage = "complementO", Name = "COMPLEMENTO", DbType = "varchar(20)", Expression = null)]
		public string ComplementO
		{
			get
			{
				return complementO;
			}
			set
			{
				if (value != complementO)
				{
					complementO = value;
					OnPropertyChanged("ComplementO");
				}
			}
		}

		#endregion

		#region string Email

		private string email;
		[DebuggerNonUserCode]
		[Column(Storage = "email", Name = "EMAIL", DbType = "varchar(100)", Expression = null)]
		public string Email
		{
			get
			{
				return email;
			}
			set
			{
				if (value != email)
				{
					email = value;
					OnPropertyChanged("Email");
				}
			}
		}

		#endregion

		#region string FOtO

		private string foTO;
		[DebuggerNonUserCode]
		[Column(Storage = "foTO", Name = "FOTO", DbType = "varchar(150)", Expression = null)]
		public string FOtO
		{
			get
			{
				return foTO;
			}
			set
			{
				if (value != foTO)
				{
					foTO = value;
					OnPropertyChanged("FOtO");
				}
			}
		}

		#endregion

		#region string Login

		private string login;
		[DebuggerNonUserCode]
		[Column(Storage = "login", Name = "LOGIN", DbType = "varchar(10)", CanBeNull = false, Expression = null)]
		public string Login
		{
			get
			{
				return login;
			}
			set
			{
				if (value != login)
				{
					login = value;
					OnPropertyChanged("Login");
				}
			}
		}

		#endregion

		#region string LogRadOurO

		private string logRadOurO;
		[DebuggerNonUserCode]
		[Column(Storage = "logRadOurO", Name = "LOGRADOURO", DbType = "varchar(50)", Expression = null)]
		public string LogRadOurO
		{
			get
			{
				return logRadOurO;
			}
			set
			{
				if (value != logRadOurO)
				{
					logRadOurO = value;
					OnPropertyChanged("LogRadOurO");
				}
			}
		}

		#endregion

		#region string Nome

		private string nome;
		[DebuggerNonUserCode]
		[Column(Storage = "nome", Name = "NOME", DbType = "varchar(60)", Expression = null)]
		public string Nome
		{
			get
			{
				return nome;
			}
			set
			{
				if (value != nome)
				{
					nome = value;
					OnPropertyChanged("Nome");
				}
			}
		}

		#endregion

		#region uint? NumERO

		private uint? numEro;
		[DebuggerNonUserCode]
		[Column(Storage = "numEro", Name = "NUMERO", DbType = "int unsigned", Expression = null)]
		public uint? NumERO
		{
			get
			{
				return numEro;
			}
			set
			{
				if (value != numEro)
				{
					numEro = value;
					OnPropertyChanged("NumERO");
				}
			}
		}

		#endregion

		#region byte? RecEBeRInFormAcOeS

		private byte? recEbERiNFormAcOeS;
		[DebuggerNonUserCode]
		[Column(Storage = "recEbERiNFormAcOeS", Name = "RECEBERINFORMACOES", DbType = "tinyint(1)", Expression = null)]
		public byte? RecEBeRInFormAcOeS
		{
			get
			{
				return recEbERiNFormAcOeS;
			}
			set
			{
				if (value != recEbERiNFormAcOeS)
				{
					recEbERiNFormAcOeS = value;
					OnPropertyChanged("RecEBeRInFormAcOeS");
				}
			}
		}

		#endregion

		#region string SEnHa

		private string seNHa;
		[DebuggerNonUserCode]
		[Column(Storage = "seNHa", Name = "SENHA", DbType = "varchar(10)", CanBeNull = false, Expression = null)]
		public string SEnHa
		{
			get
			{
				return seNHa;
			}
			set
			{
				if (value != seNHa)
				{
					seNHa = value;
					OnPropertyChanged("SEnHa");
				}
			}
		}

		#endregion

		#region decimal? TeLEFOneCeL

		private decimal? teLefoNeCeL;
		[DebuggerNonUserCode]
		[Column(Storage = "teLefoNeCeL", Name = "TELEFONECEL", DbType = "decimal", Expression = null)]
		public decimal? TeLEFOneCeL
		{
			get
			{
				return teLefoNeCeL;
			}
			set
			{
				if (value != teLefoNeCeL)
				{
					teLefoNeCeL = value;
					OnPropertyChanged("TeLEFOneCeL");
				}
			}
		}

		#endregion

		#region decimal? TeLEFOneReS

		private decimal? teLefoNeReS;
		[DebuggerNonUserCode]
		[Column(Storage = "teLefoNeReS", Name = "TELEFONERES", DbType = "decimal", Expression = null)]
		public decimal? TeLEFOneReS
		{
			get
			{
				return teLefoNeReS;
			}
			set
			{
				if (value != teLefoNeReS)
				{
					teLefoNeReS = value;
					OnPropertyChanged("TeLEFOneReS");
				}
			}
		}

		#endregion

		#region string UF

		private string uf;
		[DebuggerNonUserCode]
		[Column(Storage = "uf", Name = "UF", DbType = "char(2)", Expression = null)]
		public string UF
		{
			get
			{
				return uf;
			}
			set
			{
				if (value != uf)
				{
					uf = value;
					OnPropertyChanged("UF");
				}
			}
		}

		#endregion

		#region uint UsUarIo

		[AutoGenId]
		private uint usUarIo;
		[DebuggerNonUserCode]
		[Column(Storage = "usUarIo", Name = "USUARIO", DbType = "int unsigned", IsPrimaryKey = true, IsDbGenerated = true, CanBeNull = false, Expression = null)]
		public uint UsUarIo
		{
			get
			{
				return usUarIo;
			}
			set
			{
				if (value != usUarIo)
				{
					usUarIo = value;
					OnPropertyChanged("UsUarIo");
				}
			}
		}

		#endregion

	}

	[Table(Name = "afasfa.voluntarios")]
	public partial class VOLuNTarIoS : INotifyPropertyChanged
	{
		#region INotifyPropertyChanged handling

		public event PropertyChangedEventHandler PropertyChanged;

		protected virtual void OnPropertyChanged(string propertyName)
		{
			if (PropertyChanged != null)
			{
				PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}

		#endregion

		#region byte? AceITaterMO

		private byte? aceItAterMo;
		[DebuggerNonUserCode]
		[Column(Storage = "aceItAterMo", Name = "ACEITATERMO", DbType = "tinyint(1)", Expression = null)]
		public byte? AceITaterMO
		{
			get
			{
				return aceItAterMo;
			}
			set
			{
				if (value != aceItAterMo)
				{
					aceItAterMo = value;
					OnPropertyChanged("AceITaterMO");
				}
			}
		}

		#endregion

		#region string ApeLido

		private string apeLido;
		[DebuggerNonUserCode]
		[Column(Storage = "apeLido", Name = "APELIDO", DbType = "varchar(20)", CanBeNull = false, Expression = null)]
		public string ApeLido
		{
			get
			{
				return apeLido;
			}
			set
			{
				if (value != apeLido)
				{
					apeLido = value;
					OnPropertyChanged("ApeLido");
				}
			}
		}

		#endregion

		#region string CidAdEORigEm

		private string cidAdEorIgEm;
		[DebuggerNonUserCode]
		[Column(Storage = "cidAdEorIgEm", Name = "CIDADEORIGEM", DbType = "varchar(40)", CanBeNull = false, Expression = null)]
		public string CidAdEORigEm
		{
			get
			{
				return cidAdEorIgEm;
			}
			set
			{
				if (value != cidAdEorIgEm)
				{
					cidAdEorIgEm = value;
					OnPropertyChanged("CidAdEORigEm");
				}
			}
		}

		#endregion

		#region string ComOfICOUsABendO

		private string comOfIcouSAbEndO;
		[DebuggerNonUserCode]
		[Column(Storage = "comOfIcouSAbEndO", Name = "COMOFICOUSABENDO", DbType = "varchar(60)", Expression = null)]
		public string ComOfICOUsABendO
		{
			get
			{
				return comOfIcouSAbEndO;
			}
			set
			{
				if (value != comOfIcouSAbEndO)
				{
					comOfIcouSAbEndO = value;
					OnPropertyChanged("ComOfICOUsABendO");
				}
			}
		}

		#endregion

		#region System.DateTime DataNASciMenTo

		private System.DateTime dataNasCiMenTo;
		[DebuggerNonUserCode]
		[Column(Storage = "dataNasCiMenTo", Name = "DATANASCIMENTO", DbType = "date", CanBeNull = false, Expression = null)]
		public System.DateTime DataNASciMenTo
		{
			get
			{
				return dataNasCiMenTo;
			}
			set
			{
				if (value != dataNasCiMenTo)
				{
					dataNasCiMenTo = value;
					OnPropertyChanged("DataNASciMenTo");
				}
			}
		}

		#endregion

		#region string EsColaRiDade

		private string esColaRiDade;
		[DebuggerNonUserCode]
		[Column(Storage = "esColaRiDade", Name = "ESCOLARIDADE", DbType = "varchar(30)", Expression = null)]
		public string EsColaRiDade
		{
			get
			{
				return esColaRiDade;
			}
			set
			{
				if (value != esColaRiDade)
				{
					esColaRiDade = value;
					OnPropertyChanged("EsColaRiDade");
				}
			}
		}

		#endregion

		#region string EstAdo

		private string estAdo;
		[DebuggerNonUserCode]
		[Column(Storage = "estAdo", Name = "ESTADO", DbType = "char(1)", Expression = null)]
		public string EstAdo
		{
			get
			{
				return estAdo;
			}
			set
			{
				if (value != estAdo)
				{
					estAdo = value;
					OnPropertyChanged("EstAdo");
				}
			}
		}

		#endregion

		#region string EstAdoCivil

		private string estAdoCivil;
		[DebuggerNonUserCode]
		[Column(Storage = "estAdoCivil", Name = "ESTADOCIVIL", DbType = "char(1)", Expression = null)]
		public string EstAdoCivil
		{
			get
			{
				return estAdoCivil;
			}
			set
			{
				if (value != estAdoCivil)
				{
					estAdoCivil = value;
					OnPropertyChanged("EstAdoCivil");
				}
			}
		}

		#endregion

		#region string EstAdoORigEm

		private string estAdoOrIgEm;
		[DebuggerNonUserCode]
		[Column(Storage = "estAdoOrIgEm", Name = "ESTADOORIGEM", DbType = "varchar(2)", CanBeNull = false, Expression = null)]
		public string EstAdoORigEm
		{
			get
			{
				return estAdoOrIgEm;
			}
			set
			{
				if (value != estAdoOrIgEm)
				{
					estAdoOrIgEm = value;
					OnPropertyChanged("EstAdoORigEm");
				}
			}
		}

		#endregion

		#region byte? HaBIlItAdo

		private byte? haBiLItAdo;
		[DebuggerNonUserCode]
		[Column(Storage = "haBiLItAdo", Name = "HABILITADO", DbType = "tinyint(1)", Expression = null)]
		public byte? HaBIlItAdo
		{
			get
			{
				return haBiLItAdo;
			}
			set
			{
				if (value != haBiLItAdo)
				{
					haBiLItAdo = value;
					OnPropertyChanged("HaBIlItAdo");
				}
			}
		}

		#endregion

		#region string LocalDETRaBaLHo

		private string localDetrABaLhO;
		[DebuggerNonUserCode]
		[Column(Storage = "localDetrABaLhO", Name = "LOCALDETRABALHO", DbType = "varchar(40)", Expression = null)]
		public string LocalDETRaBaLHo
		{
			get
			{
				return localDetrABaLhO;
			}
			set
			{
				if (value != localDetrABaLhO)
				{
					localDetrABaLhO = value;
					OnPropertyChanged("LocalDETRaBaLHo");
				}
			}
		}

		#endregion

		#region string NAcIonALiDade

		private string naCIonAlIDade;
		[DebuggerNonUserCode]
		[Column(Storage = "naCIonAlIDade", Name = "NACIONALIDADE", DbType = "char(1)", CanBeNull = false, Expression = null)]
		public string NAcIonALiDade
		{
			get
			{
				return naCIonAlIDade;
			}
			set
			{
				if (value != naCIonAlIDade)
				{
					naCIonAlIDade = value;
					OnPropertyChanged("NAcIonALiDade");
				}
			}
		}

		#endregion

		#region string Nome

		private string nome;
		[DebuggerNonUserCode]
		[Column(Storage = "nome", Name = "NOME", DbType = "varchar(60)", CanBeNull = false, Expression = null)]
		public string Nome
		{
			get
			{
				return nome;
			}
			set
			{
				if (value != nome)
				{
					nome = value;
					OnPropertyChanged("Nome");
				}
			}
		}

		#endregion

		#region string ProfIsSao

		private string profIsSao;
		[DebuggerNonUserCode]
		[Column(Storage = "profIsSao", Name = "PROFISSAO", DbType = "varchar(40)", Expression = null)]
		public string ProfIsSao
		{
			get
			{
				return profIsSao;
			}
			set
			{
				if (value != profIsSao)
				{
					profIsSao = value;
					OnPropertyChanged("ProfIsSao");
				}
			}
		}

		#endregion

		#region uint? QuadISpOnIbiLiDade

		private uint? quadIsPOnIbiLiDade;
		[DebuggerNonUserCode]
		[Column(Storage = "quadIsPOnIbiLiDade", Name = "QUADISPONIBILIDADE", DbType = "int unsigned", Expression = null)]
		public uint? QuadISpOnIbiLiDade
		{
			get
			{
				return quadIsPOnIbiLiDade;
			}
			set
			{
				if (value != quadIsPOnIbiLiDade)
				{
					quadIsPOnIbiLiDade = value;
					OnPropertyChanged("QuadISpOnIbiLiDade");
				}
			}
		}

		#endregion

		#region uint? QuaiSdiAs

		private uint? quaiSdiAs;
		[DebuggerNonUserCode]
		[Column(Storage = "quaiSdiAs", Name = "QUAISDIAS", DbType = "int unsigned", Expression = null)]
		public uint? QuaiSdiAs
		{
			get
			{
				return quaiSdiAs;
			}
			set
			{
				if (value != quaiSdiAs)
				{
					quaiSdiAs = value;
					OnPropertyChanged("QuaiSdiAs");
				}
			}
		}

		#endregion

		#region string QuaLaTIViDade

		private string quaLaTivIDade;
		[DebuggerNonUserCode]
		[Column(Storage = "quaLaTivIDade", Name = "QUALATIVIDADE", DbType = "varchar(100)", Expression = null)]
		public string QuaLaTIViDade
		{
			get
			{
				return quaLaTivIDade;
			}
			set
			{
				if (value != quaLaTivIDade)
				{
					quaLaTivIDade = value;
					OnPropertyChanged("QuaLaTIViDade");
				}
			}
		}

		#endregion

		#region string TempoDoVOLuNTarIo

		private string tempoDoVolUNtArIo;
		[DebuggerNonUserCode]
		[Column(Storage = "tempoDoVolUNtArIo", Name = "TEMPODOVOLUNTARIO", DbType = "varchar(100)", Expression = null)]
		public string TempoDoVOLuNTarIo
		{
			get
			{
				return tempoDoVolUNtArIo;
			}
			set
			{
				if (value != tempoDoVolUNtArIo)
				{
					tempoDoVolUNtArIo = value;
					OnPropertyChanged("TempoDoVOLuNTarIo");
				}
			}
		}

		#endregion

		#region string TipOVOLuNTarIo

		private string tipOvolUNtArIo;
		[DebuggerNonUserCode]
		[Column(Storage = "tipOvolUNtArIo", Name = "TIPOVOLUNTARIO", DbType = "char(1)", Expression = null)]
		public string TipOVOLuNTarIo
		{
			get
			{
				return tipOvolUNtArIo;
			}
			set
			{
				if (value != tipOvolUNtArIo)
				{
					tipOvolUNtArIo = value;
					OnPropertyChanged("TipOVOLuNTarIo");
				}
			}
		}

		#endregion

		#region byte? TRaBaLHa

		private byte? trABaLhA;
		[DebuggerNonUserCode]
		[Column(Storage = "trABaLhA", Name = "TRABALHA", DbType = "tinyint(1)", Expression = null)]
		public byte? TRaBaLHa
		{
			get
			{
				return trABaLhA;
			}
			set
			{
				if (value != trABaLhA)
				{
					trABaLhA = value;
					OnPropertyChanged("TRaBaLHa");
				}
			}
		}

		#endregion

		#region uint UsUarIoSUsUarIo

		private uint usUarIoSuSUarIo;
		[DebuggerNonUserCode]
		[Column(Storage = "usUarIoSuSUarIo", Name = "USUARIOS_USUARIO", DbType = "int unsigned", CanBeNull = false, Expression = null)]
		public uint UsUarIoSUsUarIo
		{
			get
			{
				return usUarIoSuSUarIo;
			}
			set
			{
				if (value != usUarIoSuSUarIo)
				{
					usUarIoSuSUarIo = value;
					OnPropertyChanged("UsUarIoSUsUarIo");
				}
			}
		}

		#endregion

	}
}
