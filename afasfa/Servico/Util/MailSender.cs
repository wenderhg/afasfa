using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;
using System.Net;

namespace Servico.Util
{
    /// <summary>
    /// Classe responsável por enviar email
    /// </summary>
    public class MailSender
    {
        /// <summary>
        /// Host para envio do email
        /// </summary>
        public static string Host { get; set; }
        /// <summary>
        /// Port para envio do email
        /// </summary>
        public static int Port { get; set; }
        /// <summary>
        /// Usuario para envio do email
        /// </summary>
        public static string Usuario { get; set; }
        /// <summary>
        /// Senha para envio do email
        /// </summary>
        public static string Senha { get; set; }

        public static bool EnviarEMail(string to, string assunto, string corpo)
        {
            //Cria objeto de mensagem de email
            MailMessage _message = new MailMessage();
            _message.To.Add(to);
            _message.Subject = assunto;
            _message.Body = corpo;
            SmtpClient _smtp = new SmtpClient();
            _smtp.EnableSsl = true;
            //_smtp.Credentials = new NetworkCredential(Usuario, Senha);
            _smtp.Send(_message);
            return true;
        }
    }
}
