#include <iostream>
#include <cstdlib>
#include <time.h>
using namespace std;

int main(){
    const int size = 6;
    int odd = 0, lteTwo = 0;
    srand(time(NULL));
    
    //Initalise all slots to 0.
    int diceRolls [size];
    for(int i = 0; i < size; i++)
        diceRolls[i] = 0;
        
    //Generate 1000 random numbers.
    for(int i = 0; i < 1000; i++)
        diceRolls[rand()%size]++;

    //Cycles though the size array slots gathering information
    for(int i = 0; i < size; i++){
        if(i % 2 == 0) //Odd because array[0] = One on a dice.
            odd += diceRolls[i];
        if(i < 2) //Number is less then or equal to two
            lteTwo += diceRolls[i];
    }
    cout << "Number of times odd numbers cropped up: " << odd << endl;
    cout << "Numer of times a six occured: " << diceRolls[5] << endl;
    cout << "Numbers that were less then or equal to two: " << lteTwo << endl;
    
    /*
    * Now we have to do some further calculations to see if the data is
    * fair and holds up to the standard random generation logic. To test this
    * I will be increasing the sample space to 1 million, this should provide
    * a much more even distribution of numbers.  After we view the output we can
    * then determine if the generator is operating correctly and providing a 
    * psudo random distribution.
    */
    cout << "Further testing simulations " << endl;
    //Runs the test another 1million times
    for(int i = 0; i < 1000000; i++)
        diceRolls[rand()%size]++;
        
    //Calculates the probabilty of the new values.    
    for(int i = 0; i < size; i++){
        double temp = diceRolls[i]/1001000.0; //P(temp) = favourable/total
        cout << "Probability of a " << i << " occuring is: " 
                << temp << endl;
    }
    /*
    * After viewing the result I would say that the PRNG is random as per my
    * testing methodology.
    */
    return 0;
}