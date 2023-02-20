class Next {
  Next({
    required this.href,
    required this.title,
  });

  String href;
  String title;

  factory Next.fromJson(Map<String, dynamic> json) => Next(
        href: json["href"] as String? ?? "",
        title: json["title"] as String? ?? "",
      );
}
