import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_provider.dart';
import '../utils/responsive.dart';
import '../widgets/subject_card.dart';

class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isTablet = context.isTablet;

    return Consumer<SubjectProvider>(
      builder: (context, provider, _) {
        if (provider.subjects.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.inbox_rounded,
                  size: 80,
                  color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                ),
                const SizedBox(height: 16),
                Text(
                  'No subjects added yet',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Add a subject to get started.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          );
        }

        if (isTablet) {
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: provider.subjects.length,
            itemBuilder: (context, index) {
              final subject = provider.subjects[index];
              return Dismissible(
                key: ValueKey(subject.name + subject.mark.toString()),
                direction: DismissDirection.endToStart,
                background: Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.error,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 24),
                  child: Icon(
                    Icons.delete_rounded,
                    color: theme.colorScheme.onError,
                  ),
                ),
                onDismissed: (_) {
                  provider.removeSubject(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Subject removed')),
                  );
                },
                child: SubjectCard(subject: subject),
              );
            },
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: provider.subjects.length,
          itemBuilder: (context, index) {
            final subject = provider.subjects[index];
            return Dismissible(
              key: ValueKey(subject.name + subject.mark.toString()),
              direction: DismissDirection.endToStart,
              background: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: theme.colorScheme.error,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 24),
                child: Icon(
                  Icons.delete_rounded,
                  color: theme.colorScheme.onError,
                ),
              ),
              onDismissed: (_) {
                provider.removeSubject(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Subject removed')),
                );
              },
              child: SubjectCard(subject: subject),
            );
          },
        );
      },
    );
  }
}
