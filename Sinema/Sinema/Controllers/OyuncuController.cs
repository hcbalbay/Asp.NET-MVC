using Sinema.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sinema.Controllers
{
    public class OyuncuController : Controller
    {
        SinemaContext db = new SinemaContext();
        // GET: Oyuncu
        public ActionResult Index()
        {
            List<Oyuncu> oyuncular = db.Oyuncu.ToList();
            return View(oyuncular);
        }
        public ActionResult Ekle()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Ekle(Oyuncu o, HttpPostedFileBase resimGelen)
        {
            if (ModelState.IsValid == false)//validation hatası varsa
            {
                return View();
            }

            ResimIslem r = new ResimIslem();
            string deger = r.Ekle(resimGelen);
            if (deger == "uzanti")
            {
                ViewBag.Hata = "Oyuncu fotoğrafı .png veya .jpg uzantılı olmalı!";
                return View();
            }
            else if (deger == "boyut")
            {
                ViewBag.Hata = "Oyuncu fotoğrafının boyutu 3 megabyte'tan fazla lütfen daha düşük boyutlu fotoğraf atınız!";
                return View();
            }
            else
            {
                o.resim = deger;
            }
            db.Oyuncu.Add(o);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Sil(int id)
        {
            Oyuncu o = db.Oyuncu.Where(x => x.oyuncuID == id).SingleOrDefault();
            ResimIslem r = new ResimIslem();
            r.Sil(o.resim);
            db.Oyuncu.Remove(o);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Duzenle(int id)
        {
            Oyuncu o = db.Oyuncu.Where(x => x.oyuncuID == id).SingleOrDefault();

            //linkten olmayan kullanıcıya gitme kontrolü
            if (o == null)
            {
                return RedirectToAction("Index");
            }
            else
            {
                TempData["oyuncuID"] = id;
            }
            return View(o);
        }
        [HttpPost]
        public ActionResult Duzenle (Oyuncu o,HttpPostedFileBase resimGelen)
        {
            int oyuncuID = (int)TempData["oyuncuID"];
            Oyuncu oyuncu = db.Oyuncu.Where(x => x.oyuncuID == oyuncuID).SingleOrDefault();
            if(resimGelen!= null)
            {
                ResimIslem r = new ResimIslem();
                string deger = r.Ekle(resimGelen);
                if (deger == "uzanti")
                {
                    ViewBag.Hata = "Oyuncu fotoğrafı .png veya .jpg uzantılı olmalı!";
                    return View(oyuncu);
                }
                else if (deger == "boyut")
                {
                    ViewBag.Hata = "Oyuncu fotoğrafının boyutu 3 megabyte'tan fazla lütfen daha düşük boyutlu fotoğraf atınız!";
                    return View(oyuncu);
                }
                else
                {
                    o.resim = deger;
                }
            }
            if (o.resim != null)
            {
                if (oyuncu.resim != "oyuncu.png")
                {
                    new ResimIslem().Sil(oyuncu.resim);
                    oyuncu.resim = o.resim;
                }
                oyuncu.resim = o.resim;
            }

            oyuncu.ad = o.ad;
            oyuncu.soyad = o.soyad;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}