import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade400,
              borderRadius: BorderRadius.circular(20),
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: taskCompleted ? Colors.grey[300] : Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
            border: taskCompleted 
                ? Border.all(color: Colors.green.shade300, width: 2)
                : null,
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: taskCompleted ? Colors.green : Colors.transparent,
                  border: Border.all(
                    color: taskCompleted ? Colors.green : Colors.grey.shade400,
                    width: 2,
                  ),
                ),
                child: Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  checkColor: Colors.white,
                  activeColor: Colors.transparent,
                  side: BorderSide.none,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  taskName,
                  style: TextStyle(
                    color: taskCompleted ? Colors.grey[600] : Colors.grey[800],
                    fontSize: 16,
                    fontWeight: taskCompleted ? FontWeight.normal : FontWeight.w500,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.grey[600],
                    decorationThickness: 2,
                  ),
                ),
              ),
              if (taskCompleted)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green.shade600,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Done',
                        style: TextStyle(
                          color: Colors.green.shade600,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
