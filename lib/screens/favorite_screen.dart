import 'package:flutter/material.dart';
import 'package:user_carousel/dao/user_dao.dart';
import 'package:user_carousel/models/user.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<User> users;

  @override
  void initState() {
    super.initState();

    getUsers();
  }

  Future<void> getUsers() async {
    users = await userDao.getFavoriteUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: SafeArea(
        child: users == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(
                            users[index].avatarUrl,
                          ),
                          backgroundColor: Colors.grey,
                        ),
                        title: Text(users[index].username),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
