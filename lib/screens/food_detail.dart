import 'package:flutter/material.dart';
import 'package:dam_shop/models/food_entry.dart';

class MoodDetail extends StatelessWidget {
  final MoodEntry mood;

  const MoodDetail({super.key, required this.mood});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mood.fields.food!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mood.fields.food!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Price: \$${mood.fields.quantity}"),
            const SizedBox(height: 10),
            Text("Description: ${mood.fields.description}"),
            const SizedBox(height: 10),
            Text("Rating: ${mood.fields.quantity}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Food List'),
            ),
          ],
        ),
      ),
    );
  }
}