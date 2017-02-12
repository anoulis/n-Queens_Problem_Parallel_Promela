#define N 6
chan ch = [0] of {int}
int startColumn=1;
int result[N];
bool a[N];
bool b[2*N-1];
bool c[2*N-1];

init {
ch ! startColumn;
atomic{
int i = 1;
 do
 ::i <N -> run Queens();i++;
 ::else -> break;
 od;
    }
}

active  proctype Queens() {
atomic{
int col,mc,row;
ch ? col;
mc=col;
row = 0;
bool flag,find;
find = true;
 do
 :: if
    :: flag && col<=mc && row<N -> row++; flag = false
    :: flag && row==N -> 
                        do
                        :: col--; row = result[col-1]; a[row-1] = false; b[row+col-2] = false; c[row-col+N-1] = false; result[col-1] = 0; row ++; flag = false
                         if
                         :: row <= N -> break
                         :: else 
                         fi 
                        od;   
    :: find -> row=1; find = false;
    fi

    if
    :: !a[row-1] && !b[row+col-2] && !c[row-col+N-1] -> a[row-1] = true; b[row+col-2] = true; c[row-col+N-1] = true; result[col-1] = row; printf("Result %d \n",result[col-1]); col++; find = true;
    :: else -> flag = true;
    fi 

    if
    :: col == mc+1 && col<=N ->ch ! col; break
    :: col >N ->break;
    :: else 
    fi 
od;
}
}
