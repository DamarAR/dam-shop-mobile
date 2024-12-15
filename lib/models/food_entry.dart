  // To parse this JSON data, do
  //
  //     final moodEntry = moodEntryFromJson(jsonString);

  import 'dart:convert';

  List<MoodEntry> moodEntryFromJson(String str) => List<MoodEntry>.from(json.decode(str).map((x) => MoodEntry.fromJson(x)));

  String moodEntryToJson(List<MoodEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  class MoodEntry {
      String model;
      String pk;
      Fields fields;

      MoodEntry({
          required this.model,
          required this.pk,
          required this.fields,
      });

      factory MoodEntry.fromJson(Map<String, dynamic> json) {
  print('Debugging MoodEntry JSON: $json');
  print('Model: ${json["model"]}');
  print('PK: ${json["pk"]}');
  print('Fields: ${json["fields"]}');
  
  return MoodEntry(
    model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );
}

      Map<String, dynamic> toJson() => {
          "model": model,
          "pk": pk,
          "fields": fields.toJson(),
      };
  }

  class Fields {
      int? user;
      String? food;
      DateTime? time;
      String? description;
      int? quantity;

      Fields({
          required this.user,
          required this.food,
          required this.time,
          required this.description,
          required this.quantity,
      });

      factory Fields.fromJson(Map<String, dynamic> json) { 
        print('Debugging MoodEntry JSON: $json');
        print('user: ${json["user"]}');
        print('food: ${json["foods"]}');
        print('time: ${json["time"]}');
        print('description: ${json["description"]}');
        print('price: ${json["quantity"]}');
        return Fields(
          user: json["user"],
          food: json["foods"],
          time: DateTime.parse(json["time"]),
          description: json["description"],
          quantity: json["quantity"],
      );
      }

      Map<String, dynamic> toJson() => {
          "user": user,
          "mood": food,
          "time": "${time!.year.toString().padLeft(4, '0')}-${time!.month.toString().padLeft(2, '0')}-${time!.day.toString().padLeft(2, '0')}",
          "feelings": description,
          "mood_intensity": quantity,
      };
  }