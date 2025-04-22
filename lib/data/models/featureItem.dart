class FeatureItemModel {
  final String icon;
  final String text;

  const FeatureItemModel({required this.icon, required this.text});
}

class OnboardingData {
  static const List<FeatureItemModel> features = [
    FeatureItemModel(
      icon: "assets/organize.png",
      text: "Organize Your Finances in One Place",
    ),
    FeatureItemModel(
      icon: "assets/stats.png",
      text: "Track Your Financial Performance",
    ),

    FeatureItemModel(
      icon: "assets/WealthFlow.png",
      text: "Plan Your Financial Future",
    ),
    FeatureItemModel(icon: "assets/Frame.png", text: "Security You Can Trust"),
  ];
}
