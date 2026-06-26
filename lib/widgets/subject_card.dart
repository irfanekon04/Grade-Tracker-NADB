import 'package:flutter/material.dart';
import '../models/subject.dart';
import '../utils/responsive.dart';

class SubjectCard extends StatelessWidget {
  final Subject subject;

  const SubjectCard({super.key, required this.subject});

  Color _gradeColor(ColorScheme colorScheme) {
    switch (subject.grade) {
      case 'A':
        return colorScheme.primary;
      case 'B':
        return colorScheme.secondary;
      case 'C':
        return colorScheme.tertiary;
      case 'F':
        return colorScheme.error;
      default:
        return colorScheme.onSurface;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final cardPadding = context.responsiveCardPadding;
    final avatarSize = context.responsiveValue(small: 48.0, medium: 56.0, large: 64.0);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: EdgeInsets.all(cardPadding),
        child: Row(
          children: [
            Container(
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  subject.name[0].toUpperCase(),
                  style: TextStyle(
                    fontSize: avatarSize * 0.4,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
            SizedBox(width: cardPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Marks: ${subject.mark.toStringAsFixed(1)}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.responsiveValue(small: 12.0, medium: 16.0),
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: _gradeColor(colorScheme).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                subject.grade,
                style: TextStyle(
                  fontSize: context.responsiveValue(small: 18.0, medium: 20.0),
                  fontWeight: FontWeight.bold,
                  color: _gradeColor(colorScheme),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
