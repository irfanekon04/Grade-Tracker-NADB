class Subject {
  final String name;
  double _mark;

  Subject({required this.name, required this._mark});

  double get mark => _mark;

  set mark(double value) {
    if (value >= 0 && value <= 100) {
      _mark = value;
    }
  }

  String get grade {
    if (_mark >= 80) return 'A';
    if (_mark >= 65) return 'B';
    if (_mark >= 50) return 'C';
    return 'F';
  }
}
