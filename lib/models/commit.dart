class Commit {
  final String message;
  final String author;
  final String date;

  Commit({required this.message, required this.author, required this.date});

  factory Commit.fromJson(Map<String, dynamic> json) {
    return Commit(
      message: json['commit']['message'],
      author: json['commit']['author']['name'],
      date: json['commit']['author']['date'],
    );
  }
}
