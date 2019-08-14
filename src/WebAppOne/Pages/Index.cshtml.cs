using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace WebAppOne.Pages
{
    public class IndexModel : PageModel
    {
      
        public HttpRequest Request { get; set; }
        public IndexModel( )
        {
           
        }
        public void OnGet()
        {
            Request = HttpContext.Request;
        }
    }
}
