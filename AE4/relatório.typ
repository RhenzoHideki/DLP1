#import "../typst-ifsc/templates/article.typ":*

#show: doc => article(
  title: "Relatório Atividade extra-classe 4
  Conversor de binário para BCD",
  subtitle: "Dispositivos lógicos programaveis",
  // Se apenas um autor colocar , no final para indicar que é um array
  authors: ("Rhenzo Hideki Silva Kajikawa",),
  date: "26 de Setembro de 2023",
  doc,
)


= Comando da Atividade extra-classe 4 (AE4):

Neste laboratório remoto, os alunos deverão implementar uma solução do para um circuito conversor de binário para BCD (bin2bcd) com entrada binária variando entre 0 a 9999.

    - Baseado no exemplo do conversor de binário para BCD - Binary-coded decimal de dois dígitos decimais (00 a 99), mostrado em aula, projete um conversor para 4 dígitos (0000 a 9999).
    - Escreva o código em VHDL, que dada uma entrada A (entre 0 e 9999), fornece nas saídas os dígitos da milhar (sm), centena (sc), dezena (sd) e unidade (su).

    - Utilize as diferentes estratégias ensinadas para reduzir a quantidade de elementos lógicos, aproveitando resultados intermediários, e definindo com exatidão o número de bits a ser usado. O uso de configurações diferentes no compilador Quartus Prime 20.1.1, uso de restrições de tempo através de comandos no arquivo .SDC, e escolha do dispositivo da família de FPGA CYCLONE IV E é permitida.
    - Realize a Simulação Funcional usando o ModelSim para mostrar que o circuito funciona.
#align(center)[
  #figure(
      image(
      "./Figuras/Bin2bcd_SIM_fucional.png",width: 110%,
        ),
    caption: [
         Exemplo de simulação funcional de 0 a 9999
      ],
      supplement: "Figura AE4"
    )
  ]

  - Analise o tempo de propagação e área ocupada (número de elementos lógicos) e tente otimizar um ou os dois parâmetros. Se realizar diversas versões, pode anotar os valores de todas elas e fornecer todas as versões, mas foque no melhor desempenho.
    
  - O número de elementos lógicos pode ser obtido no Flow Summary ou no Resource Usage Summary, conforme mostram as figuras a seguir. Anote a quantidade de elementos lógicos do circuito.

  #align(center)[
  #figure(
      image(
      "./Figuras/Bin2bcd_logic_elements_basico.png",width: 110%,
        ),
    caption: [
         Obtendo o número de elementos no "Flow Summary"
      ],
      supplement: "Figura AE4"
    )
  ]

#align(center)[
  #figure(
      image(
      "./Figuras/Bin2bcd_logic_elements_basico_RUS.png",width: 110%,
        ),
    caption: [
         Obtendo o número de elementos no "Resource Usage Summary"
      ],
      supplement: "Figura AE4"
    )
  ]

  - O tempo máximo de propagação do circuito é obtido no Report Datasheet dentro do aplicativo Timing Analyser .
  
  - Antes de abrir o Timing Analyser é necessário realizar as etapas Analysis & Synthesis, Fitter e Timing Analysis.
  
  - Em seguida no aplicativo Timing Analyser, é necessário executar o Create Timing Netlist, Read SDC File e Update Timing Netlist.
  
  - Selecione o Set Operation Conditions para o modelo Slow 1200mV 125ºC, pois corresponde ao pior tempo dos 3 modelos de simulação. 
  
  - Em seguida obtenha Report Datasheet. Anote o tempo máximo de propagação do circuito.

#align(center)[
  #figure(
      image(
      "./Figuras/Bin2bcd_propagation_delay.png",width: 110%,
        ),
    caption: [
         Exemplo de tempo máximo de propagação
      ],
      supplement: "Figura AE4"
    )
  ]


  -  Se quiser o(a) estudante pode apresentar dois projetos, sendo um para o menor tempo máximo de propagação e outro para menor área ocupada (número de elementos lógicos).

  - O arquivo QAR entregue deve ser plenamente compilável e permitir após a Análise e Síntese e execução do comando de simulação do tb_bin2bcd.do deve apresentar o resultado final.

  - Neste laboratório é necessário fornecer a imagem RTL e Technology Map usadas para obter e melhorar os circuitos, e a imagem da simulação que mostra que a versão entregue funciona.

  - Não é permitido o uso do algoritmo Double Dabble para fazer a conversão entre binário e BCD.



