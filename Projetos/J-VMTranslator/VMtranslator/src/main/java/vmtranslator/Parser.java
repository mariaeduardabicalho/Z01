/**
 * Curso: Elementos de Sistemas
 * Arquivo: Parser.java
 * Created by Luciano Soares <lpsoares@insper.edu.br>
 * Date: 2/05/2017
 *
 * Adaptado por Rafael Corsi <rafael.corsi@insper.edu.br>
 * Date: 5/2018
 */
package vmtranslator;

import java.io.*;

/**
 * Encapsula o código de leitura. Carrega as instruções na linguagem de máquina virtual a pilha,
 * analisa, e oferece acesso aos comandos.
 * Além disso, remove todos os espaços em branco e comentários.
 */
public class Parser {

    public String currentCommand = "";  // comando atual
    private BufferedReader fileReader;  // leitor de arquivo

    /** Enumerator para os tipos de comandos de Linguagem de Máquina Virtua a Pilha. */
    public static enum CommandType {
        C_ARITHMETIC,      // comandos aritméticos
        C_PUSH,            // comandos de push
        C_POP,             // comandos de pop
        C_LABEL,           // label
        C_GOTO,            // comando goto
        C_IF,              // comando if-goto
        C_FUNCTION,        // declaracao de funcao
        C_RETURN,          // retorno de funcao
        C_CALL             // chamada de funcao
    }

    /**
     * Abre o arquivo de entrada VM e se prepara para analisá-lo.
     * @param file arquivo VM que será feito o parser.
     */
    public Parser(String file) throws FileNotFoundException {
        this.fileReader = new BufferedReader(new FileReader(file));
    }

    /**
     * Carrega um comando e avança seu apontador interno para o próxima
     * linha do arquivo de entrada. Caso não haja mais linhas no arquivo de
     * entrada o método retorna "Falso", senão retorna "Verdadeiro".
     * @return Verdadeiro se ainda há instruções, Falso se as instruções terminaram.
     */
    public Boolean advance() throws IOException {
    	if (fileReader.readLine() != null) {
    		currentCommand = fileReader.readLine();
    		return true;
    	}
    	else{
    		return false;
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
     *  C_PUSH para push, por exemplo push constant 1
     *  C_POP para pop, por exemplo pop constant 2
     * @param  command instrução a ser analisada.
     * @return o tipo da instrução.
     */
    public CommandType commandType(String command) {
    	String[] comandos = {"add","sub","neg","eq","gt","lt","and","or","not"};
    	if(command.startsWith("push")) {
    		return (CommandType.C_PUSH);
    	}
    	else if(command.startsWith("pop")) {
    		return(CommandType.C_POP);
    	}

    	if(command.startsWith("call")) {
    		return(CommandType.C_CALL);
    	}
    	if(command.startsWith("function")) {
    		return(CommandType.C_FUNCTION);
    	}
    	if(command.startsWith("goto")) {
    		return(CommandType.C_GOTO);
    	}
    	if(command.startsWith("if")) {
    		return(CommandType.C_IF);
    	}
    	if(command.startsWith("label")) {
    		return(CommandType.C_LABEL);
    	}
    	if(command.startsWith("return")) {
    		return(CommandType.C_RETURN);
    	}
    	for (int i = 0; i< comandos.length;i++) {
    		if (command.startsWith(comandos[i])){
    			return(CommandType.C_ARITHMETIC);
    		}
    	}
		return null;
    	
    }


    /**
     * Retorna o primeiro argumento de um comando push ou pop passada no argumento.
     * Se for um comando aritmético, retorna o próprio texto do comando
     * Deve ser chamado somente quando commandType() é diferente de C_RETURN.
     * @param  command instrução a ser analisada.
     * @return somente o símbolo ou o valor número da instrução.
     */
    public String arg1(String command) {
    	String argumento = "";
    	if (commandType(command) != CommandType.C_RETURN) {
	    	CommandType[] comandos = {CommandType.C_PUSH,CommandType.C_POP,CommandType.C_ARITHMETIC,CommandType.C_CALL,CommandType.C_FUNCTION,CommandType.C_GOTO,CommandType.C_IF,CommandType.C_LABEL};
	    	String[] argumentos;
	    	
			argumentos = command.split(" ");
			for (int i = 0; i<comandos.length; i++) {
				if (commandType(command) == comandos[i]) {
					if (commandType(command) == CommandType.C_ARITHMETIC){
						argumento = argumentos[0];
					}
					else {
						argumento = argumentos[1];	
					}
					
				}
			}
	    }
    	return argumento;
    }
    /**
     * Retorna o segundo argumento de um comando push ou pop passada no argumento.
     * Deve ser chamado somente quando commandType() é C_PUSH, C_POP, C_FUNCTION, ou C_CALL.
     * @param  command instrução a ser analisada.
     * @return o símbolo da instrução (sem os dois pontos).
     */
    public Integer arg2(String command) {
    	
    	int argumento = 0;
    	CommandType[] comandos = {CommandType.C_PUSH,CommandType.C_POP,CommandType.C_CALL,CommandType.C_FUNCTION};
    	String[] argumentos;
    	
		argumentos = command.split(" ");
		for (int i = 0; i<comandos.length; i++) {
			if (commandType(command) == comandos[i]) {
				argumento = Integer.parseInt(argumentos[2]);	
			}
		}
    
	return argumento;
    	
    }

    // fecha o arquivo de leitura
    public void close() throws IOException {
        fileReader.close();
    }

}
