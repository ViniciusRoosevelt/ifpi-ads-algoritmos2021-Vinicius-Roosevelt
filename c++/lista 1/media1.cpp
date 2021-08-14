#include <stdio.h>
main(){
    printf('### M�dias ###')
    float n1,n2,n3,media;
    printf('Digite 3 notas: ');
    scanf("%f", &n1,&n2,&n3);
    media = ((n1+n2+n3) / 3);
    printf("A media e: %0.2f",media);
}
