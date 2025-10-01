import 'package:flutter/material.dart';

class Plant {
  const Plant({
    this.imageUrl,
    required this.id,
    required this.name,
    required this.sciname,
    required this.climate,
    required this.soil,
    required this.season,
    required this.description,
    required this.instructions
   });
   
  final String? imageUrl;
  final String id;
  final String name;
  final String sciname;
  final String climate;
  final String soil;
  final String season;
  final String description;
  final String instructions;
}

class Student {
  const Student({
    required this.id,
    required this.nome
  });

  final String id;
  final String nome;
}