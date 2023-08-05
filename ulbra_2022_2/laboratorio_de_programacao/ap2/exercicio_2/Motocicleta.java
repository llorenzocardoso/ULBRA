public class Motocicleta extends veiculo{
    public Motocicleta(boolean itsOn) {
        super(itsOn);
    }

    public String off(){
        super.off();
        return  "Motocicleta desligada";
    }

    public  String start(){
        super.start();
        return "Motocicleta ligada";
    }
}
