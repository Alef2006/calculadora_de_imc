



class HomeController {

  String calculate({
    required double peso,
    required  double altura
    }){
    
    
     
     double  result=peso/(altura*altura);
    if(result<18.6){
      return "Abaixo do peso (${result.toStringAsPrecision(3)})";
    }else if(result>=18.6 && result<24.9 ){
      return "Peso ideal (${result.toStringAsPrecision(3)})";
    }else if(result>=24.9 && result <29.9){
      return "Levemente acima do peso (${result.toStringAsPrecision(3)})";
    }else if(result>=29.9 && result<34.9){
       return "Obesidade grau I  (${result.toStringAsPrecision(3)})";
    }else if(result>=34.9 && result < 39.9){
       return "Obesidade grau II (${result.toStringAsPrecision(3)})";
    }else if(result>=40){
      return "Obesidade grau III (${result.toStringAsPrecision(3)})";
    }else{
      return result.toStringAsPrecision(3);
    }
     
  }


}