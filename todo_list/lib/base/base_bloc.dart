import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo_list/base/base_event.dart';

abstract class BaseBloc {
  StreamController<BaseEvent> _eventStreamController = StreamController<BaseEvent> ();

  BaseBloc() {
    _eventStreamController.stream.listen((event){
      if (event is! BaseEvent) {
        throw Exception("Event not available");
      }
      dispatchEvent(event);
    });
  }

  void dispatchEvent(BaseEvent event);
  
  @mustCallSuper
  void dispose() {
    _eventStreamController.close();
  }
}