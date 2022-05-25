#include <stdio.h>

volatile unsigned int *req = (unsigned int *) 0x80000000;
volatile unsigned int *ack = (unsigned int *) 0x80000008;

volatile unsigned int *ppp = (unsigned int *) 0x80000018;
volatile unsigned int *qqq = (unsigned int *) 0x80000020;
volatile unsigned int *eee = (unsigned int *) 0x80000028;
volatile unsigned int *ddd = (unsigned int *) 0x80000030;
volatile unsigned int *msg = (unsigned int *) 0x80000038;

volatile unsigned int *enc = (unsigned int *) 0x80000040;
volatile unsigned int *dec = (unsigned int *) 0x80000048;

void req1() {
    *req = 1;
}

void await1(){
    while (*ack == 1);
}

void await2(){
    while (*ack == 2);
}

int main(){
    *ppp = 59;
    *qqq = 43;
    *eee = 4241;
    *ddd = 1301;
    *msg = 1234;

    // data proxy
    req1();
    await1();

    // do encryption
    // do decryption
    await2();

    // result
    printf("[SOFTWARE] encrypted data fetched using proxy = %d \n", *enc);
    printf("[SOFTWARE] decrypted data fetched using proxy = %d \n", *dec);

}
