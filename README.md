<!-- @format -->

# RachaCucaProlog

## About

Este respositório serve especificamente a resolução do trabalho da matéria de Lógica para Engenharia de Computação, onde o objetivo era resolver um problema lógico do site Racha Cuca. O problema está disponível online e se chama [Salão de Beleza - Nivel Muito Dificil](https://rachacuca.com.br/logica/problemas/salao-de-beleza/)

## How to use:

Para o usar o código basta clonar este repositório, se nescessário instalar o swi-prolog, carregar o arquivo ao ambiente e consultar a resposta.

### Clonando o diretório e iniciando o prolog

```
git clone https://github.com/CayoPhellipe/RachaCucaProlog
cd ./RachaCucaProlog
prolog RC_SalaoDeBeleza.pl
```

### Consultando a resolução

```
?-  resolve(Solucao).
```

-   Nesse formato a solução será do tipo salao() onde mostra toda a ordem de que moça está sentada na sequencia de cadeiras que aparecem.

```
?-  resolve(salao(A,B,C,D,E)).
```

-   Nesse formato a solução especifica exatamente as caracteristicas de cada moça representada por A,B,C,D e E.
