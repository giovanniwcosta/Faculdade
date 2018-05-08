// This program is to calculate the radioactive decay
// by means of Eulers algorithm

#include <array>
#include <iostream>
#include <cmath>
#include <fstream>
#include <string>

using Time = double;
using Population = double;
using File = std::string;

struct sample{
	Population p0,
	Time th,
	File file;
}

void coupled_decay_date(std::array<sample,2> sam,Time t, Time dt);

int main(int, char*[]){
	std::array<sample, 2> samples;

	samples[0].p0 = 1000;
	samples[1]p0 = 1000;

	samples[0].th = 3600*24*365*10;
	samples[1].th = 3600*24*365*100;

	samples[0].file = "dadosa.txt";
	samples[0].file = "dadosb.txt";

	coupled_decay_date(samples);

	return 0;
} 

void coupled_decay_date(std::array<sample,2> sam, Time t, Time dt){
	
	std::ofstream dataa(sam[0].file);
	std::ofstream datab(sam[0].file);
	Population temp;

	for(int i = 1; i*dt <= t; ++i){
		temp = sam[0].p0;
		sam[0].p0 = sam[0].p0 - sam[0].n0/sam[0].th*dt;
		dataa<<i*dt<<" "<<sam[0].p0<<std::endl;

		sam[1].p0 = sam[1].p0 + (temp/sam[0].th - sam[1].p0/sam[1].th)*dt;
		datab<<i*dt<<" "<<sam[1].p0<<std::endl;


	}
}