import 'package:todo/src/models/todo_model.dart';
import 'package:todo/src/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  final repository = TodoRepository();

  Future start() async {
    todos = await repository.fetchTodos();
  }
}
