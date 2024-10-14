import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_adv/provider/home_provider.dart';
import 'package:todo_app_adv/provider/theme_provider.dart';
import 'package:todo_app_adv/utils/global.dart';

import '../utils/global.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    HomeProvider hometrue = Provider.of<HomeProvider>(context, listen: true);
    HomeProvider homefalse = Provider.of<HomeProvider>(context, listen: false);

    ThemeProvider themetrue = Provider.of<ThemeProvider>(context, listen: true);
    ThemeProvider themefalse =
        Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'Todays Task',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .themeChange();
              },
              icon: Icon(!themetrue.isDark
                  ? Icons.sunny
                  : Icons.nightlight_round_outlined))
        ],
      ),
      body: hometrue.todoList.isNotEmpty
          ? Column(
              children: [
                ...List.generate(
                  hometrue.todoList.length,
                  (index) => Card(
                    child: ListTile(
                      subtitle: Text(hometrue.todoList[index].datetime),
                      title: Text(
                          '${hometrue.todoList[index].task}\n${hometrue.todoList[index].description}'),
                      leading: Checkbox(
                        value: hometrue.todoList[index].isCompleted,
                        onChanged: (value) {
                          hometrue.toggleCompleted(index);
                        },
                      ),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  txtTask.text =
                                      hometrue.todoList[index].task;
                                  txtdescription.text = hometrue.todoList[index].description;
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Padding(
                                        padding: EdgeInsets.all(3),
                                        child: Form(
                                            key: formkey,
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Update Task',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                TextFormField(
                                                  controller: txtTask,
                                                  decoration: InputDecoration(
                                                    label: Text('Todo'),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          color: Colors.blue,
                                                          width: 3),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                TextField(
                                                  controller: txtdescription,
                                                  maxLines: 2,
                                                  decoration: InputDecoration(
                                                    label: Text('Description'),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          color: Colors.blue,
                                                          width: 3),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              if (formkey.currentState!
                                                  .validate()) {
                                                Navigator.of(context).pop();
                                                hometrue.updatestudent(
                                                    txtdescription!.text,
                                                    txtTask!.text,
                                                    DateTime.now(),
                                                    index);
                                              }
                                            },
                                            child: Text('Save'))
                                      ],
                                    ),
                                  );
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  homefalse.removestudent(index);
                                },
                                icon: Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          : Center(
              child: Text('Add Your Todays Task'),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          txtTask = TextEditingController();
          txtdescription = TextEditingController();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Padding(
                padding: EdgeInsets.all(2),
                child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Text(
                          "Add Task",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: txtTask,
                          decoration: InputDecoration(
                            label: Text("Task"),
                            labelStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: txtdescription,
                          maxLines: 2,
                          decoration: InputDecoration(
                            label: Text("Description"),
                            labelStyle: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    )),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      //Navigator.of(context).pop();
                      homefalse.addTask(
                        txtdescription!.text,
                        txtTask!.text,
                        DateTime.now(),
                      );
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
