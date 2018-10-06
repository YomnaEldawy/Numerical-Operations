#include <stdio.h>
#include <stdlib.h>
#include <time.h>

//Functions
void generateOpenedGrid(int rows,int cols,int x1,int y1,int oGrid[rows][cols]);
void printIntArr(int n, int m, int A[n][m]);
void setToZero(int rows, int cols, int arr[rows][cols]);
void setToX(int rows, int cols, char arr[rows][cols]);
void save_oGrid(int rows, int cols, int arr[rows][cols]);
void save_uGrid(int rows, int cols, char arr[rows][cols]);


void openCell(int rows, int cols, int x, int y, int oGrid[rows][cols], char uGrid[rows][cols]);
void openAdjacentCells(int x, int y, int rows, int cols, int oGrid[rows][cols], char uGrid[rows][cols]);
void chooseAction(int x, int y, int rows, int cols, int oGrid[rows][cols], char uGrid[rows][cols]);
int countFlags(int x, int y, int rows, int cols, char uGrid[rows][cols]);
void markFlag(int x, int y, int rows, int cols, int oGrid[rows][cols], char uGrid[rows][cols]);
void markQM(int x, int y, int rows, int cols, int oGrid[rows][cols], char uGrid[rows][cols]);
void printCharArr(int n, int m, char B[n][m]);


//Global variables
int loseFlag = -1, flags=0, questionMarks =0, moves=0, openedCells=0;
int main()
{
    int rows, cols;
    int timer;
    printf("enter size\n");
    scanf("%d%d",&rows,&cols);
    int mines = 1+(rows*cols)/10;
    printf("enter cell\n");
    int x,y;
    scanf("%d%d",&x,&y);
    clock_t start = clock();
    int oGrid[rows][cols]; // stands for opened grid
    char uGrid[rows][cols]; // stands for user's grid
    generateOpenedGrid(rows,cols,x,y,oGrid);
    save_oGrid(rows, cols,oGrid);
//    printIntArr(rows, cols, oGrid);
    printf("\n\n ----------------------------------- \n \n");
    setToX(rows, cols, uGrid);
    chooseAction(x, y, rows, cols, oGrid, uGrid);
    printCharArr(rows, cols, uGrid);
    printf("Moves : %d\n", moves);
    clock_t end = clock();
    timer=((end-start)/CLOCKS_PER_SEC);

    while(1){
        start = clock();
        scanf("%d%d", &x, &y);
        chooseAction(x, y, rows, cols, oGrid, uGrid);
        save_uGrid(rows, cols, uGrid);
        if(loseFlag == 0){
            printIntArr(rows, cols, oGrid);
            printf("You Lose!");
            break;
        }else if(rows*cols != mines + openedCells){
            printCharArr(rows, cols, uGrid);
        }else{
            printCharArr(rows, cols, uGrid);
            printf("You Win!");
            break;
        }
        printf("Moves : %d\n", moves);
        end = clock();
        timer += (end-start)/CLOCKS_PER_SEC;
        //printf("Time: %d : %d\n",timer/60,timer%60);
    }

    return 0;
}



void generateOpenedGrid(int rows,int cols,int x1,int y1,int oGrid[rows][cols]){
    int x, y;
    int k,l,i;
    int mines=1+(rows*cols)/10;
    setToZero(rows, cols, oGrid);
    for (i=0;i<mines;i++){

        srand(time(NULL));
        x=(int)rand()%(rows);
        y=(int)rand()%(cols);
        while((x==x1 && y==y1) || oGrid[x][y] == 9){
            x=(int)rand()%(rows);
            y=(int)rand()%(cols);
        }

            for(k=x-1; k<=x+1; k++){
                for(l=y-1; l<=y+1; l++){
                    if(oGrid[k][l]!= 9 && k != -1 && l !=-1 && k< rows && l< cols){
                        oGrid[k][l]++;
                    }
                }
            }
            oGrid[x][y] = 9;
        }
}

void printIntArr(int n, int m, int A[n][m]){
    int i, j;
    for(i=0; i<n; i++){
        for(j=0 ; j<m; j++){
            if(A[i][j] != 9){
            printf("%d     ", A[i][j]);
            }else{
            printf("*     ");
            }
        }
        printf("\n");
    }
}

void setToZero(int rows, int cols, int arr[rows][cols]){
    int i,j;
    for(i=0;i<rows;i++){
        for(j=0;j<cols;j++){
            arr[i][j]=0;
        }
    }
}

void setToX(int rows, int cols, char arr[rows][cols]){
    int i,j;
    for(i=0;i<rows;i++){
        for(j=0;j<cols;j++){
            arr[i][j]='X';
        }
    }
}


