using Android.App;
using Android.OS;
using Android.Support.V7.App;
using Android.Runtime;
using Android.Widget;

namespace App2
{
    [Activity(Label = "@string/app_name", Theme = "@style/AppTheme", MainLauncher = true)]
    public class MainActivity : AppCompatActivity
    {
        Button GalleryB;
        Button WebViewB;
        Button PaintB;
        Button MessageB;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.activity_main);
            GalleryB = FindViewById<Button>(Resource.Id.GalleryBUT);
            WebViewB = FindViewById<Button>(Resource.Id.WebViewBUT);
            PaintB = FindViewById<Button>(Resource.Id.PaintBUT);
            MessageB = FindViewById<Button>(Resource.Id.MessageBUT);
            GalleryB.Click += GalleryB_Click;
            WebViewB.Click += WebViewB_Click;
            PaintB.Click += PaintB_Click;
            MessageB.Click += Message_Click;
        }

        private void PaintB_Click(object sender, System.EventArgs e)
        {
            StartActivity(typeof(ActivityPaint));
        }
        private void GalleryB_Click(object sender, System.EventArgs e)
        {
            StartActivity(typeof(ActivityGallery));
        }
        private void WebViewB_Click(object sender, System.EventArgs e)
        {
            StartActivity(typeof(ActivityWebView));
        }
        private void Message_Click(object sender, System.EventArgs e)
        {
            StartActivity(typeof(ActivityMessage));
        }
    }
}