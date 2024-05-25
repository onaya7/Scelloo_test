import '../../data/models/post_model.dart';
import '../repositories/home_repository.dart';

class GetPosts {
  final HomeRepository repository;

  GetPosts(this.repository);

  Future<List<Post>> call() async {
    return await repository.fetchPosts();
  }
}
