import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(label: 'Submit', icon: Icons.check, position: IconPosition.right, buttonType: ButtonType.primary, onPressed: ()=> debugPrint('Submitted!'),
              ),
              const SizedBox(height: 16),
              CustomButton(label: 'Time', icon: Icons.timelapse, buttonType: ButtonType.secondary, onPressed: ()=> debugPrint('Time!'),
              ),
              const SizedBox(height: 16),
              CustomButton(label: 'Account', icon: Icons.account_box, buttonType: ButtonType.disabled
              ),
            ],
          )
        )
      )
    )
  );
}


enum ButtonType {primary, secondary, disabled}
enum IconPosition {left, right}

class CustomButton extends StatelessWidget{
  final String label;
  final IconData icon;
  final IconPosition position;
  final ButtonType buttonType;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.position = IconPosition.left,
    this.buttonType = ButtonType.primary,
    this.onPressed,
  });

  Color getButtonColor(){
    switch(buttonType){
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey; 
    }
  }

  bool get isDisabled => buttonType == ButtonType.disabled;

  @override
Widget build(BuildContext context) {
  return SizedBox(
    width: 300,
    height: 50, 
    child: ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: getButtonColor(),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: position == IconPosition.left
            ? [
                Icon(icon, size: 20),
                const SizedBox(width: 8),
                Text(label),
              ]
            : [
                Text(label),
                const SizedBox(width: 8),
                Icon(icon, size: 20),
              ],
      ),
    ),
  );
}
  
}