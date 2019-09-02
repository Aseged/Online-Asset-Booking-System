using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Security.Principal;
using System.Web.SessionState;

namespace AssetBookingSystem
{
    public class Global : System.Web.HttpApplication
    {
        //application start method will start the following jobs
        protected void Application_Start(object sender, EventArgs e)
        {
            JobScheduler.Start();
            JobScheduler2.Start();
            JobScheduler3.Start();
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }



        //---------------------------------------------------------------------//
        //---------------------------------------------------------------------//





        void Application_AuthenticateRequest(Object sender, EventArgs e)
        {
            String cookieName = FormsAuthentication.FormsCookieName;
            HttpCookie authCookie = Context.Request.Cookies[cookieName];

            if (null == authCookie)
            {//There is no authentication cookie.
                return;
            }

            FormsAuthenticationTicket authTicket = null;

            try
            {
                authTicket = FormsAuthentication.Decrypt(authCookie.Value);
            }
            catch
            {
                //Write the exception to the Event Log.
                return;
            }

            if (null == authTicket)
            {//Cookie failed to decrypt.
                return;
            }

            //When the ticket was created, the UserData property was assigned a
            //pipe-delimited string of group names.
            String[] groups = authTicket.UserData.Split(new char[] { '|' });

            //Create an Identity.
            GenericIdentity id = new GenericIdentity(authTicket.Name, "LdapAuthentication");

            //This principal flows throughout the request.
            GenericPrincipal principal = new GenericPrincipal(id, groups);

            Context.User = principal;

        }



        //---------------------------------------------------------------------//
        //---------------------------------------------------------------------//




















        //protected void Application_AuthenticateRequest(object sender, EventArgs e)
        //{

        //}

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}