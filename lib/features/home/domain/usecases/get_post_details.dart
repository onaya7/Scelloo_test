import '../../data/models/post_model.dart';
import '../repositories/home_repository.dart';

class GetPostDetails {
  final HomeRepository repository;

  GetPostDetails(this.repository);

  Future<Post> call(int id) async {
    return await repository.fetchPostDetails(id);
  }
}