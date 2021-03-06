import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_infinite_list/bloc/bloc/delegate.dart';
import 'package:flutter_bloc_infinite_list/pages/home_page.dart';
import 'package:http/http.dart' as http;

import 'bloc/bloc/post_bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter infinite Scroll',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        body: BlocProvider(
          create: (context) =>
              PostBloc(httpClient: http.Client())..add(PostFetched()),
          child: HomePage(),
        ),
      ),
    );
  }
}
