import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/birthday_provider.dart';

class DetailsScreen extends ConsumerWidget {
  final String id;

  const DetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final allBirthdays = ref.watch(birthdayProvider);

    final person = allBirthdays.firstWhere(
      (b) => b.id == id,
      orElse: () => throw Exception('Person not found'),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Hero Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [theme.colorScheme.primary, theme.colorScheme.tertiary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary.withOpacity(0.25),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.white,
                    child: Text(
                      person.fullName.isNotEmpty ? person.fullName[0].toUpperCase() : '?',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: theme.colorScheme.primary),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    person.fullName,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Turns ${person.ageTurning} in ${person.daysRemaining} days',
                    style: TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.9)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Metadata Cards
            Card(
              child: ListTile(
                leading: const Icon(Icons.cake_outlined, color: Colors.purple),
                title: const Text('Birth Date', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${person.birthDate.year}-${person.birthDate.month.toString().padLeft(2, '0')}-${person.birthDate.day.toString().padLeft(2, '0')}'),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: const Icon(Icons.favorite_outline_rounded, color: Colors.redAccent),
                title: const Text('Relationship', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(person.relationship?.isNotEmpty == true ? person.relationship! : 'Not specified'),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: const Icon(Icons.card_giftcard_outlined, color: Colors.orangeAccent),
                title: const Text('Gift Ideas', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(person.giftPreferences?.isNotEmpty == true ? person.giftPreferences! : 'No ideas added yet.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}