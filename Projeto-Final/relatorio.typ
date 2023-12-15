#import "../typst-ifsc/templates/article.typ":*

#show: doc => article(
  title: "Relatório projeto final",
  subtitle: "Cenário 2 - Travessia Controlada por Botoeira com Sinalização Noturna, Sinalização Piscante, Avisos Sonoros",
  // Se apenas um autor colocar , no final para indicar que é um array
  authors: ("Rhenzo Hideki Silva Kajikawa","Matheus Pires Salazar "),
  date: "26 de Setembro de 2023",
  doc,
)

= Introdução

== Objetivo
Este projeto, feito na matéria de Dispositivos lógicos programáveis , tem como objetivo simular uma situação de transito , onde, como descrito, é feita a travessia de pedestres em diferentes cenários tanto de manhã quanto a noite . Além de tentar otimizar o transito , evitando fechamentos de semáforos da via principal de forma desnecessária.

== Motivação
Em aula foram ensinados novos conceitos de VHDL, e agora como projeto final foi aplicado desde  o mais básico até conceitos mais complexos. Dessa forma esse projeto visa certificar que foram aprendidos todos esses conhecimentos.

#pagebreak()


= Descrição do Projeto
== Cenário 2 - Descrição
Visa garantir uma travessia de pedestres diurna e noturna segura e consciente. Ao acionar a botoeira, será ativada uma iluminação branca sobre a faixa de passagem zebrada e nas áreas de espera dos pedestres, assegurando melhor visibilidade e segurança para o pedestre a noite. Simultaneamente, o semáforo emitirá sinais visuais e sonoros, indicando ao pedestre que o botão foi acionado com sucesso e alertando motoristas sobre a intenção de travessia. Durante a fase de liberação para veículos, o semáforo do pedestre permanecerá vermelho, economizando energia até que o botão seja acionado. Após a solicitação, os grupos focais do pedestre exibirão luz verde em ambos os lados da via, enquanto o semáforo dos carros exibirá sinal vermelho, garantindo a máxima segurança para os pedestres e reforçando a prioridade de travessia.

Para orientar pedestres de maneira eficaz, o semáforo do pedestre apresentará um contador regressivo, indicando o tempo restante para a travessia. O tempo total de travessia será ajustável, permitindo personalização conforme as necessidades locais. Nos últimos 30% do tempo, o sinal verde do semáforo do pedestre piscará, visualmente alertando que o tempo para a travessia está se encerrando. É importante ressaltar que a iluminação estará ativa apenas durante o tempo em que a botoeira foi acionada até 5 segundos após o término do tempo de travessia. Este ajuste visa otimizar o consumo de energia e garantir que a iluminação cumpra sua função apenas quando necessária.

== Procedimento
Fora de aula foram decididas como seria a divisão do projeto. Foi decidido que era necessário ilustrar como seria feito a maquina de estados antes mesmo de começar o código em vhdl.
#align(center)[
  #figure(
      image(
      "./Figuras/MaquinaDeEstado.svg",width: 110%,
        ),
    caption: [
         Elaboração das máquinas de estado \ Fonte: Elaborada pelo autor
      ],
      supplement: "Figura projeto final"
    )
  ]

Nesse levantamento baseado nos semáforos visto em aula foi possível visualizar quais seriam as diferenças e semelhanças , além de ter ideia das entradas e saídas da máquina de estado do cenário 2.

Após pensar em como seria levantado a máquina de estado , fizemos uma varredura em quais componentes iriam ser necessários para a simular o cenário escolhido , e também atender as requisições feitas pelo professor.

#pagebreak()

Os componentes que foram escolhidos para compor o resto do projeto foram , um conversor bin2bcd , 2 conversores bcd2ssd e um divisor de clock.

A visualização do projeto ficou dessa forma:
#align(center)[
  #figure(
      image(
      "./Figuras/ProjetoVisualicao.jpg",width: 110%,
        ),
    caption: [
         Elaboração das máquinas de estado \ Fonte: Elaborada pelo autor
      ],
      supplement: "Figura projeto final"
    )
  ]

== Componentes utilizados 
O componentes utilizados para o projeto podem ser visualizados na Figura 2.

No total foram utilizados 2 displays de sete segmentos , 2 conversor de BCD para ssd , 1 conversor de Binário para BCD , 1 maquina de estados , 1 divisor de clock e 1 clock de 50 MHz , 2 botões para pedestres , 2 LEDs para simbolizar som e luz , 3 LEDs para semáforo de carros e mais 2 LEDs para semáforo de pedestres.

Como dito dito anteriormente , nesse projeto foi abordado maquinas de estados , a partir disso também foi trabalhado com o uso de 4 componentes menores. 

Um divisor de clock com 2 entradas , reset e clock in , e uma saída clock out . Esse divisor tem como objetivo diminuir os pulsos de enable dos segundos , podendo ajustar toda contagem do sistema para diferentes clocks . Apenas trocando o valor genérico do componente "div". Esse divisor de clock foi utilizado anteriormente no projeto do relógio que foi feito em sala , dessa maneira para otimizar o tempo foi decidido reutiliza-lo.

Para a maquina de estado foram criada com 5 entradas , a divisão delas sendo , 1 entrada padrão de reset, 1 entrada para o clock onde é conectada com o divisor de clock. 2 entradas que são das botoeiras para os pedestres que quando apertarem faz o estado mudar para abrir o semáforo dos pedestres e por ultimo uma entrada do sensor de noite.

Existem 8 saídas para a maquina de estado , 3 LEDs que servem para o semáforo dos carros , 2 LEds para o semáforo dos pedestres junto a 1 saída de contagem e uma saída de som.

A saída de contagem tem como objetivo passar por um conversor binário para bcd , desse saem 2 pontos , 1 deles é para o decimal e outro a unidade que passa para um conversor bcd2ssd , esses são mostrados em 2 display de 7 segmentos que é habilitado quando o pedestre deve passar.
  
== Sistema Completo
Após ter todos os componentes do projeto foi feita a junção deles.
=== Elementos lógicos do sistema

=== RTL Viewer

= Implementação na placa

== Pinagem

== Resultados

= Conclusão