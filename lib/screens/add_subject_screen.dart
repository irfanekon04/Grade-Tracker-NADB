import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/subject.dart';
import '../providers/subject_provider.dart';
import '../widgets/custom_text_field.dart';

class AddSubjectScreen extends StatelessWidget {
  AddSubjectScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _marksController = TextEditingController();

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    final name = _nameController.text.trim();
    final mark = double.parse(_marksController.text.trim());

    context.read<SubjectProvider>().addSubject(Subject(name: name, mark: mark));

    _nameController.clear();
    _marksController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Subject added successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Icon(
              Icons.school,
              size: 64,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Add New Subject',
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Enter the subject name and marks obtained.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
            CustomTextField(
              controller: _nameController,
              label: 'Subject Name',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Subject name cannot be empty';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _marksController,
              label: 'Marks (0-100)',
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Marks cannot be empty';
                }
                final mark = double.tryParse(value.trim());
                if (mark == null) {
                  return 'Marks must be a number';
                }
                if (mark < 0 || mark > 100) {
                  return 'Marks must be between 0 and 100';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => _submit(context),
              child: const Text('Add Subject'),
            ),
          ],
        ),
      ),
    );
  }
}
