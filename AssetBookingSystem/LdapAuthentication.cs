using System;
using System.Text;
using System.Collections;
using System.DirectoryServices;

namespace FormsAuth
{
    //authentication aginest AD using LDAP
    public class LdapAuthentication
    {
        //declare string var
        private string _path;
        private string _filterAttribute;

        public LdapAuthentication(string path)
        {
            _path = path;
          
        }

        public bool IsAuthenticated(string domain, string username, string pwd)
        {
            string domainAndUsername = domain + @"\" + username;
            DirectoryEntry entry = new DirectoryEntry(_path, domainAndUsername, pwd);

            try
            {
                //Bind to the native AdsObject to force authentication.
                object obj = entry.NativeObject;

                DirectorySearcher search = new DirectorySearcher(entry);

                search.Filter = "(SAMAccountName=" + username + ")";
                search.PropertiesToLoad.Add("cn");
                SearchResult result = search.FindOne();

                if (null == result)
                {
                    return false;
                }

                //Update the new path to the user in the directory.
                _path = result.Path;
                _filterAttribute = (string)result.Properties["cn"][0];
            }
            catch (Exception ex)
            {
                throw new Exception("Error authenticating user. " + ex.Message);
            }

            return true;
        }

        public string GetGroups()
        {

            // handling authenticatin against an LDAP server other than local AD domain
            DirectoryEntry deSearchRoot = new DirectoryEntry(_path);
            DirectorySearcher search = new DirectorySearcher(deSearchRoot);

            search.Filter = "(cn=" + _filterAttribute + ")";
            search.PropertiesToLoad.Add("memberOf");
            StringBuilder groupNames = new StringBuilder();

            try
            {
                SearchResult result = search.FindOne();
                int propertyCount = result.Properties["memberOf"].Count;

                string dn = null;
                int equalsIndex = 0;
                int commaIndex = 0;

                int propertyCounter = 0;

                for (propertyCounter = 0; propertyCounter <= propertyCount - 1; propertyCounter++)
                {
                    dn = Convert.ToString(result.Properties["memberOf"][propertyCounter]);

                    equalsIndex = dn.IndexOf("=", 1);
                    commaIndex = dn.IndexOf(",", 1);
                    if ((equalsIndex == -1))
                    {
                        return null;
                    }

                    groupNames.Append(dn.Substring((equalsIndex + 1), (commaIndex - equalsIndex) - 1));
                    groupNames.Append("|");
                }

            }
            catch (Exception ex)
            {
                throw new Exception("Error obtaining group names. " + ex.Message);
            }

            return groupNames.ToString();
        }
        
        internal bool IsAuthenticated(string p1, string p2)
        {
            throw new NotImplementedException();
        }
    }
}
