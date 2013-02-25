#include <iostream>
#include <cstdlib>
#include <time.h>
#include <string>
#include <sstream>
using namespace std;

//Method declarations
string maxValue(int [], int);
string makeReturn(int,int,double);

int main(){
    //Some declarations
    const int size = 10;
    srand(time(NULL)); //Seed for PRG
    int intArray [size];
    
    //Puts random(?) values into the array
    for(int i = 0; i < size; i++){
        intArray[i] =  rand()%100 + 1;
    }
    //Output min, max and average values
    cout << maxValue(intArray, size);

    return 0;
}
//**************************************//
//Summary:      Returns the min, max and average of a given array
//Parameters:   Takes the array and the size of the array
//Return:       Formatted string containing the min, max and average
//**************************************//
string maxValue(int array [10], int maxSize){
    //Giving the variables starting values
    int largest = array[0];
    int min = largest;
    double average = largest;
    //Loop starts at 0 because this value has already been added.
    for(int i = 1; i < maxSize; i++){
        //Check currerent against largest/min values
        if(array[i] > largest)
            largest = array[i];
        else if(array[i] < min)
            min = array[i];
        //Add the value onto the average
        average += array[i];
    }
    average =  average/maxSize;
    return makeReturn(min, largest, average);
}
//**************************************//
//Summary:      Returns a formated string with given values
//Parameters:   Takes in the min, max and average
//Return:       Formatted string containing the min, max and average
//**************************************//
string makeReturn(int min, int max, double average){
    stringstream stringOut;
    stringOut << "Min: " << min << "\n";
    stringOut << "Max: " << max << "\n";
    stringOut << "Avg: " << average << "\n";
    return stringOut.str();
}