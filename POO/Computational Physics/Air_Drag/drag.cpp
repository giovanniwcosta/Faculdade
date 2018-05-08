#include<fstream>
#include<string>

using Aceleration = double;
using Drag = double;
using Time = double;
using Velocity = double;
using File = std::string;

constexpr Aceleration g = 9.81;

void drag(Drag b, Time dt, Time t, Velocity v0, File file);

int main(int, char*[]){

	drag(0.8,0.01,12,0,"Date1.txt");

	return 0;
}

void drag(Drag b, Time dt, Time t, Velocity v0, File file){
	std::ofstream date(file);
	date<<0<<" "<<v0<<std::endl;

	for(int i = 1; i*dt < t; ++i){
		v0 = v0 + (g -b*v0)*dt;
		date<<i*dt<<" "<<v0<<std::endl;

	}
}