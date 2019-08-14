using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;

namespace WebAppOne.Pages
{
    public class EnvironmentModel : PageModel
    {
        public IConfiguration Configuration { get; set; }
        public List<KeyValuePair<string, string>> ConfigList { get; private set; }

        public EnvironmentModel(IConfiguration configuration)
        {
            Configuration = configuration;
        }
        public void OnGet()
        {
            ConfigList = Configuration.AsEnumerable().ToList();
        }
    }
}