import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_provider.dart';
import '../utils/responsive.dart';
import '../widgets/summary_card.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final padding = context.responsivePadding;
    final iconSize = context.responsiveIconSize;
    final isTablet = context.isTablet;

    return Consumer<SubjectProvider>(
      builder: (context, provider, _) {
        final cards = [
          SummaryCard(
            label: 'Total Subjects',
            value: '${provider.totalSubjects}',
            icon: Icons.book_rounded,
            color: colorScheme.primary,
          ),
          SummaryCard(
            label: 'Average Marks',
            value: provider.totalSubjects > 0
                ? provider.averageMark.toStringAsFixed(1)
                : 'N/A',
            icon: Icons.trending_up_rounded,
            color: colorScheme.tertiary,
          ),
          SummaryCard(
            label: 'Overall Grade',
            value: provider.overallGrade,
            icon: Icons.grade_rounded,
            color: colorScheme.secondary,
          ),
          SummaryCard(
            label: 'Passing Subjects',
            value: '${provider.passingSubjects}',
            icon: Icons.check_circle_rounded,
            color: colorScheme.primary,
          ),
          SummaryCard(
            label: 'Failing Subjects',
            value: '${provider.failingSubjects}',
            icon: Icons.cancel_rounded,
            color: provider.failingSubjects > 0 ? colorScheme.error : colorScheme.outline,
          ),
        ];

        return SingleChildScrollView(
          padding: EdgeInsets.all(padding),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: padding),
                  Icon(
                    Icons.analytics_rounded,
                    size: iconSize,
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
                  SizedBox(height: padding + 8),
                  if (isTablet)
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: cards.map((card) {
                        return SizedBox(
                          width: (context.screenWidth - padding * 2 - 12) / 2,
                          child: card,
                        );
                      }).toList(),
                    )
                  else
                    ...cards.map(
                      (card) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: card,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
