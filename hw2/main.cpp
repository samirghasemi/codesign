
#include <iostream>

using namespace std;

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

int main()
{
    cout << filter(1);

    return 0;
}
