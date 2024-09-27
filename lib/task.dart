class Task {
  const Task({required this.title, required this.description});
  final String title;
  final String description;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Task &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description;

  @override
  int get hashCode => title.hashCode ^ description.hashCode;
}

List<Task> savedTasks = [];
