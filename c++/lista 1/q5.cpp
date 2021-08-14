/* Leia uma velocidade em km/h, calcule e escreva esta velocidade em m/s. (Vm/s = Vkm/h / 3.6) */
#include <stdio.h>
#include <math.h>
int main(){
    float v1,v2;
    printf("Insira a velocidade a ser transformada em km/h:\n");
    scanf("%f", &v1);
    v2 = (v1 * 3.6);
    printf("A velociade e m/s:%0.0f",v2);
}