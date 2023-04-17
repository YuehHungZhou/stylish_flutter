import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_flutter/bloc/post_bloc_state.dart';

import '../network/ApiServise.dart';
import '../network/GetProductResponse.dart';

class PostCubit extends Cubit<IPostState> {
  List<GetProductResponse> postList = [];

  PostCubit() : super(PostLoading());

  Future<void> fetchData() async {
    postList = await ApiServise().getAllProducts() ?? [];
    emit(PostSuccess(postList));
  }
}
