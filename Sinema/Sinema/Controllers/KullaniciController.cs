using Sinema.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sinema.Controllers
{
    public class KullaniciController : Controller
    {
        SinemaContext db = new SinemaContext();
        // GET: Kullanici
        public ActionResult Index()
        {
            List<Kullanici> kullanicilar = db.Kullanici.ToList();
            return View(kullanicilar);
        }
        [HttpGet]
        public ActionResult Ekle()
        {
            var yetkiler = db.Yetki.ToList();
            ViewBag.Yetkiler = new SelectList(yetkiler,"yetkiID","ad");//(Liste,data olarak ne kullanacaz,text olarak ne gösterilecek)
            return View();
        }
        [HttpPost]
        public ActionResult Ekle(Kullanici k,HttpPostedFileBase resimGelen)
        {
                Bilet bilet = new Bilet();
                bilet.kullaniciID = k.kullaniciID;
                bilet.hediyebilet = 0;
                db.Bilet.Add(bilet);
            if(ModelState.IsValid == false)//validation hatası varsa
            {
                var yetkiler = db.Yetki.ToList();
                ViewBag.Yetkiler = new SelectList(yetkiler, "yetkiID", "ad");
                return View();
            }
            Kullanici kul = db.Kullanici.Where(x => x.mail == k.mail).SingleOrDefault();
            if(kul !=null)
            {//aynı epostalı kişi var
                ModelState.AddModelError("eposta", "Farklı bir eposta giriniz");
                var yetkiler = db.Yetki.ToList();
                ViewBag.Yetkiler = new SelectList(yetkiler, "yetkiID", "ad");
                return View();
            }

            ResimIslem r = new ResimIslem();
            if (resimGelen != null) {// Yeni kullanıcı eklerken kullanıcıya fotoğraf eklemezse default olarak kullanici.png.
            string deger = r.Ekle(resimGelen);
                if (deger == "uzanti")
                {
                    var yetkiler = db.Yetki.ToList();
                    ViewBag.Yetkiler = new SelectList(yetkiler, "yetkiID", "ad");
                    ViewBag.Hata = "Kullanıcı fotoğrafı .png veya .jpg uzantılı olmalı!";
                    return View();
                }
                else if (deger =="boyut")
                {
                    var yetkiler = db.Yetki.ToList();
                    ViewBag.Yetkiler = new SelectList(yetkiler, "yetkiID", "ad");
                    ViewBag.Hata = "Kullanıcı fotoğrafının boyutu 3 megabyte'tan fazla lütfen daha düşük boyutlu fotoğraf atınız!";
                    return View();
                }
                else
                {
                    k.resim = deger;
                }
            }
            else
            {
                k.resim = "kullanici.png";
            }
            
            db.Kullanici.Add(k);
            db.SaveChanges();
            ViewBag.Sonuc=k.ad + " " + k.soyad + " " + " kişisi eklenmiştir.";
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Sil(int id)
        {
            Kullanici k = db.Kullanici.Where(x => x.kullaniciID == id).SingleOrDefault();
            Bilet b = db.Bilet.Where(x => x.kullaniciID == id).SingleOrDefault();
            ResimIslem r = new ResimIslem();
            r.Sil(k.resim);
            db.Kullanici.Remove(k);
            db.Bilet.Remove(b);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Duzenle (int id)
        {
            Kullanici k = db.Kullanici.Where(x => x.kullaniciID == id).SingleOrDefault();
            var yetkiler = db.Yetki.ToList();
            //linkten olmayan kullanıcıya gitme kontrolü
            if (k == null)
            {
                return RedirectToAction("Index");
            }
            else
            { 
                ViewBag.Yetkiler = new SelectList(yetkiler, "yetkiID", "ad",k.yetkiID);//liste value gözüken kısım hangi ıdli seçili gelicek
                TempData["kullaniciID"]= id;
            }
            return View(k);
        }
        [HttpPost]
        public ActionResult Duzenle (Kullanici k,HttpPostedFileBase resimGelen)
        {
            int kullaniciID = (int)TempData["kullaniciID"];
            Kullanici kul = db.Kullanici.Where(x=> x.kullaniciID== kullaniciID).SingleOrDefault();
            if(ModelState.IsValid==false)
            {
                var yetkiler = db.Yetki.ToList();
                ViewBag.Yetkiler = new SelectList(yetkiler, "yetkiID", "ad", kul.yetkiID);
                return View(kul);
            }
            //resim boş mu ?
            if (resimGelen !=null)
            {
                ResimIslem r = new ResimIslem();
                string deger = r.Ekle(resimGelen);
                if (deger == "uzanti")
                {
                    var yetkiler = db.Yetki.ToList();
                    ViewBag.Yetkiler = new SelectList(yetkiler, "yetkiID", "ad",kul.yetkiID);
                    ViewBag.Hata = "Kullanıcı fotoğrafı .png veya .jpg uzantılı olmalı!";
                    return View(kul);
                }
                else if (deger == "boyut")
                {
                    var yetkiler = db.Yetki.ToList();
                    ViewBag.Yetkiler = new SelectList(yetkiler, "yetkiID", "ad",kul.yetkiID);
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
                if(kul.resim !="kullanici.png")
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
            kul.yetkiID = k.yetkiID;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult HediyeEkle(int id)
        {
            //Kullanici k = db.Kullanici.Where(x => x.kullaniciID == id).SingleOrDefault();
            Bilet b = db.Bilet.Where(x => x.kullaniciID == id).SingleOrDefault();
            if (b != null)
            {
                
            b.hediyebilet += 1;
            db.SaveChanges();
            }
            return RedirectToAction("Index");
        }
    }
}