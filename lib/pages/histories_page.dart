import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:weather/db/moor_database.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[Expanded(child: _buildTaskList(context))],
        ));
  }

  StreamBuilder<List<Historie>> _buildTaskList(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return StreamBuilder(
      stream: database.watchAllHistories(),
      builder: (context, AsyncSnapshot<List<Historie>> snapshot) {
        final tasks = snapshot.data ?? List();

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (_, index) {
            final itemTask = tasks[index];
            return _buildListItem(itemTask, database);
          },
        );
      },
    );
  }

  Widget _buildListItem(Historie itemTask, AppDatabase database) {
    var color;
    if (itemTask.isWarm)
      color = Colors.red[600];
    else
      color = Colors.blue[600];
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => database.deleteHistory(itemTask),
        )
      ],
      child: Container(
        margin: EdgeInsets.all(1),
        color: Colors.grey[200],
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                itemTask.location,
                style: TextStyle(
                    color: Colors.grey[800], fontWeight: FontWeight.w600),
              ),
              Text(
                '${itemTask.temperature}°C',
                style: TextStyle(color: color),
              )
            ],
          ),
          subtitle: Text(
            itemTask.date?.toString() ?? 'No date',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
      ),
    );
  }
}
