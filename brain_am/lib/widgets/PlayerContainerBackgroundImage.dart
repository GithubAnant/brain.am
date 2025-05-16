import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
    required this.containerWidth,
    required this.containerHeight,
  });

  final double containerWidth;
  final double containerHeight;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: containerWidth,
        height: containerHeight,
        child: Image.asset(
          'assets/images/MusicPhotos1/04001_thepierofhanaleibay_2880x1800.jpg',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[800],
              child: const Center(
                child: Icon(Icons.music_note, color: Colors.white54, size: 80),
              ),
            );
          },
        ),
      ),
    );
  }
}


class BlackTint extends StatelessWidget {
  const BlackTint({
    super.key,
    required this.containerWidth,
    required this.containerHeight,
  });

  final double containerWidth;
  final double containerHeight;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: containerWidth,
        height: containerHeight,
        child: Positioned.fill(
          child: Container(color: Colors.black.withAlpha(180)),
        ),
      ),
    );
  }
}

// ignore: unused_element
final List<String> _imagePaths = [
  'assets/images/MusicPhotos1/0d3c6jon7mw11.jpg',
  'assets/images/MusicPhotos1/1vci7uth4vuc1.png',
  'assets/images/MusicPhotos1/3m90fxiwwfo61.png',
  'assets/images/MusicPhotos1/5l7zj92y0e771.jpg',
  'assets/images/MusicPhotos1/5sh7n01d9b311.jpg',
  'assets/images/MusicPhotos1/8ptxnpbe1g221.jpg',
  'assets/images/MusicPhotos1/27d4pr35gnvc1.png',
  'assets/images/MusicPhotos1/98r6m2rzza531.jpg',
  'assets/images/MusicPhotos1/03325_valleyofthestars_2880x1800.jpg',
  'assets/images/MusicPhotos1/03478_sandycay_2880x1800.jpg',
  'assets/images/MusicPhotos1/04001_thepierofhanaleibay_2880x1800.jpg',
  'assets/images/MusicPhotos1/04026_manlysunrise_2880x1800.jpg',
  'assets/images/MusicPhotos1/106481.jpg',
  'assets/images/MusicPhotos1/551537.jpg',
  'assets/images/MusicPhotos1/586388.jpg',
  'assets/images/MusicPhotos1/677357.png',
  'assets/images/MusicPhotos1/893848.png',
  'assets/images/MusicPhotos1/976156.png',
  'assets/images/MusicPhotos1/1245403.png',
  'assets/images/MusicPhotos1/1308922.jpg',
  'assets/images/MusicPhotos1/20220411_080811.jpg',
  'assets/images/MusicPhotos1/20220419_132620.jpg',
  'assets/images/MusicPhotos1/3257755954_2eb6e7c291_o.jpg',
  'assets/images/MusicPhotos1/33195910630_7f9777c021_o.jpg',
  'assets/images/MusicPhotos1/aerial-view-green-mountains-8k-dj.jpg',
  'assets/images/MusicPhotos1/altogether-lovely-iain-campbell-blog.jpg',
  'assets/images/MusicPhotos1/aniket-deole-294646-unsplash.jpg',
  'assets/images/MusicPhotos1/Black Forest Germany.jpg',
  'assets/images/MusicPhotos1/blue-moon-morning-5k-84.jpg',
  'assets/images/MusicPhotos1/brennan-burling-vpaHZEYx35U-unsplash.jpg',
  'assets/images/MusicPhotos1/El Capitan.jpg',
  'assets/images/MusicPhotos1/fire_kissed_water-wallpaper-1920x1080.jpg',
  'assets/images/MusicPhotos1/fpq3hk83h4e31.jpg',
  'assets/images/MusicPhotos1/FsKmARzXgAASlkN.jpeg',
  'assets/images/MusicPhotos1/Full-HD-Free-Wallpaper-7.jpg',
  'assets/images/MusicPhotos1/i4ulncmrre021.jpg',
  'assets/images/MusicPhotos1/IMG_3855.JPG',
  'assets/images/MusicPhotos1/IMG_4018.JPG',
  'assets/images/MusicPhotos1/index.jpg',
  'assets/images/MusicPhotos1/JbXSLOt.jpg',
  'assets/images/MusicPhotos1/joshua-sortino-xZqr8WtYEJ0-unsplash.jpg',
  'assets/images/MusicPhotos1/leafless-tree-on-brown-field-during-night-time-ep.jpg',
  'assets/images/MusicPhotos1/LyKTuqo.jpg',
  'assets/images/MusicPhotos1/jaws-beach-in-the-bahamas-5k-8g.jpg',
  'assets/images/MusicPhotos1/mountain_by_zim2687-d8g483o.jpg',
  'assets/images/MusicPhotos1/mountain-beautiful-forest-scenery-4k-wallpaper-uhdpaper.com-136@0@i.jpg',
  'assets/images/MusicPhotos1/mountains-near-grass-5k-ej.jpg',
  'assets/images/MusicPhotos1/nature-lake-scenery-aerial-view-spray-lakes-reservoir-canada-uhdpaper.com-4K-8.2854.jpg',
  'assets/images/MusicPhotos1/oniqjj41zyfb1.jpg',
  'assets/images/MusicPhotos1/pexels-akos-szabo-145938-440731.jpg',
  'assets/images/MusicPhotos1/Screenshot 2024-04-09 142541.png',
  'assets/images/MusicPhotos1/sea-sunset-clouds-sky-5k-zh.jpg',
  'assets/images/MusicPhotos1/simon-rae-418042-unsplash.jpg',
  'assets/images/MusicPhotos1/summer_dreams-wallpaper-2880x1800.jpg',
  'assets/images/MusicPhotos1/viqahhel6krc1.png',
  'assets/images/MusicPhotos1/waitin__by_zim2687-d79zuwb.jpg',
  'assets/images/MusicPhotos1/wallpaperflare.com_wallpaper.jpg',
  'assets/images/MusicPhotos1/Yosemite.jpg',
  'assets/images/MusicPhotos1/zintg9ln2uo81.png',
  'assets/images/MusicPhotos1/IMG_3978.JPG'
      'assets/images/MusicPhotos1/irgpvfmqhoa71.jpg',
];
