import 'package:flutter/material.dart';

class SobreScreen extends StatefulWidget {
  @override
  _SobreScreenState createState() => _SobreScreenState();
}

class _SobreScreenState extends State<SobreScreen>
    with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> animationOpen;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3)
    );
    animationOpen = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.1, 1.0, curve: Curves.elasticOut)
    );
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;
    final double mapsSize = screenSize.width * 0.4;
    final double imageSize = screenSize.height * 0.4;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Image.asset("images/loja.jpg",
              fit: BoxFit.cover,
              width: screenSize.width,
              height: imageSize,
            ),
            AnimatedBuilder(
              animation: animationOpen,
              builder: (context, child) => Card(
                elevation: 10,
                margin: EdgeInsets.only(top: (imageSize - (mapsSize / 2)), left: 20),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/maps.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: mapsSize * (animationOpen.value > 0 ? animationOpen.value : 0.0),
                  height: mapsSize * (animationOpen.value > 0 ? animationOpen.value : 0.0),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Av. 18 de abril, Centro de São Paulo - SP Brasil",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300
                ),
              ),
              SizedBox(height: 10,),
              _title("Sobre a loja"),
              SizedBox(height: 10,),
              _content("Estamos no mercado a mais de 5 anos, já atendemos diversos clientes de todas as regiões do Brasil."),
              _content("Nós nos orgulhamos por nosso compromentimento com nossos clientes."),
              SizedBox(height: 10,),
               _title("Entre em contato"),
              SizedBox(height: 10,),
              _contact("(00) 000000000 - Whatsapp", false),
              SizedBox(height: 8,),
              _contact("0000-0000 - Telefone", false),
              SizedBox(height: 8,),
              _contact("bazzaar@atendimento.com", true),
            ],
          ),
        )
      ],
    );
  }

  Widget _title(title){
    return Text(title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline
      ),
    );
  }

  Widget _content(content){
    return Text(content,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
      textAlign: TextAlign.justify,
    );
  }

  Widget _contact(contact, bool underline){
    return Text(contact,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        decoration: underline ? TextDecoration.underline : TextDecoration.none
      ),
    );
  }

}