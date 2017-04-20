﻿using System;
using System.Collections.Generic;
using System.Text;
using Xamarin.Forms;

namespace AdaptiveCards.Rendering
{
    public static class ImageExtensions
    {
        public static void SetSource(this Xamarin.Forms.Image image, string url, RenderContext context)
        {
            if (string.IsNullOrWhiteSpace(url))
                return;
            image.SetSource(new Uri(url));
        }

        public static void SetBackgroundSource(this Xamarin.Forms.Grid grid, string url, RenderContext context)
        {
            if (string.IsNullOrWhiteSpace(url))
                return;
            grid.SetBackgroundImage(new Uri(url));
        }

        public static void SetImageProperties(this Xamarin.Forms.Image imageview, Image image, RenderContext context)
        {
            switch (image.Size)
            {
                case ImageSize.Auto:
                case ImageSize.Stretch:
                    imageview.VerticalOptions = LayoutOptions.FillAndExpand;
                    imageview.HorizontalOptions = LayoutOptions.FillAndExpand;
                    break;
                case ImageSize.Small:
                    imageview.WidthRequest = context.Options.ImageSizes.Small;
                    imageview.HeightRequest = context.Options.ImageSizes.Small;
                    break;
                case ImageSize.Medium:
                    imageview.WidthRequest = context.Options.ImageSizes.Medium;
                    imageview.HeightRequest = context.Options.ImageSizes.Medium;
                    break;
                case ImageSize.Large:
                    imageview.WidthRequest = context.Options.ImageSizes.Large;
                    imageview.HeightRequest = context.Options.ImageSizes.Large;
                    break;
            }
        }
    }
}