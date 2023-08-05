package ex1;
public class relogio {
    ponteiro ponteiroHora = new ponteiro();
    ponteiro ponteiroMinuto = new ponteiro();
    ponteiro ponteiroSegundo = new ponteiro();

    public void acertarRelogio(int hora, int minuto, int segundo){
        ponteiroHora.posicao = hora;
        ponteiroMinuto.posicao = minuto / 5;
        ponteiroSegundo.posicao = segundo / 5;
    }

    public int lerHora(){
        return ponteiroHora.posicao;
    }
    public int lerMinuto(){
        return ponteiroMinuto.posicao * 5;
    }
    public int lerSegundo(){
        return ponteiroSegundo.posicao * 5;
    }

}
