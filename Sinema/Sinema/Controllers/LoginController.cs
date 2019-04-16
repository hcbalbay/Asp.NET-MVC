using Sinema.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sinema.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        
        [HttpPost]
        public ActionResult Index(string email, string sifre)
        {
            SinemaContext db = new SinemaContext();
            Yetki y = new Yetki();
            Kullanici k = db.Kullanici.Where(x => x.mail == email && x.sifre == sifre).SingleOrDefault();
            if (k == null)
            {
                //bulanamadı
                ViewBag.Uyari = "Kullanici Bulunamadı!";
            }
            else
            {
                //bulundu
                //eğer kullanıcı yönetici ise RedirectToAction --> Admin paneli else ana template
                Session["Kullanici"] = k;
                return RedirectToAction("Index","Home");
            }
            return View();
        }

        public ActionResult Cikis()
        {
            Session.Abandon();
            return RedirectToAction("Index","AnaSayfa");
        }
        public ActionResult UyeOl()
        {
            return View();
        }
        
        [HttpPost]
        public ActionResult UyeOl (Kullanici k)
        {
            Bilet bilet = new Bilet();
            SinemaContext db = new SinemaContext();
            Kullanici kul = db.Kullanici.Where(x => x.mail == k.mail).SingleOrDefault();
            if(kul !=null)
            {
                ViewBag.Hata = "Aynı eposta ile bir hesap var isterseniz şifremi unuttuma tıklayabilirsiniz.";
                return View();
            }
            else
            {
            if(k.yetkiID==null && k.resim==null)
            {
                k.resim = "kullanici.png";
                k.yetkiID = 2;
            }

            db.Kullanici.Add(k);
            db.SaveChanges();
            bilet.kullaniciID = k.kullaniciID;
            bilet.hediyebilet = 0;
            db.Bilet.Add(bilet);
            db.SaveChanges();
            }
            ViewBag.Mesaj = "Hesabınız Başarı ile Oluşturuldu.";
            return RedirectToAction("Index");

        }
        [HttpGet]
        public ActionResult SifremiUnuttum()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SifremiUnuttum(string email)
        {
            SinemaContext db = new SinemaContext();
            Kullanici k = db.Kullanici.Where(x => x.mail == email).SingleOrDefault();
            if (k != null)
            {
                //string yeniSifre = new Random().Next(100000,999999).ToString();
                //db.SaveChanges();
                //string konu = "Şifre Hatırlatma";
                //string mesaj = "Şifreniz: " + k.sifre;
                //Eposta.Gonder(k.mail,konu,mesaj);
                //ViewBag.Mesaj = "Epostanıza Şifreniz Gönderilmiştir.";

                Sifre s = new Sifre();
                s.kullaniciID = k.kullaniciID;
                s.tarih = DateTime.Now;
                s.kod = Guid.NewGuid();
                db.Sifre.Add(s);
                db.SaveChanges();
                string konu = "Şifre Sıfırlama";
                string mesaj = "Şifrenizi sıfırlamak için <a href='http://localhost:8811/Login/SifreSifirla?kod="+ s.kod +"'>tıklayınız" ;
                Eposta.Gonder(konu, mesaj, k.mail);
                ViewBag.Mesaj = "Epostanıza Şifreniz Gönderilmiştir.";
            }
            else
            {
                ViewBag.Mesaj = "Böyle Bir Eposta Bulunamadı!";
            }
            return View();
        }
        [HttpGet]
        public ActionResult SifreSifirla(string kod)
        {
            SinemaContext db = new SinemaContext();
            Sifre s = db.Sifre.Where(x => x.kod.ToString() == kod).SingleOrDefault();
            if (s == null)
            {
                return RedirectToAction("SifremiUnuttum");
            }
            Kullanici k = db.Kullanici.Where(x => x.kullaniciID == s.kullaniciID).SingleOrDefault();
            return View(k);
        }
        [HttpPost]
        public ActionResult SifreSifirla(string yenisifre, string sifreonay , int kullaniciID)
        {
            SinemaContext db = new SinemaContext();
            Kullanici k = db.Kullanici.Where(x=> x.kullaniciID == kullaniciID).SingleOrDefault();
            if (yenisifre != sifreonay)
            {
                ViewBag.Uyari = "Şifreler Eşleşmiyor Lütfen Kontrol Ediniz!";
                return View(k);
            }
            else
            {
                if(sifreonay == k.sifre)
                {
                    ViewBag.Uyari = "Şifre Eski Şifreniz ile Aynı Olamaz!";
                    return View(k);
                }
                k.sifre = sifreonay;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
               
        }
        }
}