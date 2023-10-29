import 'package:flutter/material.dart';
import 'Natural attraction.dart';
import 'Food and drink attraction.dart';
import 'Cultural attraction.dart';
import 'religious attraction.dart';
import 'package:exhange_rates_flutter/A holiday event.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PhotoGallery(),));
}
class PhotoGallery extends StatefulWidget {
  const PhotoGallery({Key? key}) : super(key: key);

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('PhotoGallery'),
      ),
      body: ListView(
        children:<Widget>[GestureDetector(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> FirstPage()),);
        },
            child: Column(
              children: <Widget>[
                Image.network("https://www.shutterstock.com/image-illustration/3d-render-abstract-multicolor-spectrum-260nw-1911508255.jpg"),
                Text('Natural attractions: These include natural wonders like waterfalls, mountains, beaches, and national parks.',
                  style: TextStyle(fontSize: 18),)
              ],
            )
        ),
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ThreePage()),);
              },
              child: Column(
                children: <Widget>[
                  Image.network("https://www.shutterstock.com/image-illustration/3d-render-abstract-multicolor-spectrum-260nw-1911508255.jpg"),
                  Text(' Cultural attractions: These include museums, art galleries, historical sites, and monuments.',
                    style: TextStyle(fontSize: 18),)
                ],
              )
          ),
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> FourthPage()),);
              },
              child: Column(
                children: <Widget>[
                  Image.network("https://www.shutterstock.com/image-illustration/3d-render-abstract-multicolor-spectrum-260nw-1911508255.jpg"),
                  Text('Religious attractions: These include churches, temples, mosques, and other places of worship.',
                    style: TextStyle(fontSize: 18),)
                ],
              )
          ),
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondPage()),);
              },
              child: Column(
                children: <Widget>[
                  Image.network("https://www.shutterstock.com/image-illustration/3d-render-abstract-multicolor-spectrum-260nw-1911508255.jpg"),
                  Text(" Food and drink attractions: These include wineries, breweries, restaurants, and food tours.",
                    style: TextStyle(fontSize: 18),)
                ],
              )

          ),
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> FivthPage()),);
              },
              child: Column(
                children: <Widget>[
                  Image.network("https://www.shutterstock.com/image-illustration/3d-render-abstract-multicolor-spectrum-260nw-1911508255.jpg"),
                  Text('HolidayEvent  historical city could be considered a cultural attraction. Adventure activities like hiking or skiing could fall under adventure attractions, while visiting theme parks or attending festivals could be considered entertainment attractions. Ultimately, the category of holiday would depend on the specific itinerary and experiences planned.',
                    style: TextStyle(fontSize: 18),)
                ],
              )
          )

        ],
      ),
    );
  }
}
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String _message = 'Hello';

  void _updateMessage() {
    if (mounted) {
      setState(() {
        _message = 'Goodbye';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_message),
        ElevatedButton(
          onPressed: _updateMessage,
          child: Text('Update Message'),
        ),
      ],
    );
  }
}