import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class NotificationModel {
  String title;
  String description;
  String createdAt;
  String timestamp;

  NotificationModel({
    this.title,
    this.description,
    this.createdAt,
    this.timestamp
  });


  factory NotificationModel.fromFirestore(DocumentSnapshot snapshot){
    var d = snapshot.get(snapshot);
    return NotificationModel(
      title: d['title'],
      description: d['description'],
      createdAt: DateFormat('d MMM, y').format(DateTime.parse(d['created_at'].toDate().toString())),
      timestamp: d['timestamp'],
    );
  }
}