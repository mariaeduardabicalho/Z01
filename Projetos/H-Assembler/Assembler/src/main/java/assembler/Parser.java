/**
 * Curso: Elementos de Sistemas
 * Arquivo: Parser.java
 * Created by Luciano Soares <lpsoares@insper.edu.br> 
 * Date: 04/02/2017
 */

package assembler;

import java.io.*;

/**
 * Encapsula o código de leitura. Carrega as instruções na linguagem assembly,
 * analisa, e oferece acesso as partes da instrução  (campos e símbolos).
 * Além disso, remove todos os espaços em branco e comentários.
 */
public class Parser {

    public String currentCommand = "";  // comando atual
    public String inputFile;		    // arquivo de leitura
    public int lineNumber = 0;			// linha atual do arquivo (nao do codigo gerado)
    public String currentLine;			// linha de codigo atual
    boolean simulator;                  // Testa se é para simulador e descarta limitações do hardware do Z0
    private BufferedReader fileReader;  // leitor de arquivo

    /** Enumerator para os tipos de comandos do Assembler. */
    public enum CommandType {
        A_COMMAND,      // comandos LEA, que armazenam no registrador A
        C_COMMAND,      // comandos de calculos
        L_COMMAND       // comandos de Label (símbolos)
    }

    /** 
     * Abre o arquivo de entrada NASM e se prepara para analisá-lo.
     * @param file arquivo NASM que será feito o parser.
     */
    public Parser(String file) throws FileNotFoundException {
        this.inputFile = file;
        this.fileReader = new BufferedReader(new FileReader(file));
        this.lineNumber = 0;
        this.simulator = false;
    }

    /**
     * Carrega uma instrução e avança seu apontador interno para o próxima
     * linha do arquivo de entrada. Caso não haja mais linhas no arquivo de
     * entrada o método retorna "Falso", senão retorna "Verdadeiro".
     * @return Verdadeiro se ainda há instruções, Falso se as instruções terminaram.
     */
    public Boolean advance() throws IOException {
        while(true){
            currentLine = fileReader.readLine();
            lineNumber++;
            if (currentLine == null)
                return false;  // caso não haja mais comandos
            currentCommand = currentLine.replaceAll(";.*$", "").trim();
            if (currentCommand.equals(""))
                continue;
            return true;   // caso um comando seja encontrado
        }
    }

    /**
     * Retorna o comando "intrução" atual (sem o avanço)
     * @return a instrução atual para ser analilisada
     */
    public String command() {
      return currentCommand;
    }

    /**
     * Retorna o tipo da instrução passada no argumento:
     *  A_COMMAND para leaw, por exemplo leaw $1,%A
     *  L_COMMAND para labels, por exemplo Xyz: , onde Xyz é um símbolo.
     *  C_COMMAND para todos os outros comandos
     * @param  command instrução a ser analisada.
     * @return o tipo da instrução.
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
     * Retorna o símbolo ou valor numérico da instrução passada no argumento.
     * Deve ser chamado somente quando commandType() é A_COMMAND.
     * @param  command instrução a ser analisada.
     * @return somente o símbolo ou o valor número da instrução.
     */
    public String symbol(String command)  {
        String[] array = command.split("[ ,]+");
        return array[1].substring(1);
    }

    /**
     * Retorna o símbolo da instrução passada no argumento.
     * Deve ser chamado somente quando commandType() é L_COMMAND.
     * @param  command instrução a ser analisada.
     * @return o símbolo da instrução (sem os dois pontos).
     */
    public String label(String command) {
        if (command.endsWith(":")) {
            return command.replace(":", "");
        }
        return command ;
    }

    /**
     * Separa os mnemônicos da instrução fornecida em tokens em um vetor de Strings.
     * Deve ser chamado somente quando CommandType () é C_COMMAND.
     * @param  command instrução a ser analisada.
     * @return um vetor de string contento os tokens da instrução (as partes do comando).
     */
    public String[] instruction(String command) {
        return command.split("[ ,]+");
    }

    // fecha o arquivo de leitura
    public void close() throws IOException {
        fileReader.close();
    }

    // Em caso de simulação, vai permitir certas operações
    public void setSimulator(boolean testSimulator) {
      this.simulator = testSimulator;
    }
    
    // Pega o valor da flag de simulador
    public boolean getSimulator() {
      return this.simulator;
    }

}
