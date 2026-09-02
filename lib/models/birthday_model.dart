import 'package:uuid/uuid.dart';

class BirthdayReminderItem {
  final String id;
  final String fullName;
  final DateTime birthDate;
  final String? relationship; // Nullable: Optional field
  final String? giftPreferences; // Nullable: Optional field
  late final int ageTurning; // late: Computed on initialization

  BirthdayReminderItem({
    String? id, // Nullable parameter with fallback (??)
    required this.fullName,
    required this.birthDate,
    this.relationship,
    this.giftPreferences,
  }) : id = id ?? const Uuid().v4() {
    ageTurning = _calculateAgeTurning();
  }

  int _calculateAgeTurning() {
    final now = DateTime.now();
    int currentAge = now.year - birthDate.year;
    DateTime nextBdayThisYear = DateTime(now.year, birthDate.month, birthDate.day);
    
    // If birthday hasn't happened this year yet, they are turning currentAge.
    // If it has, they are turning currentAge + 1 next year.
    return now.isAfter(nextBdayThisYear) ? currentAge + 1 : currentAge;
  }

  int get daysRemaining {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    DateTime nextBday = DateTime(now.year, birthDate.month, birthDate.day);
    
    if (nextBday.isBefore(today)) {
      nextBday = DateTime(now.year + 1, birthDate.month, birthDate.day); // !! Force non-null execution
    }
    return nextBday.difference(today).inDays;
  }
}