import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_provider.dart';
import '../widgets/summary_card.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Consumer<SubjectProvider>(
      builder: (context, provider, _) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Icon(
                Icons.analytics_rounded,
                size: 64,
                color: colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                'Performance Summary',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Overview of all subjects and performance.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 32),
              SummaryCard(
                label: 'Total Subjects',
                value: '${provider.totalSubjects}',
                icon: Icons.book_rounded,
                color: colorScheme.primary,
              ),
              const SizedBox(height: 12),
              SummaryCard(
                label: 'Average Marks',
                value: provider.totalSubjects > 0
                    ? provider.averageMark.toStringAsFixed(1)
                    : 'N/A',
                icon: Icons.trending_up_rounded,
                color: colorScheme.tertiary,
              ),
              const SizedBox(height: 12),
              SummaryCard(
                label: 'Overall Grade',
                value: provider.overallGrade,
                icon: Icons.grade_rounded,
                color: colorScheme.secondary,
              ),
              const SizedBox(height: 12),
              SummaryCard(
                label: 'Passing Subjects',
                value: '${provider.passingSubjects}',
                icon: Icons.check_circle_rounded,
                color: Colors.green,
              ),
              const SizedBox(height: 12),
              SummaryCard(
                label: 'Failing Subjects',
                value: '${provider.failingSubjects}',
                icon: Icons.cancel_rounded,
                color: provider.failingSubjects > 0 ? Colors.red : Colors.grey,
              ),
            ],
          ),
        );
      },
    );
  }
}
