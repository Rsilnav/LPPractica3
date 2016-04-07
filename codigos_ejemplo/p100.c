#include <stdio.h>;

int cycle(m)
    int m;
{
    int i = 1;

    while (m != 1){
        if (m % 2 == 0){
            m = m/2;
        }
        else{
            m = 3*m+1;
        }
        i++;
    }
    return i;
}

int main(){
    int m,n,max,temp;
    int mOriginal,nOriginal;
    int i;

    while (scanf("%d %d\n",&amp;m,&amp;n)==2){

        mOriginal = m;
        nOriginal = n;

        if (m &gt; n){
            temp = m;
            m = n;
            n = temp;
        }

        max = cycle(m);
        for(i=m+1;i&lt;=n;i++) {
            temp = cycle(i);
            if (temp &gt; max)
            max = temp;
        }
        printf("%d %d %d\n",mOriginal,nOriginal,max);
    }
    return(0);
}
