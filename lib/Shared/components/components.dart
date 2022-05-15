import 'package:flutter/material.dart';
import 'package:news_udemy/modules/webVeiw/webVeiw.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget myDivider()=>Padding(
    padding: EdgeInsetsDirectional.only(start: 20),
  child: Container(
    color: Colors.grey[400],
    width: double.infinity,
    height: 1.5,
  ),
);

void navigateTo(context , widget) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget,)

);

Widget BuildarticaleItem(articale,context)=> InkWell(
 onTap: (){
   navigateTo(context, web_view(url:  articale['url'],));
 },
  child:   Padding(

    padding: EdgeInsets.all(20),

    child: Row(

      children: [

        Container(

          height: 130,

          width: 130,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10),

            image: DecorationImage(

              image: NetworkImage('${articale['urlToImage']}'),

              fit: BoxFit.cover

            )

          ),

        ),

        SizedBox(width: 20,),

        Expanded(

          child: Container(

            height: 130,

            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Expanded(child: Text('${articale['title']}',

                style: Theme.of(context).textTheme.bodyText1,

                  overflow: TextOverflow.ellipsis,

                  maxLines: 3,

                )),

                Text('${articale['publishedAt']}',

                style: TextStyle(

                  color: Colors.grey

                ),),

              ],

            ),

          ),

        )

      ],

    ),

  ),
);

Widget ArticlaeBuilder (list , context) => list.length > 0 ?
    ListView.separated(
  physics:  BouncingScrollPhysics(),
    itemBuilder: (context, index) {
    return  BuildarticaleItem(list[index],context);
    },
    separatorBuilder: (context, index) => myDivider(),
    itemCount: list.length
) : Center(child: CircularProgressIndicator(),);

Widget defultTextFeild({
  required String label,
  required TextEditingController controller,
  required String? Function(String?)? validator,
   void Function(String)? onChanged,
  IconData? icon,

  TextInputType? type,

}) => TextFormField(
    onChanged: onChanged,
  controller: controller,
  validator:validator ,
  keyboardType: type ,

  decoration: InputDecoration(
    label: Text(label),
    border: OutlineInputBorder(),
    prefixIcon: Icon(icon),




  ),
    );