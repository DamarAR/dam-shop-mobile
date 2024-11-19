import 'package:flutter/material.dart';
import 'package:dam_shop/screens/list_foodentry.dart';
import 'package:dam_shop/screens/menu.dart';
import 'package:dam_shop/screens/foodentry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
                  "Buy your Foods every day here!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),

          ),
          
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home Page'),
            // Redirection part to MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Add Food'),
            // Redirection part to ProductEntryFormPage
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryFormPage(),
                ),
              );
            },
          ),
        ListTile(
          leading: const Icon(Icons.add_reaction_rounded),
          title: const Text('Food List'),
          onTap: () {
              // Route to the mood page
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductEntryPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}