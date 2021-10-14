class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Save Prescriptions',
      image: 'https://assets8.lottiefiles.com/packages/lf20_s6bvy00o.json',
      discription: "Allows you to save unlimited prescriptions lifetime  "
  ),
  UnbordingContent(
      title: 'Get different Health Trackers',
      image: 'https://assets10.lottiefiles.com/packages/lf20_pk5mpw6j.json',
      discription: "There are three trackers which will help you to stay fit"
  ),
  UnbordingContent(
      title: 'Get help and support from us',
      image: 'https://assets10.lottiefiles.com/packages/lf20_ucNN0e.json',
      discription: "Allows to get helps for bugs, fixes need to be done in the app"

  ),
];