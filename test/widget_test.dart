import 'package:flutter_test/flutter_test.dart';

import 'package:student_grade_tracker/main.dart';

void main() {
  testWidgets('App renders with bottom navigation', (WidgetTester tester) async {
    await tester.pumpWidget(const StudentGradeTrackerApp());

    expect(find.text('Student Grade Tracker'), findsOneWidget);
    expect(find.text('Add Subject'), findsOneWidget);
    expect(find.text('Subject List'), findsOneWidget);
    expect(find.text('Summary'), findsOneWidget);
  });
}
