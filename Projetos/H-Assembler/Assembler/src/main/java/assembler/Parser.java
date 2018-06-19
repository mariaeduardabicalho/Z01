/**
 * Curso: Elementos de Sistemas
 * Arquivo: Parser.java
 * Created by Luciano Soares <lpsoares@insper.edu.br> 
 * Date: 04/02/2017
 */

package assembler;

import java.io.*;

/**
 * Encapsula o c�digo de leitura. Carrega as instru��es na linguagem assembly,
 * analisa, e oferece acesso as partes da instru��o  (campos e s�mbolos).
 * Al�m disso, remove todos os espa�os em branco e coment�rios.
 */
public class Parser {

    public String currentCommand = "";  // comando atual
    public String inputFile;		    // arquivo de leitura
    public int lineNumber = 0;			// linha atual do arquivo (nao do codigo gerado)
    public String currentLine;			// linha de codigo atual
    boolean simulator;                  // Testa se � para simulador e descarta limita��es do hardware do Z0
    private BufferedReader fileReader;  // leitor de arquivo

    /** Enumerator para os tipos de comandos do Assembler. */
    public enum CommandType {
        A_COMMAND,      // comandos LEA, que armazenam no registrador A
        C_COMMAND,      // comandos de calculos
        L_COMMAND       // comandos de Label (s�mbolos)
    }

    /** 
     * Abre o arquivo de entrada NASM e se prepara para analis�-lo.
     * @param file arquivo NASM que ser� feito o parser.
     */
    public Parser(String file) throws FileNotFoundException {
        this.inputFile = file;
        this.fileReader = new BufferedReader(new FileReader(file));
        this.lineNumber = 0;
        this.simulator = false;
    }

    /**
     * Carrega uma instru��o e avan�a seu apontador interno para o pr�xima
     * linha do arquivo de entrada. Caso n�o haja mais linhas no arquivo de
     * entrada o m�todo retorna "Falso", sen�o retorna "Verdadeiro".
     * @return Verdadeiro se ainda h� instru��es, Falso se as instru��es terminaram.
     */
    public Boolean advance() throws IOException {
        while(true){
            currentLine = fileReader.readLine();
            lineNumber++;
            if (currentLine == null)
                return false;  // caso n�o haja mais comandos
            currentCommand = currentLine.replaceAll(";.*$", "").trim();
            if (currentCommand.equals(""))
                continue;
            return true;   // caso um comando seja encontrado
        }
    }

    /**
     * Retorna o comando "intru��o" atual (sem o avan�o)
     * @return a instru��o atual para ser analilisada
     */
    public String command() {
      return currentCommand;
    }

    /**
     * Retorna o tipo da instru��o passada no argumento:
     *  A_COMMAND para leaw, por exemplo leaw $1,%A
     *  L_COMMAND para labels, por exemplo Xyz: , onde Xyz � um s�mbolo.
     *  C_COMMAND para todos os outros comandos
     * @param  command instru��o a ser analisada.
     * @return o tipo da instru��o.
     */
    public CommandType commandType(String command) {
        if (command.startsWith("lea")) {
            return CommandType.A_COMMAND;  // A_COMMAND for lea xxx
        } else if (command.endsWith(":")) {
            return CommandType.L_COMMAND;  // L_COMMAND for a label, xxx:
        } else {
            return CommandType.C_COMMAND;  // C_COMMAND for mov, etc...
        }
    }

    /**
     * Retorna o s�mbolo ou valor num�rico da instru��o passada no argumento.
     * Deve ser chamado somente quando commandType() � A_COMMAND.
     * @param  command instru��o a ser analisada.
     * @return somente o s�mbolo ou o valor n�mero da instru��o.
     */
    public String symbol(String command) {
        String[] array = command.split("[ ,]+");
        return array[1].substring(1);
    }

    /**
     * Retorna o s�mbolo da instru��o passada no argumento.
     * Deve ser chamado somente quando commandType() � L_COMMAND.
     * @param  command instru��o a ser analisada.
     * @return o s�mbolo da instru��o (sem os dois pontos).
     */
    public String label(String command){
        if (command.endsWith(":")) {
            return command.replace(":", "");
        } 
        return command;
    }


    public String[] instruction(String command) {
        return command.split("[ ,]+");
    }

    // fecha o arquivo de leitura
    public void close() throws IOException {
        fileReader.close();
    }

    // Em caso de simula��o, vai permitir certas opera��es
    public void setSimulator(boolean testSimulator) {
      this.simulator = testSimulator;
    }
    
    // Pega o valor da flag de simulador
    public boolean getSimulator() {
      return this.simulator;
    }

}
