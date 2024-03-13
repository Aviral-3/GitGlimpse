import 'package:flutter/material.dart';
import '../models/repository.dart';
import '../models/commit.dart';
import '../service/github_api_service.dart';

class RepoDetailsScreen extends StatefulWidget {
  final Repository repo;

  RepoDetailsScreen({required this.repo});

  @override
  _RepoDetailsScreenState createState() => _RepoDetailsScreenState();
}

class _RepoDetailsScreenState extends State<RepoDetailsScreen> {
  final GithubApiService _apiService = GithubApiService();
  late Future<Commit> _futureCommit;

  @override
  void initState() {
    super.initState();
    _futureCommit = _apiService.fetchLastCommit(widget.repo.owner, widget.repo.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.repo.name),
      ),
      body: FutureBuilder<Commit>(
        future: _futureCommit,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            return ListTile(
              title: Text('Last Commit'),
              subtitle: Text('${snapshot.data!.message} by ${snapshot.data!.author} on ${snapshot.data!.date}'),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
