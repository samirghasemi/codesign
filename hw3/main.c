#include <stdio.h>

volatile unsigned int *req =            (unsigned int *) 0x80000000;
volatile unsigned int *ack =            (unsigned int *) 0x80000010;

volatile unsigned int *p =              (unsigned int *) 0x80000020;
volatile unsigned int *q =              (unsigned int *) 0x80000030;
volatile unsigned int *e =              (unsigned int *) 0x80000040;
volatile unsigned int *d =              (unsigned int *) 0x80000050;
volatile unsigned int *m =              (unsigned int *) 0x80000060;

volatile unsigned int *encrypted_data = (unsigned int *) 0x80000070;
volatile unsigned int *decrypted_data = (unsigned int *) 0x80000080;

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
    *p = 23;
    *q = 2;
    *e = 17;
    *d = 31;
    *m = 20;

    req1();
    await1();
    // doing encryption and decryption
    await2();

    // print results of encryption and decryption
    printf("SOFTWARE----> encrypted data = %d \n", *encrypted_data);
    printf("SOFTWARE----> decrypted data = %d \n", *decrypted_data);

}
