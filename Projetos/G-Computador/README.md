---
title: Elementos de Sistema - Projeto 6 - Unidade Central de Processamento
author: Rafael Corsi - rafael.corsi@insper.edu.br
date: Setembro - 2017
---

Prazo de entrega : 06/9/2017

# Descrição

Nesse projeto vocês serão responsáveis não pela implementação da lógica de controle da Unidade de Controle do Z0 mas sim pela criação das rotinas de testes que testarão um módulo já implementado. Esse Módulo apresenta alguns problemas e a partir do teste gerado vocês deverão corrigir os erros.

# Intruções

Arquivos :

- /src/ControlUnit.vhd : O módulo a ser testado
- /testBench/tb_ControlUnit.vhd : O sistema de teste que excita o ControlUnit e verifica suas funcionalidades.
- /teste06.py

Para testar o ControlUnit com o teste criado, basta executar o arquivo teste06.py

# Projeto :

- Desenvolver o testBench 
- Corrigir os erros na implementação do ControlUnit
 
## Dicas :

- Bole antes cenários de testes para cada módulo da CPU, por exemplo :
     - D = D - 1
          - nesse caso : 

## Rubrica

| Nota máxima | Descritivo                             |
|-------------|----------------------------------------|
| A           | - Entregue no prazo                    |
|             | - Todos os itens corretos              |
|             | - Implementações ótimas (otimizados)   |
| B           | - Entregue no prazo                    |
|             | - Todos os itens corretos              |
| C           | - Entregue fora do prazo, ou           |
| D           | - 80% dos itens entregues corretamente |
| I           | - Não entregue                         |
|             | - Menos que 80% dos itens corretos     |
