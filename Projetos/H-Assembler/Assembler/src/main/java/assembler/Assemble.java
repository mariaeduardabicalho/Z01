/**
 * Curso: Elementos de Sistemas
 * Arquivo: Assemble.java
 * Created by Luciano <lpsoares@insper.edu.br> 
 * Date: 04/02/2017
 *
 * 2018 @ Rafael Corsi
 */

package assembler;

import java.io.*;
import java.util.*;
import assembler.Parser.CommandType;

/**
 * Faz a gera��o do c�digo gerenciando os demais m�dulos
 */
public class Assemble {
    private String inputFile;              // arquivo de entrada nasm
    File hackFile = null;                  // arquivo de sa�da hack
    private PrintWriter outHACK = null;    // grava saida do c�digo de m�quina em Hack
    boolean debug;                         // flag que especifica se mensagens de debug s�o impressas
    private SymbolTable table;             // tabela de s�mbolos (vari�veis e marcadores)

    /**
     * Retorna o c�digo bin�rio do mnem�nico para realizar uma opera��o de c�lculo.
     * @param  mnemnonic vetor de mnem�nicos "instru��o" a ser analisada.
     * @return Opcode (String de 7 bits) com c�digo em linguagem de m�quina para a instru��o.
     */
    public Assemble(String inFile, String outFileHack, boolean debug) throws IOException {
        this.debug = debug;
        inputFile  = inFile;
        hackFile   = new File(outFileHack);                      // Cria arquivo de sa�da .hack
        outHACK    = new PrintWriter(new FileWriter(hackFile));  // Cria sa�da do print para
                                                                 // o arquivo hackfile
        table      = new SymbolTable();                          // Cria e inicializa a tabela de simbolos
        
       
    }

    /**
     * primeiro passo para a constru��o da tabela de s�mbolos de marcadores (labels)
     * varre o c�digo em busca de S�mbolos novos Labels e Endere�os de mem�rias
     * e atualiza a tabela de s�mbolos com os endere�os.
     *
     * Dependencia : Parser, SymbolTable
     */
    public void fillSymbolTable() throws FileNotFoundException, IOException {
    	Parser parser = new Parser(inputFile);
    	int currentLine = 0;
    	int currentRam = 16;
    	while(parser.advance()){

    		if(parser.commandType(parser.command()) == CommandType.L_COMMAND ){

    			String lbl = parser.label(parser.command());
    			if (!table.contains(lbl)){
    				table.addEntry(lbl, currentLine);

    			}
    		} 

			if (parser.commandType(parser.command()) == CommandType.A_COMMAND || parser.commandType(parser.command()) == CommandType.C_COMMAND){
    			currentLine++;

			}
    	}

    	parser = new Parser(inputFile);
		while(parser.advance()){

			if(parser.commandType(parser.command()) == CommandType.A_COMMAND ){
				String symb = parser.symbol(parser.command());

				if((int) symb.charAt(0) < 48 || (int) symb.charAt(0) > 57){ //Root checking if number

					if (!table.contains(symb)){
						table.addEntry(symb, currentRam );
						currentRam ++;
					}
				}
			}
		}
    }
    
    
    /**
     * Segundo passo para a gera��o do c�digo de m�quina
     * Varre o c�digo em busca de instru��es do tipo A, C
     * gerando a linguagem de m�quina a partir do parse das instru��es.
     *
     * Dependencias : Parser, Code
     */
    public void generateMachineCode() throws FileNotFoundException, IOException{
        Parser parser = new Parser(inputFile);  // abre o arquivo e aponta para o come�o
        Code code1 = new Code();
        String machineCode = "";
        while(parser.advance()){
        	//String symb = parser.command();
        	machineCode = "";
        	String[] mnemnonic = parser.instruction(parser.command());
        	String symb = parser.symbol(parser.command());
        	if (parser.commandType(parser.command()) == CommandType.A_COMMAND){

        		if ((int) symb.charAt(0) < 48 || (int) symb.charAt(0) > 57){
 
        			
        			String var =String.valueOf(table.getAddress(symb));

        			
        			
        			machineCode = "0" + code1.toBinary(var);
        		} else {
        			machineCode = "0" + code1.toBinary(symb);	
        		}
        		outHACK.println(machineCode);
        		
        	} else if(parser.commandType(parser.command()) == CommandType.C_COMMAND) {
			
			for (int i=0; i <mnemnonic.length; i++){

			}

        		machineCode = "1"+ code1.comp(mnemnonic)+code1.dest(mnemnonic)+code1.jump(mnemnonic);
        		outHACK.println(machineCode);

        	}
        	        	 
        }
        //return machineCode;
    }

    /**
     * Fecha arquivo de escrita
     */
    public void close() throws IOException {
        if(outHACK!=null) {
            outHACK.close();
        }
    }

    /**
     * Remove o arquivo de .hack se algum erro for encontrado
     */
    public void delete() {
        try{
            if(hackFile!=null) {
                hackFile.delete();
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

}

