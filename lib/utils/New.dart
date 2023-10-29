import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;
import 'one.dart';
import 'photo.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialApp(
        title: 'My App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: MyHomePage(title: 'My App Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  Future<void> _openMaps() async {
    final url = 'https://www.google.com/maps/search/?api=1&query=Addis+Ababa';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _search(String query) async {
    final url = 'https://www.google.com/search?q=$query';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://www.shutterstock.com/image-illustration/3d-render-abstract-multicolor-spectrum-260nw-1911508255.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(color: Colors.black.withOpacity(0.5)),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(title),
          ),
          body: Column(

            children: [

              Expanded(
                child: Center(
                  child: Text(
                    'Well come to Ethiopia',
                    style: TextStyle(fontSize: 45.0,color: Colors.amber),

                  ),
                ),
              ),
              MyApp(),
              Container(
                child:Text("Ethiopia has reopened borders on September 23, 2020 and is now again allowing tourists and foreigners to enter the country Ethiopia was closed for a total of 6 months since closing both land and air borders back on March 23rd in response to the pandemic, which came as a real blow to the countrys economy, throwing it off the record-breaking trajectory it was on.") ,
              ),


              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  onSubmitted: _search,
                  decoration: InputDecoration(
                    hintText: 'Search Google',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.4),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.green),
                    accountName: Text(
                      " ",
                      style: TextStyle(fontSize: 18),
                    ),
                    accountEmail: Text("Ethiopia: Land of Beauty And Wonder"),
                    currentAccountPictureSize: Size.square(50),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 165, 255, 137),
                      child: Text(
                        "M",
                        style: TextStyle(fontSize: 30.0, color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text(' Calendar '),
                  onTap: () {
                    Navigator.pop(context); // close the drawer
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalendarPage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text(' Photo Gallery '),
                  onTap: () {
                    Navigator.pop(context); // close the drawer
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PhotoGallery()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.translate),
                  title: const Text(' Language Translator '),
                  onTap: () {
                    Navigator.pop(context); // close the drawer
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalendarPage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text(' Location '),
                  onTap: _openMaps,
                ),
                ListTile(
                  leading: const Icon(Icons.attach_money),
                  title: const Text(' Currency Converter '),
                  onTap: () {
                    Navigator.pop(context); // close the drawer
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CurrencyConverter()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text(' About Ethiopia '),
                  onTap: () {
                    Navigator.pop(context); // close the drawer
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _openMaps,
            tooltip: 'Open Maps',
            child: const Icon(Icons.map),
          ),
        ),
      ],
    );
  }
}

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: Center(
        child: Text(
          'Calendar page',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
      ),
      body: Center(
        child: Text(
          'Photo gallery page',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

class CurrencyConverter extends StatelessWidget {
  const CurrencyConverter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
      ),
      body: Center(
        child: Text(
          'Currency converter page',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Ethiopia'),
      ),
      body: Center(
        child: Text(
          'About Ethiopia page',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}