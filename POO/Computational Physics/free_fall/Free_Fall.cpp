/*
	This program calculate the velocity of a object in free fall, by mean of Euler's method 
*/

#include<fstream>
#include<string>

using Time = double;
using velocity = double;
using Date = std::string;

constexpr double g{9.81};

void free_fall(Time t, Time dt, Date d);

int main(int, char*[]){
	
	free_fall(10,0.001,"Date1.txt");
	free_fall(10,0.01,"Date2.txt");
	free_fall(10,0.1,"Date3.txt");

	return 0;
}

void free_fall(Time t, Time dt, Date d){
	
	std::ofstream out(d);
	velocity v = 0;
	out<<0<<" "<<v<<std::endl;
	for(int i=1; i*dt <= t; ++i){
		v -= g*dt;
		out<<i*dt<<" "<<v<<std::endl;
	}
}