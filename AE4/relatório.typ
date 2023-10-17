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
         simulação funcional \ Fonte: Elaborada pelo autor
      ],
      supplement: "Figura AE4"
    )
  ]
  Foi analisado 3 valores nessa simulação com A sendo 4578, 9998, 0003, é possível ver que os valores de sm, sc, sd, su foram alterados nos momentos que A recebeu os valores de entrada. Os resultados satisfazem o objetivo do código e da atividade extra-classe 4.

  == Número de elementos lógicos
  
  Com a simulação funcional feita , é possível ter certeza ver que foi alçado o objetivo em código , mas é necessária a analise de quãao custoso o código está sendo e se é aceitável o número de recursos.
  As figuras a seguir mostram o número de recursos utilizados para que o código seja implementado:
  #align(center)[
  #figure(
      image(
      "./Figuras/Screenshot from 2023-09-30 20-02-13.png",width: 110%,
        ),
    caption: [
         simulação funcional \ Fonte: Elaborada pelo autor
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
         simulação funcional \ Fonte: Elaborada pelo autor
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
      "./Figuras/Screenshot from 2023-09-29 18-46-20.png",width: 100%,
        ),
    caption: [
         simulação funcional \ Fonte: Elaborada pelo autor
      ],
      supplement: "Figura AE4"
    )
  ]
  Pode-se ver na figura 8 que o tempo de propagação é de 57.4 ns , essa é a pior situação simulada possível com o modelo utilizando sua forma de operação mais lenta , dessa forma pode-se fazer a analise e decidir se é aceitável ou não a propagação . O que é possível fazer para alterar esses valores é alterar o valor de seed das simulações , alterar a placa utilizada mantendo-se dentro da familia Cyclone IV E , e procurar por outras otimizações no código e distribuição dos elementos lógicos na placa e diminuir suas distancias.
#pagebreak()
== RTL Viewer
A seguir uma imagem do RTL viewer após a compilação do código.
#align(center)[
  #figure(
      image(
      "./Figuras/Screenshot from 2023-10-01 11-27-02.png",width: 100%,
        ),
    caption: [
         RTL viewer \ Fonte: Elaborada pelo autor
      ],
      supplement: "Figura AE4"
    )
  ]
  É possível ver no RTL Viewer os circuitos utilizados para satisfazer o código. Utilizando 3 circuitos de divisão e mais 3 circuitos de Mod (Resto da divisão inteira) .

#pagebreak()
== Technology Map
A seguir os prints dos Technology Maps tirados da atividade.
#align(center)[
  #figure(
      image(
      "./Figuras/Screenshot from 2023-10-01 11-29-32.png",width: 110%,
        ),
    caption: [
         Technology Map Viewer (Post-Fitting) \ Fonte: Elaborada pelo autor
      ],
      supplement: "Figura AE4"
    )
  ]

  #align(center)[
  #figure(
      image(
      "./Figuras/Screenshot from 2023-10-01 11-30-06.png",width: 110%,
        ),
    caption: [
         Technology Map Viewer (Post Mapping) \ Fonte: Elaborada pelo autor
      ],
      supplement: "Figura AE4"
    )
  ]
  = Conclusão
Observando os resultados obtidos , é crível que eles são aceitáveis com os recursos aprendidos até o momento. Porém é bem possível diversas possíveis otimizações como mencionando anteriormente , alterando tanto o tempo de propagação quanto o número de elementos. Ou também é possível que diminuir o tempo de propagação leve um uso maior de elementos lógicos.