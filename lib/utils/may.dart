import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Photo(),
  ));
}

class Photo extends StatefulWidget {
  const Photo({Key? key}) : super(key: key);

  @override
  State<Photo> createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  final urlImage = [
    "https://www.shutterstock.com/image-illustration/3d-render-abstract-multicolor-spectrum-260nw-1911508255.jpg",
    "https://www.shutterstock.com/image-illustration/3d-render-abstract-multicolor-spectrum-260nw-1911508255.jpg",
    "https://www.shutterstock.com/image-illustration/3d-render-abstract-multicolor-spectrum-260nw-1911508255.jpg",
    "https://www.shutterstock.com/image-illustration/3d-render-abstract-multicolor-spectrum-260nw-1911508255.jpg",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: Ink.image(
            image: NetworkImage(urlImage.first),
            height: 30,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GalleryWidget(
                  urlImage: urlImage,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class GalleryWidget extends StatefulWidget {
  final List<String> urlImage;

  const GalleryWidget({Key? key, required this.urlImage}) : super(key: key);

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoViewGallery.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.urlImage.length,
        builder: (context, index) {
          final urlImage = widget.urlImage[index];
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(urlImage),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.contained*4,
          );
        },
      ),
    );
  }
}