// This program is to calculate the radioactive decay
// by means of Eulers algorithm

#include <vector>
#include <iostream>
#include <cmath>
#include <fstream>

using Nu = std::vector<double>;
using Time = double;
using Particles = double;
/*
constexpr double half_life_uraniun = 12*360;
constexpr double number_isotop = 100;
constexpr double time_max = 62*360; 
constexpr double pass = 0.01;
*/
constexpr Time half_life_uraniun = 5.02396992*std::pow(10,18);
constexpr Particles number_isotop = pow(10,26);
constexpr Time time_max = 5*half_life_uraniun; 
constexpr Time pass = 300000000000000;


// Nu decay(Time dt,double n0,Time th,Time t);
void decay_date(Time dt, Particles n0, Time th, Time t);

int main(int, char*[]){
	
	decay_date(pass,number_isotop,half_life_uraniun,time_max);

	return 0;
} 

/*
Code for make out put at a vector, but due date's size, it's not able   
Nu decay(Time dt, double n0, Time th, Time t){
	
	Nu number_particles_time;

	for(int i = 0; i*dt <= t; ++i){
		n0 = n0 - n0/th*dt;
		number_particles_time.push_back(n0);
	}
	return number_particles_time;
}*/

void decay_date(Time dt, Particles n0, Time th, Time t){
	
	std::ofstream date("date.txt");
	
	for(int pass = 0; pass*dt <= t; ++pass){
		n0 = n0 - n0/th*dt;
		date<<i*dt<<" "<<n0<<std::endl;
	}
}