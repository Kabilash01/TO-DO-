import 'package:flutter/material.dart';
import 'package:kabi_todo_app/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  
  // Pre-installed todo list with better variety
  List<List<dynamic>> toDoList = [
    ['🎯 Welcome to KABI Todos!', false],
    
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        toDoList.add([_controller.text.trim(), false]);
        _controller.clear();
      });
    }
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF70587B),
      appBar: AppBar(
        title: const Text(
          'KABI TODO APP',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color(0xFF70587B),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Header section with stats
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF70587B),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'You have ${toDoList.where((task) => !task[1]).length} tasks pending',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${toDoList.where((task) => task[1]).length}/${toDoList.length} completed',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Todo list
          Expanded(
            child: toDoList.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.task_alt,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No todos yet!',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Add your first task below',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 20),
                    itemCount: toDoList.length,
                    itemBuilder: (BuildContext context, index) {
                      return TodoList(
                        taskName: toDoList[index][0],
                        taskCompleted: toDoList[index][1],
                        onChanged: (value) => checkBoxChanged(index),
                        deleteFunction: (contex) => deleteTask(index),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Add a new task to KABI TODO APP...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                  ),
                  onSubmitted: (value) => saveNewTask(),
                ),
              ),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: saveNewTask,
              backgroundColor: const Color(0xFF70587B),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
