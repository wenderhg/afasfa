﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;
using AFASFA.acesso_dados;

namespace Servico.Seguranca
{
    /// <summary>
    /// Classe de seguranca ou método referente a usuario e senha
    /// </summary>
    public class Seguranca
    {
        /// <summary>
        /// Retorna a senha criptografada
        /// </summary>
        /// <param name="senha">senha</param>
        /// <returns>string da senha criptografada</returns>
        public static string RetornaSenha(string senha)
        {
            string result = string.Empty;
            //Encontra na senha algum número
            int pos = RetornaPrimeiroNumero(senha);
            //se o numero for par gera o hash utilizando o algoritmo MD5
            if ((pos % 2) == 0)
            {
                result = GeraHashDigest(senha, HashMethod.MD5);
            }
            else //Se for impar faz utilizando o SHA1
            {
                result = GeraHashDigest(senha, HashMethod.SHA1);
            }

            //Encontra na senha algum número
            pos = RetornaPrimeiroNumero(result);

            //Se achar um numero
            if (pos != int.MinValue)
            {
                //Pega parte do hash para gerar outro que será o real
                return GeraHashDigest(String.Concat(senha, result.Substring(pos, pos), result), HashMethod.SHA384);
            }
            else
            {
                throw new Exception("Senha deve conter números.");
            }
        }

        /// <summary>
        /// Retorna primeiro numero que achar
        /// </summary>
        /// <param name="texto">texto</param>
        /// <returns>int</returns>
        private static int RetornaPrimeiroNumero(string texto)
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

        enum HashMethod { MD5, SHA1, SHA384 }
        /// <summary>
        /// Retorna Hash utilizando o texto passado e o algoritmo informado
        /// </summary>
        /// <param name="fonte">texto</param>
        /// <param name="algorithm">Algoritmo</param>
        /// <returns>Hash</returns>
        private static string GeraHashDigest(string fonte, HashMethod algorithm)
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

        /// <summary>
        /// Retorna se o login é valido
        /// </summary>
        /// <param name="usuario"></param>
        /// <param name="senha"></param>
        /// <returns></returns>
        public static bool LoginValido(string usuario, string senha)
        {
            int _result = SegurancaAD.Instance.RetornaUsuarioSenha(usuario, RetornaSenha(senha));
            return _result == 1;
        }
    }
}
