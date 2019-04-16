using Sinema.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sinema.Controllers
{
    public class AnaSayfaController : Controller
    {
        SinemaContext db = new SinemaContext();
        // GET: AnaSayfa
        public ActionResult Index()
        {
            //Film f = db.Film.Where(x => x.filmID == 1).SingleOrDefault();
            //ViewBag.Filmler = db.Film.ToList();
            //return View(f);

            FilmDonguModelView gmv = new FilmDonguModelView();
            gmv.film = db.Film.Where(x => x.filmID == 1).SingleOrDefault();
            gmv.filmler= db.Film.ToList();
            gmv.oyuncu = db.Oyuncu.Where(x => x.oyuncuID == 1).SingleOrDefault();
            return View(gmv);
        }
        public ActionResult Fragman()
        {
            List<Film> filmler = db.Film.ToList();
            return View(filmler);
        }
        public ActionResult KullaniciProfil(int id)
        {
            Bilet b = db.Bilet.Where(x => x.kullaniciID == id).SingleOrDefault();
            return View(b);
        }
        public ActionResult KullaniciSil(int id)
        {   //Kullanıcı giriş yapmadan ve eğer girdiyse link üzerinden birisini silmesin diye sağlanan kontrol
            Kullanici k = db.Kullanici.Where(x => x.kullaniciID == id).SingleOrDefault();
            Bilet b = db.Bilet.Where(x => x.kullaniciID == id).SingleOrDefault();
            Kullanici kul = (Kullanici)Session["Kullanici"];
            if (kul == null)
            {
                return RedirectToAction("Index");
            }

            else if(kul.kullaniciID==id)
            {
                ResimIslem r = new ResimIslem();
                r.Sil(k.resim);
                db.Kullanici.Remove(k);
                db.Bilet.Remove(b);
                db.SaveChanges();
                Session.Abandon();
            }
            else
            {
                return RedirectToAction("Index");
            }
            
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult ProfilDuzenle(int id)
        {
            Kullanici k = db.Kullanici.Where(x => x.kullaniciID == id).SingleOrDefault();
            Kullanici kul = (Kullanici)Session["Kullanici"];
            if (kul == null)
            {
                return RedirectToAction("Index");
            }

            else if (kul.kullaniciID == id)
            {
                TempData["kullaniciID"] = id;
                return View(k);
            }
            else
            {
                return RedirectToAction("Index");
            }
        }
        [HttpPost]
        public ActionResult ProfilDuzenle(Kullanici k,HttpPostedFileBase resimGelen)
        {
            int kullaniciID = (int)TempData["kullaniciID"];
            Kullanici kul = db.Kullanici.Where(x => x.kullaniciID == kullaniciID).SingleOrDefault();
            if (resimGelen != null)
            {
                ResimIslem r = new ResimIslem();
                string deger = r.Ekle(resimGelen);
                if (deger == "uzanti")
                {
                    var yetkiler = db.Yetki.ToList();
                    ViewBag.Yetkiler = new SelectList(yetkiler, "yetkiID", "ad", kul.yetkiID);
                    ViewBag.Hata = "Kullanıcı fotoğrafı .png veya .jpg uzantılı olmalı!";
                    return View(kul);
                }
                else if (deger == "boyut")
                {
                    var yetkiler = db.Yetki.ToList();
                    ViewBag.Yetkiler = new SelectList(yetkiler, "yetkiID", "ad", kul.yetkiID);
                    ViewBag.Hata = "Kullanıcı fotoğrafının boyutu 3 megabyte'tan fazla lütfen daha düşük boyutlu fotoğraf atınız!";
                    return View(kul);
                }
                else
                {
                    k.resim = deger;
                }
            }

            if (k.resim != null)
            {
                if (kul.resim != "kullanici.png")
                {
                    new ResimIslem().Sil(kul.resim);
                    kul.resim = k.resim;
                }
                kul.resim = k.resim;
            }
            kul.ad = k.ad;
            kul.soyad = k.soyad;
            kul.mail = k.mail;
            kul.sifre = k.sifre;
            kul.telefon = k.telefon;
            db.SaveChanges();
            Session.Abandon();
            return RedirectToAction("Index");
        }

        public ActionResult Iletisim()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Iletisim(Iletisim iletisim)
        {
            iletisim.tarih = DateTime.Now;
            db.Iletisim.Add(iletisim);
            db.SaveChanges();

            string mesaj = "";
            mesaj = mesaj + "Gönderen Kişinin: <hr/>";
            mesaj = mesaj + "Ad: <b>" + iletisim.ad+ "&nbsp;&nbsp;" + iletisim.soyad + "</b> <br/>";
            mesaj = mesaj + "Eposta: <b>" + iletisim.eposta + "</b> <br/>";
            mesaj = mesaj + "Telefon: <b>" + iletisim.telefon + "</b> <br/><br/>";
            mesaj = mesaj + "Kullanıcının Mesajı: <hr/>";
            mesaj = mesaj + iletisim.mesaj;

            Eposta.Gonder(iletisim.konu,mesaj);

            ViewBag.Sonuc = "Mesajınızı Aldık Sizinle En Kısa Sürede İletişime Geçeceğiz.";
            return View();
        }
    }
    
}