// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service_chopper.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ApiServiceChopper extends ApiServiceChopper {
  _$ApiServiceChopper([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ApiServiceChopper;

  @override
  Future<List<dynamic>> getPost() async {
    final Uri $url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    final Response $response =
        await client.send<List<dynamic>, List<dynamic>>($request);
    return $response.bodyOrThrow;
  }

  @override
  Future<void> deletePost(int postId) async {
    final Uri $url =
        Uri.parse('https://jsonplaceholder.typicode.com/posts/${postId}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    final Response $response = await client.send<void, void>($request);
    return $response.bodyOrThrow;
  }
}
