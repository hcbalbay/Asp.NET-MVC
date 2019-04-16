using Sinema.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sinema
{
    public class _SecurityFilter:ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            string ControllerName = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName;
            if (HttpContext.Current.Session["Kullanici"] == null && (ControllerName != "Login") && (ControllerName != "AnaSayfa"))
            {
                filterContext.Result = new RedirectResult("/Login/Index");
            }
            if (HttpContext.Current.Session["Kullanici"] != null )
            {
                Kullanici k = (Kullanici)HttpContext.Current.Session["Kullanici"];
                if(k.yetkiID !=1 && (ControllerName == "Home" || ControllerName == "Profil" || ControllerName == "Bilet" || ControllerName == "Film" || ControllerName == "Kullanici" || ControllerName == "Oyuncu"))
                {
                    filterContext.Result = new RedirectResult("/Anasayfa/Index");
                    return;
                }
            }
            base.OnActionExecuting(filterContext);
        }
    }
}