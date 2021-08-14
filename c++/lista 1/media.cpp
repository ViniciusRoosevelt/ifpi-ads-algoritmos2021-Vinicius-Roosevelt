#include <stdio.h>
int main(){
   float n1,n2,n3,media;
   printf("Digite as notas: ");
   scanf("%f%f%f",&n1,&n2,&n3);
   media = ((n1+n2+n3) / 3);
   printf("As media das notas foram %0.2f",media);
}