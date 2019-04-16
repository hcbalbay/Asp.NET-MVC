using Sinema.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sinema
{
    public class FilmDonguModelView
    {
        public FilmDonguModelView()
        {
            film = new Film();
            filmler = new List<Film>();
            oyuncu = new Oyuncu();

        }
        public Film film { get; set; }
        public List<Film> filmler { get; set; }
        public Oyuncu oyuncu { get; set; }
    }
}