#include <math.h>
#include <stdio.h>
int main(){
    float base,altura,area;
    printf("Digite a base do triangulo:\n");
    scanf("%f", &base);
    printf("Digite a altura do triangulo:\n");
    scanf("%f", &altura);
    area = (base * altura);
    printf("A area desse triangulo e %0.2f",area);

}