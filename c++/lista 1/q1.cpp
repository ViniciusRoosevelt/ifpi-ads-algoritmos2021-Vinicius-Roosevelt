/* Leia uma velocidade em m/s, calcule e escreva esta velocidade em km/h. (Vkm/h = Vm/s * 3.6) */
#include <stdio.h>
#include <math.h>
int main(){
    float v1,v2;
    printf("Insira a velocidade a ser transformada em m/s:\n");
    scanf("%f", &v1);
    v2 = (v1 / 3.6);
    printf("A velociade e:%0.0f",v2);
}