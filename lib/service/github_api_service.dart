import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/repository.dart';
import '../models/commit.dart';

class GithubApiService {
  Future<List<Repository>> fetchRepositories(String user) async {
    final response = await http.get(Uri.parse('https://api.github.com/users/$user/repos'));
    if (response.statusCode == 200) {
      List<dynamic> repoJsonList = json.decode(response.body);
      return repoJsonList.map((json) => Repository.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load repositories');
    }
  }

  Future<Commit> fetchLastCommit(String owner, String repoName) async {
    final response = await http.get(Uri.parse('https://api.github.com/repos/$owner/$repoName/commits'));
    if (response.statusCode == 200) {
      List<dynamic> commits = json.decode(response.body);
      return Commit.fromJson(commits.first);
    } else {
      throw Exception('Failed to load commit data');
    }
  }
}
