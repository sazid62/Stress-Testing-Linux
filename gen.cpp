#include <bits/stdc++.h>
using namespace std;
mt19937 rng(chrono::steady_clock::now().time_since_epoch().count());
int rnd(int l, int r) {
    return rng() % (r - l + 1) + l;
}
 

int main() {
     
    int n = rnd(13, 15);   
    cout << n << endl;

    for (int i = 1; i <= n; i++) {
        cout << rnd(2, 100) << " ";  
    cout << endl;

    return 0;
}
