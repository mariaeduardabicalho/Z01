/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;


/**
 * Traduz mnemônicos da linguagem assembly para códigos binários da arquitetura Z0.
 */


public class Code {
	
	public String instruction = new String();
	
	
    /**
     * Retorna o código binário do(s) registrador(es) que vão receber o valor da instrução.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 4 bits) com código em linguagem de máquina para a instrução.
     */
    public static String dest(String[] mnemnonic) {
    	
    	// MOVW %A, %D
    	// [MOVW, %A, %D]
    	// JMP %D
    	// [JMP, %D]
    	String codig = "0000";
        int size = mnemnonic.length;
        StringBuilder codigo = new StringBuilder("0000"); //deixar em 0000 para quando o comando for null

        
    	
    	if (mnemnonic[(size-1)  ] == "%A"){
    		codigo.setCharAt(0, '1');
    	}
    	if (mnemnonic[(size-1)] == "%D"){
    		codigo.setCharAt(2, '1');
    	}
    	if (mnemnonic[(size-1)] == "%S"){
    		codigo.setCharAt(1, '1');
    	}
    	if (mnemnonic[(size-1)] == "(%A)"){
    		codigo.setCharAt(3, '1');
    	}
    	

        while (size >= 4 ) {
        if (mnemnonic[size-1].equals( "%A")){
            codigo.setCharAt(0, '1');
        } else if (mnemnonic[size-1].equals( "%S")){
            codigo.setCharAt(1, '1');
        } else if (mnemnonic[size-1].equals( "%D")){
            codigo.setCharAt(2, '1');
        } else if (mnemnonic[size-1].equals( "(%A)")){
            codigo.setCharAt(3, '1');
        }
        size -= 1;
        }

        if(mnemnonic.length < 2) {
            return codig ;
        }  
        else if(mnemnonic[0].equals("jmp") || mnemnonic[0].equals("je") || mnemnonic[0].equals("jne") || mnemnonic[0].equals("jg") || mnemnonic[0].equals("jge") || mnemnonic[0].equals("jl") || mnemnonic[0].equals("jle") ) {
            return codig;
        }
    	
    	else{
            return codigo.toString();
        }
	
    }
    
    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 8 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
    	StringBuilder codigoc = new StringBuilder("10000000");
    	
    	// adaptando para cada modulo e tendo as diferencas de  quando for zero e quando for jump
 
    	
    	int size = mnemnonic.length - 1;

    	// A e B
    	//para eles sozinhos, mov que eh so dois, e o resto q eh 3
    	//colocando 01 de acordo com a tabela
    	if (size == 1) {
    		if (mnemnonic[1].equals( "%A") | mnemnonic[1].equals( "%D")){
        		codigoc.setCharAt(0, '0');
        	} else if(mnemnonic[1].equals( "%S")){
        		codigoc.setCharAt(0, '0');
        		codigoc.setCharAt(1, '1');
        	}
    	} else if(mnemnonic[0].equals( "movw")){
    		if ((mnemnonic[1].equals( "%A"))|(mnemnonic[1].equals( "%D"))){
    			codigoc.setCharAt(0, '0');
    		} else if(mnemnonic[1].equals( "%S")){
    			codigoc.setCharAt(0, '0');
    			codigoc.setCharAt(1, '1');
    		}

    	} else if(size >= 2) {
    		if ((mnemnonic[1].equals( "%A") & mnemnonic[2].equals( "%D"))|(mnemnonic[2].equals( "%A") & mnemnonic[1].equals( "%D"))){
    			codigoc.setCharAt(0, '0');
    		} else if ((mnemnonic[1].equals( "%A") & mnemnonic[2].equals( "%S"))|(mnemnonic[2].equals( "%A") & mnemnonic[1].equals( "%S"))){
    			codigoc.setCharAt(0, '0');
    			codigoc.setCharAt(1, '1');
    		} else if ((mnemnonic[1].equals( "(%A)") & mnemnonic[2].equals( "%S"))|(mnemnonic[2].equals("(%A)") & mnemnonic[1].equals( "%S"))){
    			codigoc.setCharAt(1, '1');
    		}
    	} else if(mnemnonic.length == 1){
    		if (mnemnonic[0].equals( "nop")){
    			codigoc.setCharAt(2, '1');
    			codigoc.setCharAt(4, '1');
    			codigoc.setCharAt(6, '1');
    		} else {
    			codigoc.setCharAt(0, '0');
        		codigoc.setCharAt(2, '1');
        		codigoc.setCharAt(3, '1');
    		}
    		
    	}
    	
    	
    	
    	
    	if ((mnemnonic[0].equals( "incw"))){
    		codigoc.setCharAt(3, '1');
    		if (mnemnonic[1].equals( "%A") | mnemnonic[1].equals( "(%A)")){
    			codigoc.setCharAt(2, '1');
    			codigoc.setCharAt(3, '1');
    		} else{
    			codigoc.setCharAt(3, '1');
    			codigoc.setCharAt(4, '1');

    		}
			codigoc.setCharAt(5, '1');
    		codigoc.setCharAt(6, '1');
    		codigoc.setCharAt(7, '1');
    	}
    	
