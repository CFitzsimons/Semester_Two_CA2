#include <iostream>
#include <sstream>
#include <string>
#include <math.h>
#include <cstdlib>
using namespace std;

float sqRoot(float input);

int main(){

    float number;
    
    //This whole loop ensures that the input is correct
    //i.e. A floating point number.
    while(true){
        string input;
        cout << "Please enter a valid float" << endl;
        getline(cin, input);
        stringstream forTest(input);
        if(forTest >> number)
            break;
        cout << "Sorry, that's not a valid number" << endl;
        
    }//Close input check.
    cout << "Valid number entered, your Square root is: " << sqRoot(number) << endl;
        
    return 0;
}
//**************************************//
//Summary:      Calculates the square root of number
//Parameters:   Takes a floating point number, to be rooted.
//Return:       Calculated sum or 0, depending on input. (Ignoring negatives to 
//              reduce program complexity)
//**************************************//
float sqRoot(float input){
    if(input < 0){//We are not dealing with imaginary numbers.
        cerr << "Number is below 0, exiting program" << endl;
        exit (EXIT_FAILURE);
    }else if(input == 0)
        return 0;
    return sqrt(input);
}
    
    