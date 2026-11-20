// flutter test test/student_checks.dart — после реализации TODO 5.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_storage_testing_task/main.dart';
import 'package:todo_storage_testing_task/storage.dart';

import 'fakes.dart';

const fixedV1 = '{"version":1,"items":[{"id":7,"title":"Купить чай"}]}';
const brokenJson = '{"version":1';
const unknownVersion = '{"version":2,"items":[]}';

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
  // TODO 5: используйте готовые фикстуры и помощники для четырёх тестов.
  test('новый репозиторий восстанавливает задачи по порядку', () async {
    fail('TODO 5: запишите две задачи и сравните поля после восстановления');
  });

  test(
    'фиксированный JSON v1 читается, испорченные данные дают ошибку',
    () async {
      fail('TODO 5: проверьте fixedV1, brokenJson и unknownVersion');
    },
  );

  test('сбой записи не затирает ранее сохранённую задачу', () async {
    fail('TODO 5: проверьте исключение и повторное чтение прежней задачи');
  });

  testWidgets('показывает загрузку, восстанавливает и добавляет задачу', (
    tester,
  ) async {
    final pending = PendingStore();
    await launch(tester, pending);
    fail(
      'TODO 5: проверьте индикатор, восстановление и добавление через форму',
    );
  });
}
