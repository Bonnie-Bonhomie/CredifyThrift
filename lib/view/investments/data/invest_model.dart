
import 'package:credify/export_barrel.dart';
import 'package:credify/core/constants/enum_constant.dart';

class InvestModel {
  String title;
  final String subtitle;
  Frequency frequency;
  double amount;
  double paidAmount;
  int percentage;
  String createdAt;
  String updatedAt;
  String duration;

  InvestModel({
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

  double get percent => (paidAmount / amount);

  factory InvestModel.fromJson(Map<String, dynamic> json) {
    return InvestModel(
      title: json['title'],
      subtitle: json['subtitle'],
      frequency: json['frequency'],
      createdAt: json['createdAt'],
      duration: json['duration'],
      amount: json['amount'],
      updatedAt: json['updatedAt'],
      paidAmount: json['paidAmount'],
      percentage: json['percentage'],
    );
  }
}

// class InvestModeModel {
//   final String title;
//   final String? description;
//   double amount;
//   Frequency frequency;
//   int duration;
//
//   InvestModeModel({
//     required this.title,
//     required this.frequency,
//     required this.amount,
//     required this.duration,
//     this.description,
//   });
//
//   double get average => amount / duration;
// }
