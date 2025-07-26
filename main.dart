import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 700) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _index,
              onTap: (value) {
                setState(() {
                  _index = value;
                });
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'favourites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'profile',
                ),
              ],
            ),
            body: Center(
              child: Text('MOBILE LAYOUT', style: TextStyle(fontSize: 24)),
            ),
          );
        } else if (constraints.maxWidth <= 1024) {
          return Scaffold(
            appBar: AppBar(),
            drawer: Drawer(
              backgroundColor: Colors.blue,
              child: Column(
                children: [
                  DrawerHeader(child: Text('')),
                  Center(child: ListTile(leading: Icon(Icons.home, size: 30))),
                  Center(child: ListTile(leading: Icon(Icons.favorite, size: 30))),
                  Center(child: ListTile(leading: Icon(Icons.person, size: 30))),
                ],
              ),
            ),
            body: Center(
              child: Text('Tablet Layout', style: TextStyle(fontSize: 24)),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(),
            drawer: Drawer(
              backgroundColor: Colors.blue,
              child: Column(
                children: [
                  DrawerHeader(child: Text('')),
                  Center(
                    child: ListTile(
                      leading: Icon(Icons.home, size: 40,color:Colors.black),
                      title: Text('HOME', style: TextStyle(fontSize: 24)),
                    ),
                  ),
                  Center(
                    child: ListTile(
                      leading: Icon(Icons.favorite, size: 40,color:Colors.black),
                      title: Text('FAVORITE', style: TextStyle(fontSize: 24)),
                    ),
                  ),
                  Center(
                    child: ListTile(
                      leading: Icon(Icons.person, size: 40,color:Colors.black),
                      title: Text('PROFILE', style: TextStyle(fontSize: 24)),
                    ),
                  ),
                ],
              ),
            ),
            body: Center(
              child: Text('Desktop Layout', style: TextStyle(fontSize: 24)),
            ),
          );
        }
      },
    );
  }
}
