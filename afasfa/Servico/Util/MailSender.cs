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
        public static void EnviarEMail(string to, string assunto, string corpo)
        {
            //Cria objeto de mensagem de email
            MailMessage _message = new MailMessage();
            _message.To.Add(to);
            _message.Subject = assunto;
            _message.Body = corpo;
            Enviar(_message);
        }

        public static void EnviarEMailHTML(string to, string assunto, string corpo)
        {
            //Cria objeto de mensagem de email
            MailMessage _message = new MailMessage();
            _message.To.Add(to);
            _message.IsBodyHtml = true;
            _message.Subject = assunto;
            _message.Body = corpo;
            Enviar(_message);
        }

        public static void Enviar(MailMessage message)
        {
            SmtpClient _smtp = new SmtpClient();
            _smtp.EnableSsl = true;
            _smtp.Send(message);
        }
    }
}
