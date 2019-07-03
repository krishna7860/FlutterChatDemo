import 'package:flutter/material.dart';
import 'chatmessage.dart';
class Chatscreen extends StatefulWidget {
  @override
  _ChatscreenState createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {

  final TextEditingController _textEditingController= new TextEditingController();
  final List<ChatMessage> _message = <ChatMessage>[];

  Widget _textComposerWidget(){
   return IconTheme(
     data:new IconThemeData(
       color:Colors.blue,
     ),
     child: Container(
       margin: const EdgeInsets.symmetric(horizontal: 8.0),
       child: new Row(
          children: <Widget>[
            new Flexible( child: new TextField(
              decoration: InputDecoration.collapsed(hintText: "Send A Message"),
              controller: _textEditingController,
              onSubmitted: _handleSubmit,
            )
            ),
            new Container(
              margin:const EdgeInsets.symmetric(horizontal: 4.0),
              child:new IconButton(icon:new Icon(Icons.send),
                  onPressed:() => _handleSubmit(_textEditingController.text),
              ),
            )
          ],
       ),
     ),
   ) ;
 }

 void _handleSubmit(String text){
    _textEditingController.clear();
    ChatMessage message =  new ChatMessage(text: text);
    setState(() {
      _message.insert(0, message);
    });

 }

  @override
  Widget build(BuildContext context) {
        return new Column(
          children: <Widget>[
            new Flexible(child:new ListView.builder(
              padding:const EdgeInsets.all(8.0),
              reverse:true,
              itemBuilder:(_,int index)=>_message[index],
              itemCount:_message.length,
            )
            ),
            new Divider(height: 1.0,),
            new Container(
              decoration: new BoxDecoration(color:Theme.of(context).cardColor,),
              child: _textComposerWidget(),
            )
          ],
        );
  }
}
