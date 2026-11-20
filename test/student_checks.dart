// flutter test test/student_checks.dart — после реализации TODO 4.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_storage_testing_task/main.dart';
import 'package:todo_storage_testing_task/storage.dart';

import 'fakes.dart';

const fixedJson = '[{"id":7,"title":"Купить чай"}]';
const brokenJson = '[{"id":7';
const wrongFieldType = '[{"id":"7","title":"Чай"}]';

List<(int, String)> fields(List<Todo> items) =>
    items.map((todo) => (todo.id, todo.title)).toList();

Future<void> launch(WidgetTester tester, TextStore store) =>
    tester.pumpWidget(TodoApp(repository: TodoRepository(store)));

Future<void> addThroughForm(WidgetTester tester, String title) async {
  await tester.tap(find.byKey(const Key('add_todo_button')));
  await tester.pumpAndSettle();
  await tester.enterText(find.byKey(const Key('todo_title_field')), title);
  await tester.tap(find.byKey(const Key('save_todo_button')));
  await tester.pumpAndSettle();
}

Future<void> launchFresh(WidgetTester tester, TextStore store) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await launch(tester, store);
  await tester.pump();
}

void main() {
  // TODO 4: используйте готовые фикстуры и помощники для четырёх тестов.
  test('новый репозиторий восстанавливает задачи по порядку', () async {
    fail('TODO 4: запишите две задачи и сравните поля после восстановления');
  });

  test('первый запуск, готовый JSON и повреждённые данные', () async {
    fail(
      'TODO 4: проверьте первый запуск, fixedJson и два повреждённых примера',
    );
  });

  test('сбой записи не затирает ранее сохранённую задачу', () async {
    fail('TODO 4: проверьте исключение и повторное чтение прежней задачи');
  });

  testWidgets('показывает загрузку, восстанавливает и добавляет задачу', (
    tester,
  ) async {
    final pending = PendingStore();
    await launch(tester, pending);
    fail(
      'TODO 4: проверьте индикатор, восстановление и добавление через форму',
    );
  });
}
