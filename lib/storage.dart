import 'dart:convert';

class Todo {
  const Todo(this.id, this.title);

  final int id;
  final String title;

  Map<String, Object> toJson() => {'id': id, 'title': title};

  factory Todo.fromJson(Map<String, dynamic> json) {
    if (json case {'id': final int id, 'title': final String title}) {
      return Todo(id, title);
    }
    throw const FormatException('Неверные поля задачи');
  }
}

String encodeTodos(List<Todo> items) =>
    jsonEncode(items.map((todo) => todo.toJson()).toList());

List<Todo> decodeTodos(String raw) {
  final json = jsonDecode(raw);
  if (json is! List) {
    throw const FormatException('Ожидался массив задач');
  }
  return json.map((entry) {
    if (entry is! Map<String, dynamic>) {
      throw const FormatException('Задача должна быть объектом');
    }
    return Todo.fromJson(entry);
  }).toList();
}

abstract interface class TextStore {
  Future<String?> read();
  Future<void> write(String value);
}

class TodoRepository {
  TodoRepository(this.store);

  final TextStore store;

  // TODO 1: прочитайте список через TextStore. Для null верните пустой список.
  Future<List<Todo>> load() async => throw UnimplementedError();

  // TODO 1: сохраните список через TextStore с готовым encodeTodos.
  Future<void> save(List<Todo> items) async => throw UnimplementedError();
}
