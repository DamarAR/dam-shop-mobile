import 'package:flutter/material.dart';
import 'package:dam_shop/models/food_entry.dart';
import 'package:dam_shop/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MoodEntryPage extends StatefulWidget {
  const MoodEntryPage({super.key});

  @override
  State<MoodEntryPage> createState() => _MoodEntryPageState();
}

class _MoodEntryPageState extends State<MoodEntryPage> {
  Future<List<MoodEntry>> fetchMood(CookieRequest request) async {
    // TODO: Don't forget to add the trailing slash (/) at the end of the URL!
    final response = await request.get('http://localhost:8000/json/');
    // Decoding the response into JSON
    var data = response;

    // Convert json data to a MoodEntry object
    List<MoodEntry> listMood = [];
    for (var d in data) {
      if (d != null) {
        print('d');
print((d));
var mood = MoodEntry.fromJson(d);
print("mood");
print(mood);
        listMood.add(MoodEntry.fromJson(d));
      }
    }
    print("listMood");  
      print(listMood.toString());
    return listMood;
    }
    
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchMood(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There is no mood data in mental health tracker.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].fields.food}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.description}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.quantity}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.time}")
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}