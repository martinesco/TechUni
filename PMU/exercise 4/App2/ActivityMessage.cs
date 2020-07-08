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
    [Activity(Label = "ActivityMessage")]
    public class ActivityMessage : Activity
    {
        TextView Message;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.Message);
            Message = FindViewById<TextView>(Resource.Id.textMessage);
            Message.Text = "Котките са специално избрани";
        }
    }
}