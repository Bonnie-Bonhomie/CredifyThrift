import 'package:credify/export_barrel.dart';

class AvailableSavings extends StatelessWidget {
  const AvailableSavings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          GradientContainer(child: Column(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.close), style: IconButton.styleFrom(padding: const EdgeInsets.all(5), backgroundColor: Colors.white),)
            ],
          ))
        ],
      ),
    );
  }
}
