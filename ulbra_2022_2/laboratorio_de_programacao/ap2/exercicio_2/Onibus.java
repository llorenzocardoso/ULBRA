public class Onibus extends veiculo {
    public Onibus(boolean itsOn) {
        super(itsOn);
    }

    public String off(){
        super.off();
        return  "Onibus desligado";
    }

    public  String start(){
        super.start();
        return "Onibus ligado";
    }
}
