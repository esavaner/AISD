#include <iostream>
#include <time.h>
#include <fstream>
#include <chrono>
#include <stdlib.h>

using namespace std;
using namespace std::chrono;

int swapCount =0;
int comparisons = 0;
void swap(int *x, int *y) {
    int temp = *x;
    *x = *y;
    *y = temp;
    swapCount++;
}

void heapify(int arr[], int n, int i) {
    int largest = i;
    int l = 2*i + 1;
    int r = 2*i + 2;
    if (l < n && arr[l] > arr[largest])
        largest = l;
        comparisons++;
    if (r < n && arr[r] > arr[largest])
        largest = r;
        comparisons++;
    if (largest != i) {
        comparisons++;
        swap(&arr[i], &arr[largest]);
        heapify(arr, n, largest);
    }
}

void heapSort(int arr[], int n){
    for (int i = n / 2 - 1; i >= 0; i--)
        heapify(arr, n, i);
    for (int i=n-1; i>=0; i--) {
        swap(&arr[0], &arr[i]);
        heapify(arr, i, 0);
    }
}

void insertionSort(int arr[], int n) {
    int i, key, j;
    for (i = 1; i < n; i++) {
        key = arr[i];
        j = i - 1;
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j = j - 1;
            swapCount++;
            comparisons++;
        }
        arr[j + 1] = key;
    }
}

void selectionSort(int arr[], int n) {
    int i, j, min_idx;
    for (i = 0; i < n-1; i++) {
        min_idx = i;
        for (j = i+1; j < n; j++) {
            if (arr[j] < arr[min_idx]) {
                min_idx = j;
                comparisons++;
            }
        }
        swap(&arr[min_idx], &arr[i]);
    }
}

int partition (int arr[], int low, int high) {
    int pivot = arr[high];
    int i = (low - 1);
    for (int j = low; j <= high- 1; j++) {
        if (arr[j] <= pivot){
            i++;
            swap(&arr[i], &arr[j]);
            comparisons++;
        }
    }
    swap(&arr[i + 1], &arr[high]);
    return (i + 1);
}

void quickSort(int arr[], int low, int high) {
    if (low < high){
        int pi = partition(arr, low, high);
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}

void statSort() {
    ofstream fileS, fileI, fileQ, fileH;
    fileS.open("select.txt");
    fileI.open("insert.txt");
    fileQ.open("quick.txt");
    fileH.open("heap.txt");
    high_resolution_clock::time_point t1, t2;
    for(int n=100; n<=10000; n+=100) {
        int arr[n];
        for(int k=0; k<1; k++) {
            for(int i=0; i<n; i++) {
                arr[i] = i;
            }
            size_t i;


            srand(time(NULL));
            for(i=0; i<n-1; i++) {
                size_t j = i +rand() / (RAND_MAX / (n-i) +1);
                int r = arr[j];
                arr[j] = arr[i];
                arr[i] = r;
            }
            int arrCopy[n];



            swapCount = 0;
            comparisons =0;
            copy(arr, arr+n, arrCopy);
            t1 = high_resolution_clock::now();
            selectionSort(arrCopy, n);
            t2 = high_resolution_clock::now();
            auto duration = duration_cast<nanoseconds>( t2 - t1 ).count();
            fileS << n << " " << comparisons << " " << swapCount << " " << duration << endl;


            swapCount = 0;
            comparisons =0;
            copy(arr, arr+n, arrCopy);
            t1 = high_resolution_clock::now();
            insertionSort(arrCopy, n);
            t2 = high_resolution_clock::now();
            duration = duration_cast<nanoseconds>( t2 - t1 ).count();
            fileI << n << " " << comparisons << " " << swapCount << " " << duration << endl;


            swapCount = 0;
            comparisons =0;
            copy(arr, arr+n, arrCopy);
            t1 = high_resolution_clock::now();
            quickSort(arrCopy, 0, n-1);
            t2 = high_resolution_clock::now();
            duration = duration_cast<nanoseconds>( t2 - t1 ).count();
            fileQ << n << " " << comparisons << " " << swapCount << " " << duration << endl;


            swapCount = 0;
            comparisons =0;
            copy(arr, arr+n, arrCopy);
            t1 = high_resolution_clock::now();
            heapSort(arrCopy, n);
            t2 = high_resolution_clock::now();
            duration = duration_cast<nanoseconds>( t2 - t1 ).count();
            fileH << n << " " << comparisons << " " << swapCount << " " << duration << endl;

            //file << " " << endl;
        }
    }
    fileS.close();
    fileI.close();
    fileQ.close();
    fileH.close();
}
