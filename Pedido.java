import java.sql.Date;

public class Pedido {
    int numero;
    String status;
    Date data, dataPrevista;

    public Pedido(int numero, String status, Date data, Date dataPrevista) {
        this.numero = numero;
        this.status = status;
        this.data = data;
        this.dataPrevista = dataPrevista;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Date getDataPrevista() {
        return dataPrevista;
    }

    public void setDataPrevista(Date dataPrevista) {
        this.dataPrevista = dataPrevista;
    }
}
