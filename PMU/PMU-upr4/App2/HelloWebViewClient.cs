using Android.Webkit;

namespace App2
{
    public class HelloWebViewClient : WebViewClient
    {
#pragma warning disable CS0672 // Member overrides obsolete member
        public override bool ShouldOverrideUrlLoading(WebView view, string url)
#pragma warning restore CS0672 // Member overrides obsolete member
        {
            view.LoadUrl(url);
            return false;
        }
    }
}