import 'package:credify/core/constants/app_size.dart';

class SaveModel {

  String title;
  final String subtitle;
  Frequency frequency;
  double amount;
  double paidAmount;
  int percentage;
  String createdAt;
  String updatedAt;
  String duration;

  SaveModel({
    required this.title,
    required this.subtitle,
    required this.frequency,
    required this.createdAt,
    required this.amount,
    required this.updatedAt,
    required this.paidAmount,
    required this.duration,
    this.percentage = 0,
  });

  double get percent => (paidAmount/amount);


  factory SaveModel.fromJson(Map<String, dynamic> json){
    return SaveModel(title: json['title'],
        subtitle: json['subtitle'],
        frequency: json['frequency'],
        createdAt: json['createdAt'],
        duration: json['duration'],
        amount: json['amount'],
        updatedAt: json['updatedAt'],
        paidAmount: json['paidAmount'],
        percentage: json['percentage']);
  }

}

