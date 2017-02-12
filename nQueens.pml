#define N 6
int result[N];
bool a[N];
bool b[2*N-1];
bool c[2*N-1];
bool flag;
bool find = true;



active proctype Queens() {
byte col = 1;
byte row = 0;
 do
 :: if
    :: flag && col<=N && row<N -> row++; flag = false
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
    ::
    :: 
    fi

    if
    :: !a[row-1] && !b[row+col-2] && !c[row-col+N-1] -> a[row-1] = true; b[row+col-2] = true; c[row-col+N-1] = true; result[col-1] = row; printf("Result %d \n",result[col-1]); col++; find = true;
    :: else -> flag = true;
    fi 

    if
    :: col == N+1 -> break
    :: else 
    fi 
od;



}
