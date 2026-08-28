import 'package:credify/core/constants/app_size.dart';
import 'package:flutter/material.dart';

import '../data/save_model.dart';

class SavingNotifier extends ChangeNotifier {
  List<SaveModel> savings = [
    SaveModel(
      title: 'Buy a house in new york',
      subtitle: 'To buy a new house',
      frequency: Frequency.daily,
      createdAt: DateTime.now().toString(),
      amount: 1000,
      updatedAt: DateTime.now().toString(),
      duration: '16',
      paidAmount: 500,
    ),SaveModel(
      title: 'Buy a house in new york',
      subtitle: 'To buy a new house',
      frequency: Frequency.monthly,
      createdAt: DateTime.now().toString(),
      amount: 2000,
      updatedAt: DateTime.now().toString(),
      duration: '2',
      paidAmount: 1500,
    ),SaveModel(
      title: 'Buy a house in new york',
      subtitle: 'To buy a new house',
      frequency: Frequency.weekly,
      createdAt: DateTime.now().toString(),
      amount: 2000,
      updatedAt: DateTime.now().toString(),
      duration: '7',
      paidAmount: 300,
    ),SaveModel(
      title: 'Buy a house in new york',
      subtitle: 'To buy a new house',
      duration: '9',
      frequency: Frequency.daily,
      createdAt: DateTime.now().toString(),
      amount: 2000,
      updatedAt: DateTime.now().toString(),
      paidAmount: 500,
    ),
    SaveModel(
      title: 'Buy a house in new york',
      subtitle: 'To buy a new house',
      frequency: Frequency.weekly,
      createdAt: DateTime.now().toString(),
      amount: 2000,
      updatedAt: DateTime.now().toString(),
      duration: '12',
      paidAmount: 1800,
    ),
    SaveModel(
      title: 'Buy a house in new york',
      subtitle: 'To buy a new house',
      frequency: Frequency.monthly,
      createdAt: DateTime.now().toString(),
      amount: 2000,
      updatedAt: DateTime.now().toString(),
      duration: '5',
      paidAmount: 2000,
    ),
  ];
}
