import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Post {
  String text;
  int likes;
  Set<String> likedUsers;

  Post(
    this.text,
    this.likes,
  ) : likedUsers = {};
}
}
}
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Post> posts = [];

  TextEditingController controller = TextEditingController();

  void addPost() {
    setState(() {
      posts.insert(0, Post(controller.text, 0));
      controller.clear();
    });
  }

  void likePost(int index) {
  setState(() {
    final post = posts[index];
    const userId = "user";

    if (post.likedUsers.contains(userId)) {
      post.likedUsers.remove(userId);
      post.likes--;
    } else {
      post.likedUsers.add(userId);
      post.likes++;
    }
  });
}
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("AI Social Sim")),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: "Напиши пост...",
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: addPost,
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(posts[index].text),
                      subtitle: Text("❤️ ${posts[index].likes}"),
                      trailing: IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () => likePost(index),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
