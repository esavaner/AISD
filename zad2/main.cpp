#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include "algorithms.h"

using namespace std;


int sortParam(vector<string> s, int arr[], int n) {
    if(s[2] == "--desc") {
        for(int i=0; i<n; i++) {
            arr[i] = -arr[i];
        }
    }
    if (s[0] == "--type") {
        if (s[1] == "select") {
            selectionSort(arr, n);
        } else if (s[1] == "insert") {
            insertionSort(arr, n);
        } else if (s[1] == "heap") {
            heapSort(arr, n);
        } else if (s[1] == "quick") {
            quickSort(arr, 0, n-1);
        } else if (s[1] == "mquick") {

        }
    }
    if(s[2] == "--desc") {
        for(int i=0; i<n; i++) {
            arr[i] = -arr[i];
        }
    }
    int i = 0;
    while (i < n) {
        cout << arr[i] << " ";
        i++;
    }
}

int main() {
    string param, tok;
    cout << "Parametry:" << endl;
    getline(cin, param);
    stringstream sin(param);
    vector<string> internal;
    while (getline(sin, tok, ' ')) {
        internal.push_back(tok);
    }
    if(internal[0] == "--stat") {
        statSort();
    }
    else {
        cout << "Liczba elementow do posortowania:" << endl;
        getline(cin, param);
        int n = stoi(param);
        cout << "Ciag:" << endl;
        getline(cin, param);
        int arr[1000];
        int j = 0;
        stringstream stream(param);
        while (stream) {
            stream >> arr[j];
            j++;
        }
        sortParam(internal, arr, n);
    }
}
