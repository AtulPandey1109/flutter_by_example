
import 'package:chopper/chopper.dart';
part 'api_service_chopper.chopper.dart';


@ChopperApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class ApiServiceChopper extends ChopperService{
  @Get(path:'/posts')
  Future<List<dynamic>> getPost();

  @Delete(path:'/posts/{id}')
  Future<void> deletePost(@Path('id') int postId);

  static ApiServiceChopper create(){
    final client = ChopperClient(
      services: [
        _$ApiServiceChopper(),
      ],
      converter: const JsonConverter()
    );
    return _$ApiServiceChopper(client);
  }
}