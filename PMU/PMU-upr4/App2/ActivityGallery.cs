using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

namespace App2
{
    [Activity(Label = "ActivityGallery")]
    internal class ActivityGallery : Activity
    {
        Button back;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.Gallerypage);
            back = FindViewById<Button>(Resource.Id.button1);
#pragma warning disable CS0618 // Type or member is obsolete
            Gallery gallery = FindViewById<Gallery>(Resource.Id.gallery);
#pragma warning restore CS0618 // Type or member is obsolete

            gallery.Adapter = new ImageAdapter(this);
            gallery.ItemClick += delegate (object sender,
            Android.Widget.AdapterView.ItemClickEventArgs args) {
                Toast.MakeText(this, args.Position.ToString(), ToastLength.Short).Show();
            };
            back.Click += Back_Click;
        }

        private void Back_Click(object sender, EventArgs e)
        {
            StartActivity(typeof(MainActivity));
        }

    }
}