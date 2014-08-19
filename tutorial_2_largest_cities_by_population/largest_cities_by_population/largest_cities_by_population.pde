// Definindo o tamanho do documento
size(1200, 200);

// Carregando o arquivo dentro de uma tabela. "header" significa que a primeira linha do arquivo deve ser entendida como um cabeçalho.
Table tabela = loadTable("cidades.tsv", "header");

// Criando uma ação que vai ser repetida várias vezes,...
for (int i = 0;                // ...a partir de um contador que começa em zero,...
    i < tabela.getRowCount(); // ...termina no tamanho da tabela...
    i = i + 1) {               // ...e cresce de um em um.


  // Em resumo, é como se o programa começasse a contar "0, 1, 2, 3…" até "10",
  // que é o número de linhas da nossa tabela.
  // Para cada vez que ele conta, executa a ação abaixo:

  // Seleciona a linha correspondente à contagem (i)
  TableRow linha = tabela.getRow(i);

  // Desenha um retângulo na posição y 100 e x segundo a fórmula "120 vezes contagem".
  // Quer dizer que, na sequência, a coordenada x vai ser: 0 , 120, 240, 360… até 1080.
  // Como nossa contagem de 10 elementos começa em 0, ela vai até 9!
  int posX = 120*i;
  int posY = 50;
  float lado = sqrt(linha.getInt("área"));

  rect(posX, posY, lado, lado);

  // A partir de um contador "j"...
  for (int j = 0;                       //...que começa em zero,...
    j < linha.getInt("população")/5000; //...vai até o número lido na coluna "população", de cada linha...
    j = j + 1) {                        //...e cresce de um em um,...    
    
    //...desenhe um ponto em coordenadas aleatórias dentro da nossa área.
    point( random(posX, posX + lado),
           random(posY, posY + lado));
  }
}

save("cidades.jpg");

