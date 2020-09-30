using Otel.Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZXing;

namespace Otel.Controllers
{
    public class OdaController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();
        public ActionResult Index()
        {
            int sess = Convert.ToInt32(Session["userID"]);
            var odalar = db.Odas.Where(x => x.userID == sess).ToList();
            return View(odalar);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Oda oda)
        {
            int sess = Convert.ToInt32(Session["userID"]);
            try
            {
                var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                var stringChars = new char[16];
                var random = new Random();
                for (int i = 0; i < stringChars.Length; i++)
                {
                    stringChars[i] = chars[random.Next(chars.Length)];
                }
                var finalString = new String(stringChars);
                oda.qrHash = finalString;
                
                Console.WriteLine("finalString:" + finalString);
                oda.qrFoto = GenerateQRCode(oda.qrHash, oda.odaNo);
                oda.userID = sess;
                db.Odas.Add(oda);
                db.SaveChanges();                
            }
            catch(Exception ex)
            {

            }
            return RedirectToAction("Index", "Oda");
        }
        private string GenerateQRCode(string qrcodeText, string odano)
        {
            string folderPath = "~/Uploads/QrImage/";
            string imagePath = "~/Uploads/QrImage/"+ odano + ".jpeg";
            // If the directory doesn't exist then create it.
            if (!Directory.Exists(Server.MapPath(folderPath)))
            {
                Directory.CreateDirectory(Server.MapPath(folderPath));
            }

            var barcodeWriter = new BarcodeWriter();
            barcodeWriter.Format = BarcodeFormat.QR_CODE;
            Session["odahash"] = qrcodeText.ToString();
            Session["odano"] = odano.ToString();
            //var result = barcodeWriter.Write("www.ibernsoft.com.tr/qrhash="+ qrcodeText);
            var result = barcodeWriter.Write("https://localhost:44323/"+ qrcodeText);
            
            string barcodePath = Server.MapPath(imagePath);
            var barcodeBitmap = new Bitmap(result);
            using (MemoryStream memory = new MemoryStream())
            {
                using (FileStream fs = new FileStream(barcodePath, FileMode.Create, FileAccess.ReadWrite))
                {
                    barcodeBitmap.Save(memory, ImageFormat.Jpeg);
                    byte[] bytes = memory.ToArray();
                    fs.Write(bytes, 0, bytes.Length);
                }
            }
            return imagePath;
        }
        public ActionResult Read()
        {
            return View(ReadQRCode());
        }

        private Oda ReadQRCode()
        {
            Oda barcodeModel = new Oda();
            string barcodeText = "";
            string imagePath = "~/Uploads/QrImage/QrCode.jpg";
            string barcodePath = Server.MapPath(imagePath);
            var barcodeReader = new BarcodeReader();

            var result = barcodeReader.Decode(new Bitmap(barcodePath));
            if (result != null)
            {
                barcodeText = result.Text;
            }
            return new Oda() { odaNo = barcodeText, qrFoto = imagePath };
        }
        public JsonResult CheckOdaAvailability(string userdata)
        {
            System.Threading.Thread.Sleep(200);
            var SeachData = db.Odas.Where(x => x.odaNo == userdata).SingleOrDefault();
            if (SeachData != null)
            {
                return Json(1);
            }
            else
            {
                return Json(0);
            }

        }

        public JsonResult DeleteOdaRecord(int odaID)
        {
            bool result = false;
           Oda usr = db.Odas.SingleOrDefault(x => x.odaID == odaID);
            if (usr != null)
            {
                //db.Bildirims.Remove(usr);
                db.Odas.Remove(usr);
                db.SaveChanges();
                result = true;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }


    }
}