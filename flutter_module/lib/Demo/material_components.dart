import 'package:flutter/material.dart';
import 'form_demo.dart';
import 'popup_menu_button_demo.dart';
import 'radio_demo.dart';
import 'checkbox_demo.dart';
import 'switch_demo.dart';
import 'slider_demo.dart';
import 'datetime_demo.dart';
import 'simple_dialog_demo.dart';
import 'alert_dialog_demo.dart';
import 'bottom_sheet_demo.dart';
import 'snack_bar_demo.dart';
import 'expansion_panel_demo.dart';
import 'chip_demo.dart';
import 'data_table_demo.dart';
import 'paginated_data_table_demo.dart';
import 'card_demo.dart';
import 'stepper_demo.dart';
import 'state_management_demo.dart';
import 'stream_demo.dart';
import 'rxdart_demo.dart';
import 'bloc_demo.dart';

class MaterialComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponent'),
        elevation: 0.0,
      ),
      body: ListView(
        children: [

          ListItem(title: 'BlocDemo',page: BlocDemo()),
          ListItem(title: 'RxDartDemo',page: RxDartDemo()),
          ListItem(title: 'StreamDemo',page: StreamDemo()),
          ListItem(title: 'StateManagementDemo',page: StateManagementDemo()),
          ListItem(title: 'StepperDemo',page: StepperDemo()),
          ListItem(title: 'CardDemo',page: CardDemo()),
          ListItem(title: 'PostDataSource',page: PaginatedDataTableDemo()),
          ListItem(title: 'DataTableDemo',page: DataTableDemo()),
          ListItem(title: 'ChipDemo',page: ChipDemo()),
          ListItem(title: 'ExpansionPanelDemo',page: ExpansionPanelDemo()),
          ListItem(title: 'SnackBarDemo',page: SnackBarDemo()),
          ListItem(title: 'BottomSheetDemo',page: BottomSheetDemo()),
          ListItem(title: 'AlertDialogDemo',page: AlertDialogDemo()),
          ListItem(title: 'SimpleDialogDemo',page: SimpleDialogDemo()),
          ListItem(title: 'DateTimeDemo',page: DateTimeDemo()),
          ListItem(title: 'SliderDemo',page: SliderDemo()),
          ListItem(title: 'SwifchDemo',page: SwifchDemo()),
          ListItem(title: 'CheckboxDemo',page: CheckboxDemo()),
          ListItem(title: 'Button',page: ButtonDdemo()),
          ListItem(title: 'from',page: FromDemo()),
          ListItem(title: 'FloatingActionButton',page: FloatingActionButtonDemo()),
          ListItem(title: 'PopupMenuButton', page: PopupMenuButtonDemo()),
          ListItem(title: 'radio', page: RadioDemo()),
        ],
      ),
    );
  }
}

class ButtonDdemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 垂直居中
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  child: Text('Button'),
                  onPressed: (){},
                  splashColor: Colors.grey, //背景波纹效果
                  textColor: Colors.deepPurple,
                ),
                FlatButton.icon(
                  icon: Icon(Icons.add),
                  label: Text('Button'),
                  onPressed: (){},
                  splashColor: Colors.grey, //背景波纹效果
                  textColor: Theme.of(context).accentColor,
                ),
                SizedBox(width: 16.0,),
//                RaisedButton(
//                  child: Text('Button'),
//                  onPressed: (){},
//                  splashColor: Colors.grey, //背景波纹效果
//                  textColor: Theme.of(context).accentColor,
//                  elevation: 12.0, //与下面的距离
//                  color: Colors.red,
//                  textTheme: ButtonTextTheme.primary, //背景颜色
//                ),
              Container(
                width: 130,
                child: OutlineButton(
                  child: Text('Button'),
                  onPressed: (){},
                  splashColor: Colors.grey[100], //背景波纹效果
                  textColor: Theme.of(context).accentColor,
                  highlightedBorderColor: Colors.red,
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                ),
              )
              ],
            )
          ],

        ),
      ),
    );
  }
}

class _WiggetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("_WiggetDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 垂直居中
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              ],
            )
          ],

        ),
      ),
    );
  }
}

class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget _floatingActionButton = FloatingActionButton(
      onPressed: (){},
      child: Icon(Icons.add),
      elevation: 0.0,
      backgroundColor: Colors.black87,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;
  ListItem({
    this.title,
    this.page
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
