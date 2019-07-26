import 'package:human_anatomy/human_anatomy.dart';





class HumanAnatomyPage extends StatelessWidget {
  var _finalBodyPartList = [];

  @override
  Widget build(BuildContext context) async {
    return HumanAnatomy(
      onChanged: bodyPartList,
    );
  }
  void bodyPartList(List value) {
    _finalBodyPartList = value;
  }
}