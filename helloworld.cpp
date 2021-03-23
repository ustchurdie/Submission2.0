#include <iostream>

using namespace std;

int main(){
  int n;
  double z;
  cout << "Enter the size of the array: " ;
  cin >> n;
  double A[n];
  for (int i =0;i<n;i++){
    cout << "Enter number for the position:" ;
    cin >> z;
    A[i] = z;
  }
  
  for (int j: A){
    cout << j << " " ;
  }

  return 0;
}
