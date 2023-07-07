import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Note {
  int? id;
  String title;
  int priority;
  String? description;

  Note(this.title,this.priority,[this.id,this.description]);

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title':title,
      'priority':priority,
      'description':description
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  // @override
  String toString() {
    return 'Note{id: $id, title: $title, priority: $priority, desc: $description}';
  }
}