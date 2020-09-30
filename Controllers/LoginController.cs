using Otel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Otel.Controllers
{
    public class LoginController : Controller
    {

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public JsonResult Login(User model)
        {
            string result = "Fail";

            using (var db = new OtelQrEntities())
            {
                var DataItem = db.Users.Where(x => x.username == model.username && x.password == model.password).SingleOrDefault();
                if (DataItem != null)
                {
                    Session["userID"] = DataItem.userID.ToString();
                    Session["username"] = DataItem.username.ToString();
                    Session["userYetkiID"] = DataItem.yetkiID;
                    result = "Success";
                }
            }
          
            return Json(result, JsonRequestBehavior.DenyGet);
        }
        public ActionResult Logout()
        {
            Session.Clear();
            Session.Abandon();
            return RedirectToAction("../Home/Index");
        }
    }
}