using Sinema.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sinema.Controllers
{
    public class FilmController : Controller
    {
        SinemaContext db = new SinemaContext();
        // GET: Film
        public ActionResult Index()
        {
            List<Film> filmler = db.Film.ToList();
            return View(filmler);
        }
        public ActionResult Ekle()
        {
            var tur = db.Tur.ToList();
            var yas = db.YasGrup.ToList();
            ViewBag.Turler = new SelectList(tur, "turID", "ad");//(Liste,data olarak ne kullanacaz,text olarak ne gösterilecek)
            ViewBag.Yaslar = new SelectList(yas, "yasgrupID", "ad");
            return View();
        }
        [HttpPost]
        public ActionResult Ekle(Film f, HttpPostedFileBase resimGelen)
        {
            if (ModelState.IsValid == false)//validation hatası varsa
            {
                var tur = db.Tur.ToList();
                var yas = db.YasGrup.ToList();
                ViewBag.Turler = new SelectList(tur, "turID", "ad");
                ViewBag.Yaslar = new SelectList(yas, "yasgrupID", "ad");
                return View();
            }
            Film film = db.Film.Where(x => x.ad == f.ad).SingleOrDefault();
            if (film != null)
            {//aynı epostalı kişi var
                ModelState.AddModelError("filmad", "Aynı isimde film var farklı bir isim deneyiniz");
                var tur = db.Tur.ToList();
                var yas = db.YasGrup.ToList();
                ViewBag.Turler = new SelectList(tur, "turID", "ad");
                ViewBag.Yaslar = new SelectList(yas, "yasgrupID", "ad");
                return View();
            }
            ResimIslem r = new ResimIslem();
            string deger = r.Ekle(resimGelen);
            if (deger == "uzanti")
            {
                var tur = db.Tur.ToList();
                var yas = db.YasGrup.ToList();
                ViewBag.Turler = new SelectList(tur, "turID", "ad");//(Liste,data olarak ne kullanacaz,text olarak ne gösterilecek)
                ViewBag.Yaslar = new SelectList(yas, "yasgrupID", "ad");
                ViewBag.Hata = "Film fotoğrafı .png veya .jpg uzantılı olmalı!";
                return View();
            }
            else if (deger == "boyut")
            {
                var tur = db.Tur.ToList();
                var yas = db.YasGrup.ToList();
                ViewBag.Turler = new SelectList(tur, "turID", "ad");//(Liste,data olarak ne kullanacaz,text olarak ne gösterilecek)
                ViewBag.Yaslar = new SelectList(yas, "yasgrupID", "ad");
                ViewBag.Hata = "Film fotoğrafının boyutu 3 megabyte'tan fazla lütfen daha düşük boyutlu fotoğraf atınız!";
                return View();
            }
            else
            {
                f.resim = deger;
            }
            db.Film.Add(f);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Sil(int id)
        {
            Film f = db.Film.Where(x => x.filmID == id).SingleOrDefault();
            ResimIslem r = new ResimIslem();
            r.Sil(f.resim);
            db.Film.Remove(f);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Duzenle(int id)
        {
            Film f = db.Film.Where(x => x.filmID == id).SingleOrDefault();
            var tur = db.Tur.ToList();
            var yas = db.YasGrup.ToList();
           
            //linkten olmayan kullanıcıya gitme kontrolü
            if (f == null)
            {
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.Turler = new SelectList(tur, "turID", "ad", f.turID);
                ViewBag.Yaslar = new SelectList(yas, "yasgrupID", "ad", f.yasgrupID);
                TempData["filmID"] = id;
            }
            return View(f);
        }
        [HttpPost]
        public ActionResult Duzenle (Film f, HttpPostedFileBase resimGelen)
        {
            int filmID = (int)TempData["filmID"];
            Film film = db.Film.Where(x=> x.filmID == filmID).SingleOrDefault();

            if(resimGelen !=null)
            {
                ResimIslem r = new ResimIslem();
                string deger = r.Ekle(resimGelen);
                if (deger == "uzanti")
                {
                    var tur = db.Tur.ToList();
                    var yas = db.YasGrup.ToList();
                    ViewBag.Turler = new SelectList(tur, "turID", "ad",film.turID);
                    ViewBag.Yaslar = new SelectList(yas, "yasgrupID", "ad",film.yasgrupID);
                    ViewBag.Hata = "Film fotoğrafı .png veya .jpg uzantılı olmalı!";
                    return View(film);
                }
                else if (deger == "boyut")
                {
                    var tur = db.Tur.ToList();
                    var yas = db.YasGrup.ToList();
                    ViewBag.Turler = new SelectList(tur, "turID", "ad",film.turID);
                    ViewBag.Yaslar = new SelectList(yas, "yasgrupID", "ad",film.yasgrupID);
                    ViewBag.Hata = "Film fotoğrafının boyutu 3 megabyte'tan fazla lütfen daha düşük boyutlu fotoğraf atınız!";
                    return View(film);
                }
                else
                {
                    f.resim = deger;
                }
            }
            if (f.resim != null)
            {
                if (film.resim != "film.png")
                {
                    new ResimIslem().Sil(film.resim);
                    film.resim = f.resim;
                }
                film.resim = f.resim;
            }
            film.ad = f.ad;
            film.aciklama = f.aciklama;
            film.vizyontarih = f.vizyontarih;
            film.seans = f.seans;
            film.salon = f.salon;
            film.yasgrupID = f.yasgrupID;
            film.turID = f.turID;
            film.fragman = f.fragman;
            film.yonetmen = f.yonetmen;
            db.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}