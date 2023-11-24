#import "../typst-ifsc/templates/article.typ":*

#show: doc => article(
  title: "Relatório Atividade extra-classe 5
  Relógio HH-MM-SS",
  subtitle: "Dispositivos lógicos programáveis",
  // Se apenas um autor colocar , no final para indicar que é um array
  authors: ("Rhenzo Hideki Silva Kajikawa",),
  date: "26 de Setembro de 2023",
  doc,
)


= Introdução

== Objetivos
Este projeto feito em aula do relógio HHMMSS tem como objetivo indicar as horas (HH) , minutos (MM) e segundos (SS) , mostrando as unidades em 3 pares de displays de 7 segmentos, estes que estão são encontrados no  kit DE2-115 da TERASIC , encontrado no laboratório de sinais digitais.

== Motivação
Em aula foram ensinadas vários conceitos de VHDL e boas maneiras para um projeto. Porém até o momento não havia sido aplicado o conjunto dessas ideias em um projeto. Dessa forma este projeto vem para amarrar essas ideias em aplica-las em aula. 

== Procedimentos
Em aula foram feitas 4 entidades. Essas entidades foram separadas da seguinte forma , divisor de clock que foi chamado div_clk , um contador BCD (Binary-coded decimal) que foi chamado de contador_bcd , um conversor BCD para SSD (Seven-segment display) que foi chamado de bcd2ssd , e por fim a entidade que integra todo o conjunto o relógio , chamado de relogio_HHMMSS.
Com essas entidades feitas é possível junta-los em um arquivo para assim obter-se o projeto final como um todo.

#pagebreak()

= Descrição do Projeto
Como falado anteriormente , O projeto foi separado em seções menores , atacando o projeto em partes menores para uma melhor manutenção do código.

O primeiro levantamento feito em aula é representado pela Figura 1 , que foi feita em aula. Nela é possível observar as pequenas partes que compõem o todo. Se bem observado tem para cada display de sete segmentos um conversor BCD para SSD , estes que recebem de o valores de um dos 3 contadores , e por fim temos um o clock de 50MHz conectados em todos os contadores e um divisor de clock que habilita o contador de segundos.
#align(center)[
  #figure(
      image(
      "./Figuras/relogioHHMMSS.png",width: 110%,
        ),
    caption: [
         Elaboração do Projeto \ Fonte: Elaborada pelo autor
      ],
      supplement: "Figura AE5"
    )
  ]
== Componentes utilizados 
O componentes utilizados para o projeto podem ser visualizados na Figura 1.

No total foram Utilizados 6 displays de sete segmentos , 6 conversores de BCD para SSD , 3 contadores , 1 divisor de clock e 1 clock de 50MHz. Contabilizando o total de 17 componentes para cumprir com os objetivos desse projeto. 

== Sistema Completo

=== Pinagem 

=== Número de elementos lógicos

#pagebreak()

= Resultados obtidos 

== RTL viewer

== Implementação na placa

#pagebreak()

= Conclusão