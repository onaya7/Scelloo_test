import '../../data/models/post_model.dart';
import '../repositories/home_repository.dart';

class DeletePost {
  final HomeRepository repository;

  DeletePost(this.repository);

  Future<Post> call(int id) async {
    return await repository.deletePost(id);
  }
}
