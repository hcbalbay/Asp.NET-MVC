using Sinema.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sinema.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            SinemaContext db = new SinemaContext();
            List<Kullanici> kullanicilar = db.Kullanici.ToList();
            return View(kullanicilar);
        }
    }
}