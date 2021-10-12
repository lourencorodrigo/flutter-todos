import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/src/repositories/todo_repository.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final repository = TodoRepository(dio);

  test('deve trazer uma lista de TodoModel', () async {
    when(dio.get(any)).thenAnswer(
      (_) async => Response(
        data: jsonData,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final list = await repository.fetchTodos();
    expect(list[0].title, 'rodrigo1');
  });
}

List<Map<String, Object>> jsonData = [
  {"userId": 1, "id": 1, "title": "rodrigo1", "completed": false},
  {"userId": 1, "id": 2, "title": "rodrigo2", "completed": false}
];
