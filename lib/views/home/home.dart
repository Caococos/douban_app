import 'package:douban_app/models/home_model.dart';
import 'package:douban_app/network/http_request.dart';
import 'package:douban_app/views/home/childCpns/movie_list_item.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("陈签影院")),
      ),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<MovieItem> movieItems = [];

  @override
  void initState() {
    super.initState();
    //网络数据请求
    HttpRequest.request("/movie/new_movies?apikey=0df993c66c0c636e29ecbb5344252a4a")
        .then((value) {
          final subjects = value.data["subjects"];
          List<MovieItem> movies = [];
          for(var sub in subjects) {
            movies.add(MovieItem.fromMap(sub));
          }
          setState(() {
            movieItems = movies;
          });
    }).catchError((err) => throw err);
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: movieItems.length,
          itemBuilder: (BuildContext context, int index) {
            return MovieListItem(movieItems[index]);
          }),
    );
  }
}

