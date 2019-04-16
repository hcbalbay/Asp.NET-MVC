using Sinema.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sinema.Controllers
{
    public class BiletController : Controller
    {
        SinemaContext db = new SinemaContext();
        // GET: Bilet
        public ActionResult Index(int id)
        {
            Film f = db.Film.Where(x => x.filmID == id).SingleOrDefault();
            return View(f);
        }
    }
}