#include <stdio.h>

volatile unsigned int *req =      (unsigned int *) 0x80000000;
volatile unsigned int *ack =      (unsigned int *) 0x80000004;

volatile unsigned int *input_0 =  (unsigned int *) 0x80000008;
volatile unsigned int *input_1 =  (unsigned int *) 0x8000000c;
volatile unsigned int *input_2 =  (unsigned int *) 0x80000010;
volatile unsigned int *input_3 =  (unsigned int *) 0x80000014;
volatile unsigned int *input_4 =  (unsigned int *) 0x80000018;
volatile unsigned int *input_5 =  (unsigned int *) 0x8000001c;
volatile unsigned int *input_6 =  (unsigned int *) 0x80000020;
volatile unsigned int *input_7 =  (unsigned int *) 0x80000024;

volatile unsigned int *output_0 = (unsigned int *) 0x80000028;
volatile unsigned int *output_1 = (unsigned int *) 0x8000002c;
volatile unsigned int *output_2 = (unsigned int *) 0x80000030;
volatile unsigned int *output_3 = (unsigned int *) 0x80000034;
volatile unsigned int *output_4 = (unsigned int *) 0x80000038;
volatile unsigned int *output_5 = (unsigned int *) 0x8000003c;
volatile unsigned int *output_6 = (unsigned int *) 0x80000040;
volatile unsigned int *output_7 = (unsigned int *) 0x80000044;

signed int double_to_twoscomplement(double number){
    return (int) (number *64);
}

double twoscomplement_to_double(int number){
    int neg = number & 0x32768;
    number = number & 65535;
    if (number){
        int x = number - 1;
        x = ~ x;
        number = x ;
        return ((double)number) / 64 * -1;
    }else{
        return ((double)number) / 64;
    }
}

void req0() {
    *req = 0;
}
void req1() {
    *req = 1;
}

void await0(){
    while (*ack == 0);
}
void await1(){
    while (*ack == 1);
}

void await2(){
    while (*ack == 2);
}

void await3(){
    while (*ack == 3);
}

void await4(){
    while (*ack == 4);
}

void await5(){
    while (*ack == 5);
}

void await6(){
    while (*ack == 6);
}

void await7(){
    while (*ack == 7);
}

void await8(){
    while (*ack == 8);
}

void await9(){
    while (*ack == 9);
}

void await10(){
    while (*ack == 10);
}

void await11(){
    while (*ack == 11);
}


void set_x(){
    req0();
    *input_0 = double_to_twoscomplement(1);
    *input_1 = double_to_twoscomplement(1);
    *input_2 = double_to_twoscomplement(0);
    *input_3 = double_to_twoscomplement(0);
    *input_4 = double_to_twoscomplement(1);
    *input_5 = double_to_twoscomplement(1);
    *input_6 = double_to_twoscomplement(0);
    *input_7 = double_to_twoscomplement(0);
    req1();
}

void set_y(){
    req1();
    *input_0 = double_to_twoscomplement(0);
    *input_1 = double_to_twoscomplement(0);
    *input_2 = double_to_twoscomplement(0);
    *input_3 = double_to_twoscomplement(0);
    *input_4 = double_to_twoscomplement(0);
    *input_5 = double_to_twoscomplement(0);
    *input_6 = double_to_twoscomplement(0);
    *input_7 = double_to_twoscomplement(0);
    req0();
}
void set_us_odd(double u1,double u2){
    req0();
    *input_0 = double_to_twoscomplement(u1);
    *input_1 = double_to_twoscomplement(u2);
    req1();
}

void set_us_even(double u1,double u2){
    req1();
    *input_0 = double_to_twoscomplement(u1);
    *input_1 = double_to_twoscomplement(u2);
    req0();
}

int main(){
    set_x();    
    await0();

    set_y();    
    await1();
    
    int dir=1;
    int n = 8;
    double c1 = -1.0;
    double c2 = 0.0;
    double u1 = 1.0;
    double u2 = 0.0;
    double z;

    set_us_odd(u1,u2);
    await2();


    c2 = sqrt((1.0 - c1) / 2.0);
    if (dir == 1)
        c2 = -c2;
    c1 = sqrt((1.0 + c1) / 2.0);
    u1 = 1.0;
    u2 = 0.0;
    set_us_even(u1,u2);
    await3();

    z =  u1 * c1 - u2 * c2;
    u2 = u1 * c2 + u2 * c1;
    u1 = z;
    set_us_odd(u1,u2);
    await4();

    c2 = sqrt((1.0 - c1) / 2.0);
    if (dir == 1)
        c2 = -c2;
    c1 = sqrt((1.0 + c1) / 2.0);
    u1 = 1.0;
    u2 = 0.0;
    set_us_even(u1,u2);
    await5();

    z =  u1 * c1 - u2 * c2;
    u2 = u1 * c2 + u2 * c1;
    u1 = z;
    set_us_odd(u1,u2);
    await6();
    
    z =  u1 * c1 - u2 * c2;
    u2 = u1 * c2 + u2 * c1;
    u1 = z;
    set_us_even(u1,u2);
    await7();

    z =  u1 * c1 - u2 * c2;
    u2 = u1 * c2 + u2 * c1;
    u1 = z;
    set_us_odd(u1,u2);
    await8();

    await9();
    double x0 = twoscomplement_to_double(*output_0);
    double x1 = twoscomplement_to_double(*output_1);
    double x2 = twoscomplement_to_double(*output_2);
    double x3 = twoscomplement_to_double(*output_3);
    double x4 = twoscomplement_to_double(*output_4);
    double x5 = twoscomplement_to_double(*output_5);
    double x6 = twoscomplement_to_double(*output_6);
    double x7 = twoscomplement_to_double(*output_7);
    req0();
    await10();
    double y0 = twoscomplement_to_double(*output_0);
    double y1 = twoscomplement_to_double(*output_1);
    double y2 = twoscomplement_to_double(*output_2);
    double y3 = twoscomplement_to_double(*output_3);
    double y4 = twoscomplement_to_double(*output_4);
    double y5 = twoscomplement_to_double(*output_5);
    double y6 = twoscomplement_to_double(*output_6);
    double y7 = twoscomplement_to_double(*output_7);
    

    printf("X = [%d, %d, %d, %d, %d, %d, %d, %d, %d, %d]\n",x0,x1,x2,x3,x4,x5,x6,x7);
    printf("Y = [%d, %d, %d, %d, %d, %d, %d, %d, %d, %d]\n",y0,y1,y2,y3,y4,y5,y6,y7);

    req1();
    // req1();
    // await1();
    // // doing encryption and decryption
    // await2();

    // // print results of encryption and decryption
    // printf("SOFTWARE----> encrypted data = %d \n", *encrypted_data);
    // printf("SOFTWARE----> decrypted data = %d \n", *decrypted_data);
    // return 0;
}

