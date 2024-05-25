import '../../data/models/post_model.dart';
import '../repositories/home_repository.dart';

class CreatePost {
  final HomeRepository repository;

  CreatePost(this.repository);

  Future<Post> call(Map<String, dynamic> data) async {
    return await repository.createPost(data);
  }
}
