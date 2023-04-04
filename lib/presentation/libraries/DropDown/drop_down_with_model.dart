import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';

class DropDownWithModel extends StatefulWidget {
  final OptionItem itemSelected;
  final DropListModel dropListModel;
  final Function(OptionItem optionItem) onOptionSelected;

  const DropDownWithModel({Key? key, required this.itemSelected, required this.dropListModel, required this.onOptionSelected}) : super(key: key);

  @override
  _DropDownWithModelState createState() => _DropDownWithModelState();
}

class _DropDownWithModelState extends State<DropDownWithModel> with SingleTickerProviderStateMixin {

  late AnimationController expandController;
  late Animation<double> animation;

  bool isShow = false;


  @override
  void initState() {
    super.initState();
    expandController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 350)
    );
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    _runExpandCheck();
  }

  void _runExpandCheck() {
    if(isShow) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.0, color: Colors.white),),
            //color: Color(0xC9212121),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /*Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Icon(widget.ic, color: widget.icColor,),
              ),*/

              Expanded(
                  child: GestureDetector(
                    onTap: () {
                      isShow = !isShow;
                      _runExpandCheck();
                      setState(() {

                      });
                    },
                    child: Text(widget.itemSelected.title, style: const TextStyle(
                        color: AppColor.white,
                        fontSize: 12),),
                  )
              ),
              Align(
                alignment: const Alignment(1, 0),
                child: Icon(
                  isShow ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                  color: AppColor.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        SizeTransition(
            axisAlignment: 1.0,
            sizeFactor: animation,
            child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                ),
                child: _buildDropListOptions(widget.dropListModel.listOptionItems, context)
            )
        ),
//          Divider(color: Colors.grey.shade300, height: 1,)
      ],
    );
  }

  Column _buildDropListOptions(List<OptionItem> items, BuildContext context) {
    return Column(
      children: items.map((item) => _buildSubMenu(item, context)).toList(),
    );
  }

  Widget _buildSubMenu(OptionItem item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26.0, top: 5, bottom: 5),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(top: 5, bottom: 8, right: 35),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1)),
                ),
                child: Text(
                    item.title,
                    style: const TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          widget.onOptionSelected(item);
          isShow = false;
          expandController.reverse();
          widget.onOptionSelected(item);
        },
      ),
    );
  }

}

class DropListModel {
  DropListModel(this.listOptionItems);

  final List<OptionItem> listOptionItems;
}

class OptionItem {
  String id;
  String title;

  OptionItem({required this.id, required this.title});
}