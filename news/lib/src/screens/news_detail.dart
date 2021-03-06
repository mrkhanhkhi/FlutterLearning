import 'package:flutter/material.dart';
import 'package:news/src/blocs/comments_bloc.dart';
import '../blocs/comments_provider.dart';
import '../model/item_model.dart';
import 'dart:async';

class NewsDetail extends StatelessWidget {
  final int itemId;
  
  NewsDetail({this.itemId});

  @override
  Widget build(BuildContext context) {
    final bloc = CommentsProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: buildBody(bloc),
    );
  }

  Widget buildBody(CommentsBloc bloc) {
    return StreamBuilder(
      stream: bloc.itemWithComments,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading');
        }
        final itemFuture = snapshot.data[itemId];

        return FutureBuilder(
          future: itemFuture,
          builder: (context , AsyncSnapshot<ItemModel> itemSnapshot) {
            if (!snapshot.hasData) {
           return Text('Loading');
        }
        return buildtitle(itemSnapshot.data);
          },
        );
      },
    );
  }

  Widget buildtitle(ItemModel item) {
    return Container(
      margin: EdgeInsets.all(10.0),
      alignment: Alignment.topCenter,
      child: Text(
        item.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}