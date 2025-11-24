public class Vendedor extends Pessoa {
    int salario;

    public Vendedor(String nome, String endereco, int telefone, int salario, int codigo) {
        super(nome, endereco, telefone, codigo);
        this.salario = salario;
    }

    public int getSalario() {
        return salario;
    }

    public void setSalario(int salario) {
        this.salario = salario;
    }
}
