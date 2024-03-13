import 'package:flutter/material.dart';
import 'package:gitglimpse/views/repo_details_screen.dart';
import '../service/github_api_service.dart';
import '../models/repository.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GithubApiService _apiService = GithubApiService();
  late Future<List<Repository>> _futureRepositories;

  @override
  void initState() {
    super.initState();
    _futureRepositories = _apiService.fetchRepositories('freeCodeCamp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Repositories'),
      ),
      body: FutureBuilder<List<Repository>>(
        future: _futureRepositories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                Repository repo = snapshot.data![index];
                return ListTile(
                  title: Text(repo.name),
                  subtitle: Text(repo.description),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RepoDetailsScreen(repo: repo),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
