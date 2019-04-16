using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace Sinema
{
    public class Eposta
    {
        public static bool Gonder(string konu, string mesaj, string gidecekEposta="halukcanbalbay@hotmail.com" )
        {
            try
            {
            MailMessage email = new MailMessage();
            SmtpClient smtp = new SmtpClient();
            string gonderenEposta = "testsinema@hotmail.com";
            string gonderenSifre = "S3QSz11Q";
            smtp.Credentials = new System.Net.NetworkCredential(gonderenEposta,gonderenSifre);
            smtp.Port = 587;
            smtp.Host= "smtp-mail.outlook.com";
            smtp.EnableSsl = true;//Outlook için false olunca mail gönderilmiyor

            email.IsBodyHtml = true;// gönderilecek mesaj html etiketlerinden oluşacak mı ?
            email.From = new MailAddress(gonderenEposta);
            email.To.Add(gidecekEposta);
            email.Subject = konu;
            email.Body = mesaj;

            smtp.Send(email);

            return true;

            }
            catch (Exception)
            {

                return false;
            }
            
        }
    }
}