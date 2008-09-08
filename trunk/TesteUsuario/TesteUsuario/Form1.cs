using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Security.Cryptography;
using MySql.Data.MySqlClient;
using linq.afasfa;

namespace TesteUsuario
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            txtHash1.Text = RetornaSenha(txtSenha.Text);
        }

        public string RetornaSenha(string senha)
        {
            string result = string.Empty;
            int pos = RetornaPrimeiroNumero(senha);
            if ((pos % 2) == 0)
            {
                result = GeraHashDigest(senha, HashMethod.MD5);
            }
            else
            {
                result = GeraHashDigest(senha, HashMethod.SHA1);
            }

            pos = RetornaPrimeiroNumero(result);

            if (pos != int.MinValue)
            {
                return GeraHashDigest(result.Substring(pos, pos), HashMethod.SHA384);
            }
            else
            {
                throw new Exception("Senha sem dígitos");
            }
        }

        private int RetornaPrimeiroNumero(string texto)
        {
            for (int cont = 0; cont < texto.Length; cont++)
            {
                if (Char.IsNumber(texto[cont]))
                {
                    return Convert.ToInt16(texto[cont].ToString());
                }
            }
            return int.MinValue;
        }

        private enum HashMethod { MD5, SHA1, SHA384 }

        private string GeraHashDigest(string fonte, HashMethod algorithm)
        {
            HashAlgorithm hashClass = null;
            switch (algorithm)
            {
                case HashMethod.MD5:
                    hashClass = new MD5CryptoServiceProvider();
                    break;
                case HashMethod.SHA1:
                    hashClass = new SHA1CryptoServiceProvider();
                    break;
                case HashMethod.SHA384:
                    hashClass = new SHA384Managed();
                    break;
                default:
                    // Error case.
                    break;
            }

            byte[] byteValue = Encoding.UTF8.GetBytes(fonte);
            byte[] hashValue = hashClass.ComputeHash(byteValue);

            return Convert.ToBase64String(hashValue);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            MySqlConnection _conn = new MySqlConnection("server=localhost;user id=root;database=afasfa");
            AfAsFa afasfadb = new AfAsFa(_conn);
            var _doacoes = from c in afasfadb.DoaCOeS
                           select c;
            foreach (var doacao in _doacoes)
            {
                this.listBox1.Items.Add(String.Format("Nome: {0} - Email: {1}", doacao.Nome, doacao.Email));
            }
        }

    }
}
