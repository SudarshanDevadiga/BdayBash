import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/birthday_provider.dart';
import '../models/birthday_model.dart';

class AddBirthdayScreen extends ConsumerStatefulWidget {
  const AddBirthdayScreen({super.key});

  @override
  ConsumerState<AddBirthdayScreen> createState() => _AddBirthdayScreenState();
}

class _AddBirthdayScreenState extends ConsumerState<AddBirthdayScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  DateTime? _birthDate;
  String _relationship = '';
  String _giftPreferences = '';

  void _saveForm() {
    if (_formKey.currentState!.validate() && _birthDate != null) {
      _formKey.currentState!.save();

      final newItem = BirthdayReminderItem(
        fullName: _name,
        birthDate: _birthDate!,
        relationship: _relationship,
        giftPreferences: _giftPreferences,
      );

      ref.read(birthdayProvider.notifier).addReminder(newItem);
      context.pop();
    } else if (_birthDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          content: const Text('Please select their birth date'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Reminder', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- NON-WORKING ADD PHOTO BUTTON ---
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Photo upload feature coming soon!'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey.shade200,
                                child: Icon(
                                  Icons.person_rounded, 
                                  size: 60, 
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 3),
                                ),
                                child: const Icon(
                                  Icons.camera_alt_rounded, 
                                  size: 20, 
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      // ------------------------------------

                      const Text(
                        'Who are we celebrating?',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 20),

                      // Full Name
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Full Name *',
                          prefixIcon: Icon(Icons.person_outline_rounded),
                        ),
                        validator: (value) =>
                            (value == null || value.trim().isEmpty) ? 'Name cannot be blank' : null,
                        onSaved: (value) => _name = value!.trim(),
                      ),
                      const SizedBox(height: 16),

                      // Date Picker Tile
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: _birthDate ?? DateTime(2000, 1, 1),
                            firstDate: DateTime(1920),
                            lastDate: DateTime.now(),
                          );
                          if (picked != null) {
                            setState(() => _birthDate = picked);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_month_rounded,
                                color: _birthDate == null ? Colors.grey : theme.colorScheme.primary,
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Text(
                                  _birthDate == null
                                      ? 'Select Birth Date *'
                                      : 'Born on: ${_birthDate!.year}-${_birthDate!.month.toString().padLeft(2, '0')}-${_birthDate!.day.toString().padLeft(2, '0')}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: _birthDate == null ? FontWeight.normal : FontWeight.w600,
                                    color: _birthDate == null ? Colors.grey.shade600 : Colors.black87,
                                  ),
                                ),
                              ),
                              const Icon(Icons.arrow_drop_down, color: Colors.grey),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Relationship
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Relationship (Optional)',
                          hintText: 'e.g. Best Friend, Sibling, Colleague',
                          prefixIcon: Icon(Icons.favorite_border_rounded),
                        ),
                        onSaved: (value) => _relationship = value?.trim() ?? '',
                      ),
                      const SizedBox(height: 16),

                      // Gift Preferences
                      TextFormField(
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Gift Ideas / Preferences (Optional)',
                          hintText: 'e.g. Loves sci-fi books, sneakers, dark chocolate',
                          prefixIcon: Icon(Icons.card_giftcard_rounded),
                          alignLabelWithHint: true,
                        ),
                        onSaved: (value) => _giftPreferences = value?.trim() ?? '',
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Save Action
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey.shade100)),
              ),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: _saveForm,
                  icon: const Icon(Icons.check_rounded),
                  label: const Text('Save Birthday', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}