public class Pedido_Modelo {
    int id,qtd;
    String obs;

    public Pedido_Modelo(int id, int qtd, String obs) {
        this.id = id;
        this.qtd = qtd;
        this.obs = obs;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQtd() {
        return qtd;
    }

    public void setQtd(int qtd) {
        this.qtd = qtd;
    }

    public String getObs() {
        return obs;
    }

    public void setObs(String obs) {
        this.obs = obs;
    }
}