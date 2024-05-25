import '../../data/models/post_model.dart';
import '../repositories/home_repository.dart';

class UpdatePost {
  final HomeRepository repository;

  UpdatePost(this.repository);

  Future<Post> call(int id, Map<String, dynamic> data) async {
    return await repository.updatePost(id, data);
  }
}
