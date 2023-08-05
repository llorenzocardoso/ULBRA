public class Ponto3d extends Ponto2d{
    double z;
    public Ponto3d(double x, double y,double z){
        super(x,y);
        this.z = z;

    }
    public String toString(){
        return super.toString()+", Z = "+z;
    }
}