    	if ((mnemnonic[0].charAt(0) == 'j') & (size > 0) ){
    		if (mnemnonic[1].equals( "%S")){
    			codigoc.setCharAt(1, '1');
    		}
    		codigoc.setCharAt(4, '1');
    		codigoc.setCharAt(5, '1');
    	}
    	
    	if ((mnemnonic[0].equals( "decw"))){
    		codigoc.setCharAt(6, '1');
    		if (mnemnonic[1].equals( "%A") | mnemnonic[1].equals( "(%A)")){
    			codigoc.setCharAt(2, '1');
    			codigoc.setCharAt(3, '1');
    		} else{
    			codigoc.setCharAt(4, '1');
    			codigoc.setCharAt(5, '1');
    		}
    	}
    	
    	if ((mnemnonic[0].equals( "notw"))){
    		codigoc.setCharAt(7, '1');
    		if (mnemnonic[1].equals( "%A") | mnemnonic[1].equals( "(%A)")){
    			codigoc.setCharAt(2, '1');
    			codigoc.setCharAt(3, '1');
    		} else{
    			codigoc.setCharAt(4, '1');
    			codigoc.setCharAt(5, '1');
    		}
    	}
    	
    	if ((mnemnonic[0].equals( "negw"))){
    		codigoc.setCharAt(7, '1');
    		codigoc.setCharAt(6, '1');
    		if (mnemnonic[1].equals( "%A") | mnemnonic[1].equals( "(%A)")){
    			codigoc.setCharAt(2, '1');
    			codigoc.setCharAt(3, '1');
    		} else{
    			codigoc.setCharAt(4, '1');
    			codigoc.setCharAt(5, '1');
    		}
    	}
    	
    	if ((mnemnonic[0].equals( "orw"))){
    		codigoc.setCharAt(3, '1');
    		codigoc.setCharAt(5, '1');
    		codigoc.setCharAt(7, '1');
    	}
    	
    	if ((mnemnonic[0].equals( "nop"))){
    		codigoc.setCharAt(2, '1');
    		codigoc.setCharAt(4, '1');
    		codigoc.setCharAt(6, '1');
    	}
    	
    	if ((mnemnonic[0].equals( "movw"))){
    		codigoc.setCharAt(5, '0');
    		codigoc.setCharAt(6, '0');
    		if (mnemnonic[1].equals( "%A") | mnemnonic[1].equals( "(%A)")){
    			codigoc.setCharAt(2, '1');
    			codigoc.setCharAt(3, '1');
    		} else {
    			codigoc.setCharAt(4, '1');
    			codigoc.setCharAt(5, '1');
    		}
    	}
    	
    	if ((mnemnonic[0].equals( "subw"))){
    		codigoc.setCharAt(6, '1');
			codigoc.setCharAt(7, '1'); //caso normal
			if (mnemnonic[1].equals( "%A")| mnemnonic[1].equals( "(%A)")){
				codigoc.setCharAt(5, '1');
			} else{
				codigoc.setCharAt(3, '1');
			}
			if(mnemnonic[2].equals( "$1")) {
				codigoc.setCharAt(2, '1');
				codigoc.setCharAt(3, '1');
				codigoc.setCharAt(5, '0');
				codigoc.setCharAt(7, '0');
			}
    	}
    	
    	if ((mnemnonic[0].equals( "rsubw"))){
    		codigoc.setCharAt(6, '1');
			codigoc.setCharAt(7, '1');
			if (mnemnonic[1].equals( "%S")| mnemnonic[1].equals( "%D")){
				codigoc.setCharAt(5, '1');
			} else{
				codigoc.setCharAt(3, '1');
			}
    	}
    	
    	if (mnemnonic[0].equals( "addw")){
    		codigoc.setCharAt(6, '1');
    	}
    	
    	System.out.println(mnemnonic[0]);
    	
    	System.out.println(codigoc);
    	
    	return codigoc.toString();
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {
    	int size = mnemnonic.length;
    	for (int i = 0; i < size ; i++){
    		   if (mnemnonic[i].equals( "jmp")){
    			   return "111";
    		   } else if(mnemnonic[i].equals( "je")) {
    			   return "010";
    		   } else if(mnemnonic[i].equals( "jne")) {
    			   return "101";
    		   } else if(mnemnonic[i].equals( "jg")) {
    			   return "001";
    		   } else if(mnemnonic[i].equals( "jge")) {
    			   return "011";
    		   } else if(mnemnonic[i].equals( "jl")) {
    			   return "100";
    		   } else if(mnemnonic[i].equals( "jle")) {
    			   return "110";
    		   }
    	
    		}
    	return "000";
    }

    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     * @param  symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {
    	// usando funcao pra transdormar para binario e colocando minimo de 15 cracteres para a string, com zero para substituir
    	return String.format("%15s", Integer.toBinaryString(Integer.parseInt(symbol))).replace(' ', '0');
    }
    

    
    
    public static String encoder(String string){
    	//String 
    	
    	return null;
    }
}