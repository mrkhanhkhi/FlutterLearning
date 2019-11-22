import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_search/ui/search/search_bloc.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selection =
            TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search video',
            border: InputBorder.none,
            icon: Icon(Icons.search, color: Colors.black.withOpacity(0.5))),
        onSubmitted: (searchQuery) {
          BlocProvider.of<SearchBloc>(context).onSearchInitiated(searchQuery);
        },
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }
}
