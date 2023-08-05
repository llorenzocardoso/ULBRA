public class Automovel extends veiculo {
    public Automovel(boolean itsOn){
        super(itsOn);
    }
    public String off(){
        super.off();
        return  "Automovel desligado";
    }
    public  String start(){
        super.start();
        return "Automovel ligado";
    }
}
