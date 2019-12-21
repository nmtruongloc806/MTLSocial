using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace mtlsocialapi.Models
{
    public class MTLSocialStoreDbSetting : IMTLSocialStoreDbSetting
    {
        public string UsersCollectionName { get; set; }
        public string ConnectionString { get; set; }
        public string DatabaseName { get; set; }
    }

    public interface IMTLSocialStoreDbSetting
    {
        string UsersCollectionName { get; set; }
        string ConnectionString { get; set; }
        string DatabaseName { get; set; }
    }
}
