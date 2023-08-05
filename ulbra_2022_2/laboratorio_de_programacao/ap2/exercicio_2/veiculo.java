public class veiculo {
    private boolean itsOn;
    public veiculo(boolean istOn){
        this.itsOn = istOn;
    }

    public String  start(){
        this.itsOn = true;
        return "Ligado";
    }
    
    public String  off(){
        this.itsOn = false;
        return "Desligado";
    }
    
    public boolean itsOn(){
        return itsOn;
    }

    
   

    
}
