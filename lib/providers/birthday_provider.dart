import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/birthday_model.dart';

// 1. Extend Notifier instead of StateNotifier
class BirthdayNotifier extends Notifier<List<BirthdayReminderItem>> {
  
  // 2. Override the build method to provide the initial state (an empty list)
  @override
  List<BirthdayReminderItem> build() {
    return [];
  }

  void addReminder(BirthdayReminderItem item) {
    state = [...state, item];
  }

  void removeReminder(String id) {
    state = state.where((item) => item.id != id).toList();
  }
}

// 3. Use NotifierProvider instead of StateNotifierProvider
final birthdayProvider = NotifierProvider<BirthdayNotifier, List<BirthdayReminderItem>>(() {
  return BirthdayNotifier();
});