class Todo {
  const Todo(this.id, this.title);

  final int id;
  final String title;

  Map<String, Object> toJson() => {'id': id, 'title': title};

  // TODO 1: проверьте поля задачи и реализуйте кодирование и чтение JSON v1.
  factory Todo.fromJson(Map<String, dynamic> json) =>
      throw UnimplementedError();
}

String encodeTodos(List<Todo> items) => throw UnimplementedError();

List<Todo> decodeTodos(String raw) => throw UnimplementedError();

abstract interface class TextStore {
  Future<String?> read();
  Future<void> write(String value);
}

class TodoRepository {
  TodoRepository(this.store);

  final TextStore store;

  // TODO 2: свяжите TextStore с кодированием и чтением JSON.
  Future<List<Todo>> load() async => throw UnimplementedError();

  Future<void> save(List<Todo> items) async => throw UnimplementedError();
}