void save_oGrid(int rows, int cols, int arr[rows][cols]){
        FILE *openedGrid = fopen("openedGrid.txt","w");
        int i,j;
        fprintf(openedGrid, "%d %d\n",rows, cols);
        for(i=0; i<rows; i++){
            for(j=0; j<cols; j++){
                if(arr[i][j] == 9){
                    fprintf(openedGrid, "*    ");
                }else{
                    fprintf(openedGrid, "%d    ", arr[i][j]);
                }
            }
            fprintf(openedGrid, "\n");
        }
        fclose(openedGrid);
}

void save_uGrid(int rows, int cols, char arr[rows][cols]){
    FILE *userGrid = fopen("userGrid.txt", "w");
    fprintf(userGrid, "%d %d\n",rows, cols);
    int i;
    for(i=0; i<rows; i++){
        fwrite(arr[i] , sizeof(char) , cols , userGrid);
        fwrite("\n" , sizeof(char) , 1 , userGrid);
    }
    fclose(userGrid);
}

/*void load_uGrid(int rows, int cols, char arr[rows][cols]);{
 FILE *userGrid = fopen("userGrid.txt", "r");
 fscanf(userGrid, "%d %d", &rows, &cols);

}*/

void openCell(int rows, int cols, int x, int y, int oGrid[rows][cols], char uGrid[rows][cols]){

    if(uGrid[x][y] =='X'){
        uGrid[x][y] = oGrid[x][y]+ '0';
        if(oGrid[x][y] == 9){
            loseFlag = 0;
        }
        openedCells++;
    }

    if(oGrid[x][y] == 0){
        openAdjacentCells(x, y, rows, cols, oGrid, uGrid);
    }

}

void openAdjacentCells(int x, int y, int rows, int cols, int oGrid[rows][cols], char uGrid[rows][cols]){
    int i,j;
    for(i = x-1; i<=x+1; i++){
        for(j=y-1; j<=y+1; j++){
            if(uGrid[i][j] == 'X' && i>=0 && j>=0 && i<rows && j<cols){
                openCell(rows, cols, i, j, oGrid, uGrid);
            }
        }
    }

}


void chooseAction(int x, int y, int rows, int cols, int oGrid[rows][cols], char uGrid[rows][cols]){
    int action;
    printf("To open cell, press 1\nTo mark or unmark with flag, press 2\nTo mark or unmark with question mark, press 3\n");
    scanf("%d", &action);
    if(action == 1){ // User chose to open a cell
        moves++;
        if(oGrid[x][y] == 9){
            loseFlag = 0;
            uGrid[x][y] ='!';
        }else if(uGrid[x][y] == 'X'){
            openCell(rows, cols, x, y, oGrid, uGrid);
        }else if(uGrid[x][y] > '0' && uGrid[x][y] < '9'){
            //We have to check first if adjacent flags are equal to uGrid[x][y]
            int adjFlags = countFlags(x, y, rows, cols, uGrid);
            if(uGrid[x][y] == adjFlags + '0'){
                openAdjacentCells(x,y,rows,cols,oGrid,uGrid);
            }
        }

    }else if(action == 2){ // user chose to mark or unmark with flag
        markFlag(x, y, rows, cols, oGrid, uGrid);

    }else if(action == 3){ // user chose to mark or unmark with question mark
        markQM(x, y, rows, cols, oGrid, uGrid);
    }



}

int countFlags(int x, int y, int rows, int cols, char uGrid[rows][cols]){
    int adjFlags = 0;
    int i,j;
    for(i=x-1; i<= x+1; i++){
        for(j=y-1; j<= y+1; j++){
            if(uGrid[i][j] == 'F' && i>=0 && j>=0 && i<rows && j<cols){
                adjFlags++;
            }
        }
    }
    return adjFlags;
}

void markFlag(int x, int y, int rows, int cols, int oGrid[rows][cols], char uGrid[rows][cols]){
    if(uGrid[x][y] == 'F'){
        uGrid[x][y] = 'X';
        flags --;
    }else if(uGrid[x][y] == 'X'){
        uGrid[x][y] = 'F';
        flags ++;
    }
}

void markQM(int x, int y, int rows, int cols, int oGrid[rows][cols], char uGrid[rows][cols]){
    if(uGrid[x][y] == '?'){
        uGrid[x][y] = 'X';
        questionMarks --;
    }else if(uGrid[x][y] == 'X'){
        uGrid[x][y] = '?';
        questionMarks ++;
    }
}



void printCharArr(int n, int m, char B[n][m]){
    int i, j;
    printf(" ");
    for(i=0;i<m; i++){
        printf("\t%d", i);
    }
    printf("\n");
    for(i=0; i<n; i++){
        printf("%d\t", i);
        for(j=0 ; j<m; j++){
            printf("%c\t", B[i][j]);
        }
        printf("\n");
    }
}






