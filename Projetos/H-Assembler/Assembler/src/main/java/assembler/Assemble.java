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
 * Faz a geração do código gerenciando os demais módulos
 */
public class Assemble {
    private String inputFile;              // arquivo de entrada nasm
    File hackFile = null;                  // arquivo de saída hack
    private PrintWriter outHACK = null;    // grava saida do código de máquina em Hack
    boolean debug;                         // flag que especifica se mensagens de debug são impressas
    private SymbolTable table;             // tabela de símbolos (variáveis e marcadores)

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public Assemble(String inFile, String outFileHack, boolean debug) throws IOException {
        this.debug = debug;
        inputFile  = inFile;
        hackFile   = new File(outFileHack);                      // Cria arquivo de saída .hack
        outHACK    = new PrintWriter(new FileWriter(hackFile));  // Cria saída do print para
                                                                 // o arquivo hackfile
        table      = new SymbolTable();                          // Cria e inicializa a tabela de simbolos
        
       
    }

    /**
     * primeiro passo para a construção da tabela de símbolos de marcadores (labels)
     * varre o código em busca de Símbolos novos Labels e Endereços de memórias
     * e atualiza a tabela de símbolos com os endereços.
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
     * Segundo passo para a geração do código de máquina
     * Varre o código em busca de instruções do tipo A, C
     * gerando a linguagem de máquina a partir do parse das instruções.
     *
     * Dependencias : Parser, Code
     */
    public void generateMachineCode() throws FileNotFoundException, IOException{
        Parser parser = new Parser(inputFile);  // abre o arquivo e aponta para o começo
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

