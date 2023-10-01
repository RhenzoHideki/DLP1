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

#show raw.where(block: false): box.with(
  fill: luma(240),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 2pt,
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
    caption:   [
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

#pagebreak()

= Resolução da Atividade extra-classe 4 (AE4)
Seguindo as orientações da atividade , foi feito um código conversor de binário para BCD (bin2bcd) com entrada binária variando entre 0 a 9999. A familia utilizada foi Cyclone IV E e a placa escolhida foi a EP4CE115F29C8 , estando de acordo com as orientações anteriores.

== Código utilizado
o código feito foi este:

`
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin2bcd is
  port (
    A : in std_logic_vector(14 downto 0);
	 sm : out std_logic_vector( 4 downto 0 );
	 sc : out std_logic_vector( 4 downto 0 );
	 sd : out std_logic_vector( 4 downto 0 );
	 su: out std_logic_vector( 4 downto 0 )
	 );
	 
end entity;

architecture ae4 of bin2bcd is

  signal A_uns : unsigned(14 downto 0);
  signal slice_mil: unsigned(14 downto 0);
  signal slice_cem: unsigned(14 downto 0);
  signal	slice_dez: unsigned(14 downto 0);
  signal	slice_uni: unsigned(14 downto 0);
	
begin
	A_uns <= unsigned(A);
	sm <= std_logic_vector(resize(slice_mil,5));
	sc <= std_logic_vector(resize(slice_cem,5));
	sd <= std_logic_vector(resize(slice_dez,5));
	su <= std_logic_vector(resize(slice_uni,5));
  -- Convert each binary digit to BCD
	slice_mil <= A_uns/1000;
	slice_cem <= (A_uns/100) rem 10;
	slice_dez <= (A_uns/10) rem 10	;
	slice_uni <= A_uns rem 10;
end architecture; 
`

\
O código foi baseado nos código feitos em aula junto com o conhecimento adquirido. Utilizando 4 saídas std_logic_vector sm (Sinal milhar), sc (Sinal centena), sd (Sinal dezena), su (Sinal unidade), e utilizando uma entrada A . slice_mil , slice_cem , slice_dez , slice_uni são os intermediários para trocar de sinal não sinalizado (unsigned).

== Simulação funcional
Utilizando esse código , foi possível obter a Simulação funcional usando o ModelSim de acordo com o comando da questão , desta forma foi feito alguns testes para testar o código , este foi o resultado obtido :
#align(center)[
  #figure(
      image(
      "./Figuras/Simulação_Ae4.png",width: 110%,
        ),
    caption: [
         simulação funcional
      ],
      supplement: "Figura AE4"
    )
  ]
  Foi analisado 3 valores nessa simulação com A sendo 4578, 9998, 0003, é possível ver que os valores de sm, sc, sd, su foram alterados nos momentos que A recebeu os valores de entrada. Os resultados satisfazem o objetivo do código e da atividade extra-classe 4.

  == Número de elementos lógicos
  
  Com a simulação funcional feita , é possível ter certeza ver que foi alçado o objetivo em código , mas é necessária a analise de quão custoso o código está sendo e se é aceitável o número de recursos.
  As figuras a seguir mostram o número de recursos utilizados para que o código seja implementado:
  #align(center)[
  #figure(
      image(
      "./Figuras/Screenshot from 2023-09-30 20-02-13.png",width: 110%,
        ),
    caption: [
         simulação funcional
      ],
      supplement: "Figura AE4"
    )
  ]

  #align(center)[
  #figure(
      image(
      "./Figuras/Screenshot from 2023-09-30 20-05-02.png",width: 110%,
        ),
    caption: [
         simulação funcional
      ],
      supplement: "Figura AE4"
    )
  ]

  Esses são os registros da quantidade de recurso utilizada para funcionamento se baseando no código anterior. o valor representa 1% do total de elementos lógicos da placa , porém utiliza 1272 elementos lógicos. Após algumas tentativas tentando otimizar o uso dos elementos lógicos , foi concluído que com os recursos aprendidos até a AE4 não foi observado maneira melhor ou mais intuitiva de executar um código que atendesse as requisições sem alterar outras partes além do código.

#pagebreak()
  == Tempo de propagação
  Para essa atividade também foi requisitado que fosse estudado o quão rápido era a execução do código e o tempo de propagação na placa. Esse resultado é mostrado na figura a seguir:
    #align(center)[
  #figure(
      image(
      "./Figuras/Screenshot from 2023-09-29 18-46-20.png",width: 110%,
        ),
    caption: [
         simulação funcional
      ],
      supplement: "Figura AE4"
    )
  ]
  Pode-se ver na figura 8 que o tempo de propagação é de 57.4 ms , essa é a pior situação simulada possível com o modelo utilizando sua forma de operação mais lenta , dessa forma pode-se fazer a analise e decidir se é aceitável ou não a propagação . O que é possível fazer para alterar esses valores é alterar o valor de seed das simulações , alterar a placa utilizada mantendo-se dentro da familia Cyclone IV E , e procurar por outras otimizações no código e distribuição dos elementos lógicos na placa e diminuir suas distancias.  

#pagebreak()
  = Conclusão
Observando os resultados obtidos , é crível que eles são aceitáveis com os recursos aprendidos até o momento. Porém é bem possível diversas possíveis otimizações como mencionando anteriormente , alterando tanto o tempo de propagação quanto o número de elementos. Ou também é possível que diminuir o tempo de propagação leve um uso maior de elementos lógicos.