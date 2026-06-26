import 'package:flutter/foundation.dart';
import '../models/subject.dart';

class SubjectProvider extends ChangeNotifier {
  final List<Subject> _subjects = [];

  List<Subject> get subjects => List.unmodifiable(_subjects);

  int get totalSubjects => _subjects.length;

  double get averageMark {
    if (_subjects.isEmpty) return 0;
    final total = _subjects.map((s) => s.mark).reduce((a, b) => a + b);
    return total / _subjects.length;
  }

  String get overallGrade {
    if (_subjects.isEmpty) return 'N/A';
    final avg = averageMark;
    if (avg >= 80) return 'A';
    if (avg >= 65) return 'B';
    if (avg >= 50) return 'C';
    return 'F';
  }

  int get passingSubjects => _subjects.where((s) => s.grade != 'F').length;

  int get failingSubjects => _subjects.where((s) => s.grade == 'F').length;

  void addSubject(Subject subject) {
    _subjects.add(subject);
    notifyListeners();
  }

  void removeSubject(int index) {
    if (index >= 0 && index < _subjects.length) {
      _subjects.removeAt(index);
      notifyListeners();
    }
  }
}
