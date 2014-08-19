Table tabela;

void setup(){
  size(800, 600);
  colorMode(HSB, 359, 99, 99);
  tabela = loadTable("vendas_classe_periculosidade_ambiental_2012_regioes.tsv");  
}

void draw(){
  background(359);
  int x = 130;
  int y = 80;
  int altura = 20;
  int escala = 7;

  fill(0);
  textAlign(CENTER, CENTER);
  text("Vendas de Agrotóxicos e Afins por Classe de Periculosidade Ambiental", width/2, y/2);
  
  for(int i = 1; i < tabela.getRowCount(); i ++){
    String regiao = tabela.getString(i, 0);
    fill(0);
    textAlign(RIGHT, TOP);
    text(regiao, x - 10, y);
    
    for(int j = 1; j < tabela.getColumnCount(); j ++){
      float porcentagem = tabela.getFloat(i, j);
      float largura = porcentagem * escala;
      float matiz = map(j, 1, tabela.getColumnCount()-1, 50, 10);
      fill(matiz, 99, 99);
      noStroke();
      rect(x, y, largura, altura);
      
      if(mouseX > x  && mouseX < x + largura && mouseY > y && mouseY < y + altura){
        String classe = tabela.getString(0, j);        
        fill(0);
        textAlign(LEFT, TOP);
        text(classe + ": " + porcentagem + "%", x + largura + 10, y);
      }
      y += altura; 
    }
    y += altura;
  }
}
