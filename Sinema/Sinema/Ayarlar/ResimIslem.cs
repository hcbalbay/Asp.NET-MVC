using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;

namespace Sinema
{
    public class ResimIslem
    {
        public string Ekle(HttpPostedFileBase asilResim)
        {
            string uzanti = Path.GetExtension(asilResim.FileName);
            if(!(uzanti ==".png" || uzanti==".jpg" ))
            {
                return "uzanti";
            }
            if(asilResim.ContentLength> 3145728)//3mb'tan büyük mü kontrolü
            {
                return "boyut";
            }
            string resimAdi = Guid.NewGuid().ToString() + uzanti;
            Bitmap res = new Bitmap(Image.FromStream(asilResim.InputStream)); //resim üzerinde işlem yapmak için bitmape çeviriyoruz.
            res.Save(HttpContext.Current.Server.MapPath("/Content/Resimler/"+resimAdi));
            return resimAdi;
        }
        public string Sil (string resimAd)
        {
            if (resimAd != "kullanici.png" && resimAd != "oyuncu.png" && resimAd != "film.png")
            {
                string yol = HttpContext.Current.Server.MapPath("/Content/Resimler/"+resimAd);
                if(System.IO.File.Exists(yol))//Burda böyle bir dosya var mı yok mu onun kontrolü
                {
                    System.IO.File.Delete(yol);
                }
                else
                {
                    return "Dosya Bulunamadı";
                }
            }
            return "";
        }
    }
}