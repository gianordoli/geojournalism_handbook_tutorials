String[] tabela;

void setup(){
  size(800, 600);
  colorMode(HSB);
  tabela = loadStrings("manhattan_garbage_collection.tsv");  
}

void draw(){
  background(255);
  int margem = 20;
  float maximo = 0;
  for(int i = 1; i < tabela.length; i++){
    
    String[] linha = split(tabela[i], '\t');
  
    pushMatrix();
      translate(0, (i-1)/2 * (height/4));
    
      float matiz = map(i, 1, tabela.length - 1, 120, 255);
      
      beginShape();
      
      if((i - 1) % 2 == 0){
        maximo = valorMaximo(tabela, i, i + 1);
        
        strokeWeight(1);
        stroke(200);
        noFill();
        rect(margem, margem, width - 2*margem, height/4 - 2*margem);        

      }else{
        vertex(margem, height/4 - margem);
      }
      
        for(int j = 1; j < linha.length; j++){
          float toneladas = parseFloat(linha[j]); 
          float x = map(j, 1, linha.length - 1, margem, width - margem);        
          float y = map(toneladas, 0, maximo, height/4 - margem, margem);
          vertex(x, y);
          if((i - 1) % 2 == 0){
            noStroke();
            fill(0);
            ellipse(x, y, 8, 8);
          }
          
          if(mouseX - 50 < x && x < mouseX + 50){
            fill(0);
            if((i - 1) % 2 == 0){
              textAlign(CENTER, BOTTOM);
              fill(0);
              textSize(10);
              text(nf(toneladas, 0, 0), x, height/4 - margem - 5);              
            }else{
              textAlign(CENTER, TOP);
              fill(matiz, 255, 255);
              textSize(10);
              text(nf(toneladas, 0, 0), x, height/4 - margem + 5);     
            }
          }
        }
        if((i - 1) % 2 == 0){
          fill(0);
          textAlign(LEFT, TOP);
          textSize(12);
          text(linha[0], margem, 0, width - 2*margem, margem);
          
          stroke(0);
          strokeWeight(3);
          noFill();          
        }else{
          fill(matiz, 255, 255);
          textAlign(RIGHT, TOP);
          textSize(12);
          text(linha[0], margem, 0, width - 2*margem, margem);          
          
          vertex(width - margem, height/4 - margem);
          fill(matiz, 255, 255, 150);
          noStroke();  
        }
      endShape();
    popMatrix();
  }
}


float valorMaximo(String[] algumaTabela, int linha1, int linha2){
  float maximo = 0;
  for(int i = linha1; i <= linha2; i++){
    String[] tempLinha = split(algumaTabela[i], '\t');
    for(int j = 1; j < tempLinha.length; j++){
      float valor = parseFloat(tempLinha[j]); 
      if(valor > maximo){
        maximo = valor;
      }
    }
  }
  return maximo;  
}
