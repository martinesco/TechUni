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
    class ImageAdapter : BaseAdapter
    {
        Context context;

        int[] thumbIds = {
             Resource.Drawable.sample_0,
             Resource.Drawable.sample_1,
             Resource.Drawable.sample_2,
             Resource.Drawable.sample_3,
             Resource.Drawable.sample_4,
             Resource.Drawable.sample_5,
             Resource.Drawable.sample_6,
             Resource.Drawable.sample_7,
             Resource.Drawable.sample_8,
             Resource.Drawable.sample_9,
             Resource.Drawable.sample_10,
             Resource.Drawable.sample_11
            };


        public ImageAdapter(Context c)
        {
            context = c;
        }

        public override int Count { get { return thumbIds.Length; } }

        public override Java.Lang.Object GetItem(int position)
        {
            return null;
        }

        public override long GetItemId(int position)
        {
            return 0;
        }

        public override View GetView(int position, View convertView, ViewGroup parent)
        {
            ImageView i = new ImageView(context);
            i.SetImageResource(thumbIds[position]);
#pragma warning disable CS0618 // Type or member is obsolete
            i.LayoutParameters = new Gallery.LayoutParams(750, 600);
#pragma warning restore CS0618 // Type or member is obsolete
            i.SetScaleType(ImageView.ScaleType.FitXy);
            return i;
        }
    }
}