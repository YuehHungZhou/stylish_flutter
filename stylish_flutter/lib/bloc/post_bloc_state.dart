import 'package:stylish_flutter/network/GetProductResponse.dart';

abstract class IPostState {}

class PostLoading extends IPostState {}

class PostSuccess extends IPostState {
  final List<GetProductResponse> postList;
  PostSuccess(this.postList);
}
