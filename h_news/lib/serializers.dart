library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/json_object.dart';
import 'json_parsing.dart';

part 'serializers.g.dart';

/// Collection of generated serializers for the built_value chat example.
@SerializersFor([
  Article,
])
Serializers serializers = _$serializers;

Serializers standardSerializers = 
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();