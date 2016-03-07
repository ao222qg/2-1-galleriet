using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gallery
{
    public partial class Default : System.Web.UI.Page
    {
        private Gallery _gallery;

        public Gallery Gallery
        {
            get
            {
                return _gallery ?? (_gallery = new Gallery());
            }
        }
       
        protected void Page_Load(object sender, EventArgs e)
        {
            string ImagePath = Request.QueryString["name"];

            if(ImagePath != null)
            {
               LargeImage.ImageUrl = "../Content/Images/" + ImagePath;
            }
            LargeImage.Visible = true;

        }

        public IEnumerable<string> Repeater_GetData()
        {
            return Gallery.GetImageNames();
        }

        protected void UpploadButton_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                try
                {
                    Session["FileName"] = Gallery.SaveImage(FileUpload.FileContent, FileUpload.FileName);
                    Session["UploadSuccess"] = true;
                    Response.Redirect("http://localhost:50168/Default.aspx?name=" + Session["FileName"]);
                   
                }

                catch
                {
                    CustomValidator customvalidator = new CustomValidator();
                    customvalidator.IsValid = false;
                    customvalidator.ErrorMessage = "Validation Error!";
                    Page.Validators.Add(customvalidator);
                }

                }
            
            }
 
     }

}