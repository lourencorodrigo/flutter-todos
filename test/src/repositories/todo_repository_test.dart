import 'package:flutter_test/flutter_test.dart';
import 'package:todo/src/repositories/todo_repository.dart';

main() {
  final repository = TodoRepository();

  test('deve trazer uma lista de TodoModel', () async {
    final list = await repository.fetchTodos();
    expect(list[0].title, 'delectus aut autem');
  });
}
