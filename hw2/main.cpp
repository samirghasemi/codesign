#include <iostream>
#include<string.h>

using namespace std;

int hexaToDecimal(char num[]) {
    int len = strlen(num);
    int base = 1;
    int temp = 0;
    for (int i=len-1; i>=0; i--) {
        if (num[i]>='0' && num[i]<='9') {
            temp += (num[i] - 48)*base;
            base = base * 16;
        }
        else if (num[i]>='A' && num[i]<='F') {
            temp += (num[i] - 55)*base;
            base = base*16;
        }
    }
    return temp;
}

void decimalToHexa(int n)
{
    // char array to store hexadecimal number
    char hexaDeciNum[100];

    // counter for hexadecimal number array
    int i = 0;
    while (n != 0) {
        // temporary variable to store remainder
        int temp = 0;

        // storing remainder in temp variable.
        temp = n % 16;

        // check if temp < 10
        if (temp < 10) {
            hexaDeciNum[i] = temp + 48;
            i++;
        }
        else {
            hexaDeciNum[i] = temp + 55;
            i++;
        }

        n = n / 16;
    }

    // printing hexadecimal number array in reverse order
    for (int j = i - 1; j >= 0; j--)
        cout << hexaDeciNum[j];
}


int filter(int a) {
    int taps[] = {1, 2, 3, 4, 5};
    int c[] = {-1, 5, 10, 5, -1};
    int r;
    for (int i=0; i<4; i++)
        taps[i] = taps[i+1];
    taps[4] = a;
    r = 0;
    for (int i=0; i<5; i++)
        r = r + taps[i] * c[i];
    return r;
}
void test(char *num){
    int n = hexaToDecimal(num);
    int res = filter(n);
    cout << "Input  : " << num << "\n";
    cout << "Output : "<< hex << res;
    cout << "\n------------\n";
}
void t1(char *num){
    int n = hexaToDecimal(num);
    int res = filter(n);
    cout << "Input  : " << num << " ---- " << n << "\n";
    cout << "Output : " << hex << res << " ---- ";
    cout << "\n------------\n";
}
int main()
{
    char *inputs[10] = { "1", "14","27", "3A" , "4D" ,"60", "73" , "86", "99","AC" };
    for (int i = 0; i < 10; ++i) {
        test(inputs[i]);
    }
    return 0;
}
