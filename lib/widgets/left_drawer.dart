import 'package:flutter/material.dart';
import 'package:dam_shop/screens/menu.dart';
import 'package:dam_shop/screens/foodentry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
             decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Column(
                children: [
                  Text(
                    'Dam-Shop',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Text(
                    "Track your food list here!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home Page'),
              onTap: () {
                Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context) => MyHomePage(),
                ));
              },
            ),  
            ListTile(
            leading: const Icon(Icons.fastfood),
            title: const Text('Add Food'),
            onTap: () {
               Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context) => FoodEntryFormPage(),
                ));
            },
          ),
        ],
      ),
    );
  }
}