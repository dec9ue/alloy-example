


/**
  *
  */
public class Suudoku {


  public static void main(String[] ignored){
    Suudoku obj = new Suudoku(9);
    int [][] prob = {
      {0,0,0,0,0,0,2,0,0},
      {0,6,5,0,0,3,0,0,4},
      {2,0,0,0,0,6,0,0,0},
      {1,0,8,0,0,0,9,0,0},
      {3,0,7,8,0,1,0,0,0},
      {0,0,0,4,0,0,0,5,0},
      {0,0,0,2,0,0,0,0,0},
      {0,0,0,7,0,0,3,0,0},
      {0,0,9,0,8,0,7,0,0},
    };

    obj.setProblem(prob);
    obj.solve();
    System.out.println(obj);
  }

  int size;
  int curx, cury;
  int problem[][];
  int solution[][];
  
  public Suudoku(int size){
    this.size=size;
    problem = new int[size][];
    for(int i = 0 ; i < size ; i++){
      problem[i]= new int[size];
    }
    solution = new int[size][];
    for(int i = 0 ; i < size ; i++){
      solution[i]= new int[size];
    }
    curx = -1;
    cury = -1;
  }


  
  public void setProblem(int[][] problemdata){
    for(int i = 0;i<size;i++){
      for(int j = 0 ; j<size;j++){
        problem[i][j]=problemdata[i][j];
      }
    }
  }

  
  public int[][] solve(){
    while(true){
      if(needBacktrack()){
        backtrack();
      }else{
        proceed();
      }
      if((isSolved()) ||(isTerminated())){
        System.out.println("solved / terminated.breaks");
        break;
      }
      solveOneCell();
    }
    // TBD: returns result.
    return null;
  }

  /**
    * proposes next value by incrementing the current cell
    * if there'S NO next cell, it proposes "size+1" value
    * to indicate no proposal available(needs back track)
    */
  private void solveOneCell(){
  countloop :
    do{
      solution[curx][cury] +=1;
      if(solution[curx][cury] > size) {break;}
      for(int i = 0 ; i < size; i++){
        if((i != curx) && (solution[curx][cury] == solution[i][cury])){
          continue countloop;
        }
        if((i != curx) && (solution[curx][cury] == problem[i][cury])){
          continue countloop;
        }
      }
      for(int i = 0 ; i < size; i++){
        if((i != cury )&& (solution[curx][cury] == solution[curx][i])){
          continue countloop;
        }
        if((i != cury )&& (solution[curx][cury] == problem[curx][i])){
          continue countloop;
        }
      }
      break;
    }while(true);
    System.out.println("solved : ("+curx+","+cury+")="+solution[curx][cury]);
  }

  private boolean isSolved(){
    // TBD full implementation
    return cury == size;
  }
  
  private boolean isTerminated(){
    // TBD full implementation
    return cury == size;
  }
  
  private void proceed(){
    System.out.println("proceed from :("+curx+","+cury+")");
    do{
      proceed_step();
      if(isFixedByProblem()){
        setFixedValue();
        continue;
      }
      break;
    }while(true);
  }

  private void setFixedValue(){
    solution[curx][cury] = problem[curx][cury];
  }
  
  private boolean isFixedByProblem(){
    if(isOutOfTheMatrix()){return false;}
    return 0 != problem[curx][cury];
  }

  private void proceed_step(){
    if(curx <0) {
      curx=0;
      cury=0;
      System.out.println("proceed to :("+curx+","+cury+")");
      return;
    }
    if(curx < size-1){
      curx ++;
      System.out.println("proceed to :("+curx+","+cury+")");
      return;
    }
    if((curx == size-1)&&(cury < size-1)){
      cury ++;
      curx = 0;
      System.out.println("proceed to :("+curx+","+cury+")");
      return;
    }
    if((curx == size-1)&&(cury == size-1)){
      cury ++;
      curx ++;
      System.out.println("proceed to :("+curx+","+cury+")");
      return;
    }
    System.out.println("proceed error :("+curx+","+cury+")");
    // can't be here.do nothing
  }

  private boolean isOutOfTheMatrix(){
    return curx >= size || curx < 0 || cury < 0 || cury >= size;
  }

  private boolean needBacktrack(){
    if(isOutOfTheMatrix()){return false;}
    return (solution[curx][cury] > size);
  }

  /**
   * back tracks as it can
   */
  private void backtrack(){
    System.out.println("backtrack from :("+curx+","+cury+")");
    // backtracking occurred at the first point, it selects termination.
    do{
      backtrack_step();
      if(isFixedByProblem()){
        continue;
      }
      break;
    }while(true);
  }

  private void backtrack_step(){
    if(isOutOfTheMatrix()){
      System.out.println("backtrack error(outof matrix) :("+curx+","+cury+")");
      return;
    }
    solution[curx][cury] = 0;
    
    if((curx == 0) && (cury == 0)){
      curx = size;
      cury = size;
      System.out.println("backtrack to :("+curx+","+cury+")");
      return;
    }
    if(curx <size && curx > 0){
      curx --;
      System.out.println("backtrack to :("+curx+","+cury+")");
      return;
    }
    if((curx == 0)&&(cury > 0)){
      cury --;
      curx = size-1;
      System.out.println("backtrack to :("+curx+","+cury+")");
      return;
    }
    // can't be here.do nothing
    System.out.println("backtrack error :("+curx+","+cury+")");
  }

  public String toString(){
    String result = "";
    for(int i = 0; i < size; i++){
      result+="[";
      for(int j = 0; j < size; j++){
        result+=(solution[i][j] + ",");
      }
      result+="]\n";
    }
    return result;
  }
}

