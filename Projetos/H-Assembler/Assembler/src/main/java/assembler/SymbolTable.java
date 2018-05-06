/**
 * Curso: Elementos de Sistemas
 * Arquivo: SymbolTable.java
 */

package assembler;

import java.util.HashMap;
import java.util.Map;

/**
 * Mantém uma tabela com a correspondência entre os rótulos simbólicos e endereços numéricos de memória.
 */
public class SymbolTable {

	Map<String,Integer> Dictionary = new HashMap<String,Integer>();

    /**
     * Cria a tabela de símbolos.
     */
    public SymbolTable() {

    	for (int i=0;i<16;i++) {
    		Dictionary.put("R"+Integer.toString(i), i);
    	}

    	Dictionary.put( "SP", new Integer(0));
    	Dictionary.put( "LCL", new Integer(1));
    	Dictionary.put( "ARG", new Integer(2));
    	Dictionary.put( "THIS", new Integer(3));
    	Dictionary.put( "THAT", new Integer(4));
    	Dictionary.put( "SCREEN", new Integer(16384));
    	Dictionary.put( "LED", new Integer(21184));
    	Dictionary.put( "SW", new Integer(21185));
    }

    /**
     * Insere uma entrada de um símbolo com seu endereço numérico na tabela de símbolos.
     * @param  symbol símbolo a ser armazenado na tabela de símbolos.
     * @param  address símbolo a ser armazenado na tabela de símbolos.
     */
    public void addEntry(String symbol, int address) {
    	Dictionary.put(symbol, address);

    }

    /**
     * Confere se o símbolo informado já foi inserido na tabela de símbolos.
     * @param  symbol símbolo a ser procurado na tabela de símbolos.
     * @return Verdadeiro se símbolo está na tabela de símbolos, Falso se não está na tabela de símbolos.
     */
    public Boolean contains(String symbol) {
    	return Dictionary.containsKey(symbol);
    }

    /**
     * Retorna o valor númerico associado a um símbolo já inserido na tabela de símbolos.
     * @param  symbol símbolo a ser procurado na tabela de símbolos.
     * @return valor numérico associado ao símbolo procurado.
     */
    public Integer getAddress(String symbol) {
    	return Dictionary.get(symbol);
    }

}
