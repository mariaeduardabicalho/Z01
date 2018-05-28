/**
 * Curso: Elementos de Sistemas
 * Arquivo: Parser.java
 */

package assembler;


import java.io.FileNotFoundException;
import java.util.Scanner;
import java.io.File;
/**
 * Encapsula o c�digo de leitura. Carrega as instru��es na linguagem assembly,
 * analisa, e oferece acesso as partes da instru��o  (campos e s�mbolos).
 * Al�m disso, remove todos os espa�os em branco e coment�rios.
 */
public class Parser {
    Scanner arquivo;
    String Comando;

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
    public Parser(String file) {


        try{
            File data = new File(file);
            this.arquivo = new Scanner(data);
        } catch (FileNotFoundException e){
            System.out.println("File not found");
            e.printStackTrace();
        }

    }

    /**
     * Carrega uma instru��o e avan�a seu apontador interno para o pr�xima
     * linha do arquivo de entrada. Caso n�o haja mais linhas no arquivo de
     * entrada o m�todo retorna "Falso", sen�o retorna "Verdadeiro".
     * @return Verdadeiro se ainda h� instru��es, Falso se as instru��es terminaram.
     */
    public Boolean advance() {
    	while (arquivo.hasNextLine()){
    	    String linha = arquivo.nextLine();
    	    linha = linha.trim();//remover espa�os em branco
    	    if (!linha.startsWith(";") || !linha.isEmpty()){
                linha.replace("\t","");
                this.Comando = linha;
                return true;
            }

        }
      
	    return false;
        
    }

    /**
     * Retorna o comando "intru��o" atual (sem o avan�o)
     * @return a instru��o atual para ser analilisada
     */
    public String command() {
    	return this.Comando;
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
        if(command.endsWith(":")){
            return CommandType.L_COMMAND;
        }
        else if (command.startsWith("leaw")){
            return CommandType.A_COMMAND;

        }
        else {
            return CommandType.C_COMMAND;
        }

    }

    /**
     * Retorna o s�mbolo ou valor num�rico da instru��o passada no argumento.
     * Deve ser chamado somente quando commandType() � A_COMMAND.
     * @param  command instru��o a ser analisada.
     * @return somente o s�mbolo ou o valor n�mero da instru��o.
     */
    public String symbol(String command) {
        String symbol = "";
        
        if(commandType(command) == CommandType.A_COMMAND){
        	
            for (int i = 0; i < command.length() ; i++) {
            	
                if(command.charAt(i)=='$'){
                    String Comando_novo = command.substring(i+1);
                    for (int e = 0; e < Comando_novo.length(); e++){
                    	
                    	if(Comando_novo.charAt(e)==' ' || Comando_novo.charAt(e) == ';' || Comando_novo.charAt(e) == ','){
                    		break;
                    	}
                    	symbol += Comando_novo.charAt(e);
                    }
                    	
                }
            }
        }
    	return symbol;
    }

    /**
     * Retorna o s�mbolo da instru��o passada no argumento.
     * Deve ser chamado somente quando commandType() � L_COMMAND.
     * @param  command instru��o a ser analisada.
     * @return o s�mbolo da instru��o (sem os dois pontos).
     */
    public String label(String command) {
        String symbol = "";
        if (commandType(command) == CommandType.L_COMMAND) {
            symbol = command.substring(0,-1);
        }
    	return symbol;
    }

    /**
     * Separa os mnem�nicos da instru��o fornecida em tokens em um vetor de Strings.
     * Deve ser chamado somente quando CommandType () � C_COMMAND.
     * @param  command instru��o a ser analisada.
     * @return um vetor de string contento os tokens da instru��o (as partes do comando).
     */
    public String[] instruction(String command) {
        String[] instructions = new String[3];
        command = command.replace(',',' ');
        instructions=command.split(" ");
        return instructions;
    }

}