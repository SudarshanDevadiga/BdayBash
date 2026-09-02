import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/birthday_provider.dart';

class FriendListScreen extends ConsumerWidget {
  const FriendListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final allBirthdays = ref.watch(birthdayProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Friends', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: allBirthdays.isEmpty
          ? Center(
              child: Text('No friends added yet.', style: TextStyle(color: Colors.grey.shade500)),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: allBirthdays.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final person = allBirthdays[index];
                return Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    leading: CircleAvatar(
                      backgroundColor: theme.colorScheme.secondaryContainer,
                      child: Text(
                        person.fullName.isNotEmpty ? person.fullName[0].toUpperCase() : '?',
                        style: TextStyle(
                          color: theme.colorScheme.onSecondaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(person.fullName, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      person.relationship?.isNotEmpty == true ? person.relationship! : 'Friend',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
                    onTap: () => context.push('/details/${person.id}'),
                  ),
                );
              },
            ),
    );
  }
}