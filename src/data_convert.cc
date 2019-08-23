#include <iostream>
#include <fstream>
#include <vector>

/*
 * cd ../scripts
 * g++ -Wall -std=c++11 ../src/data_convert.cc -o data_convert
 * ./data_convert <lmbench output file>
 */
using namespace std;

/* put tabe between first keyword and rest of the words.
 */
const vector<string> tab_keywords = {
	"mhz", "MemTotal",
        "MB for test:", "ENOUGH:", "Simple syscall:", "Simple read:",
	"Simple write:", "Simple stat:", "Simple fstat:",
	"Simple open/close:", "Simple handler installation:",
	"Simple hander overhead:", "Protection fault:", "Pipe latency:",
	"Signal handler installation:", "Signal handler overhead:",
	"Pipe bandwidth:", "AF_UNIX sock stream latency:",
	"AF_UNIX sock stream bandwidth:", "Process fork+exit:",
	"Process fork+execve:", "Procedure call:", "tlb:",
	"integer bit:", "integer add:", "integer mul:", "integer div:",
	"integer mod:", "int64 bit:", "uint64 add:", "int64 mul:", "int64 div:",
	"int64 mod:", "float add:", "float mul:", "float div:", "double add:",
        "double mul:", "double div:", "float bogomflops:", "double bogomflops:",
	"number of processes,", "parallelism:", "latency:", "bandwidth:"
};

/* These are key sections words and no need to covert for these workds.
 */
const vector<string> section_keywords = {
	"LMBENCH MEASUREMENT", "[",
	"bw_file_rd", "memory read bandwidth", "memory write bandwidth",
	"bw_mmap_rd", "mmap read open2close bandwidth",
	"LMBENCH_VER", "BANDWIDTH MEASUREMENT", 
	"LATENCY MEASUREMENTS", "lat_mem_rd", "lat_mmap", "lat_ops",
	"OTHER MEASUREMENTS", "size, ovr: non-context switching overhead(usec)",
	"size of file,", "Pagefaults on"
};

string is_tab_keywords(string line) {
	for(auto str: tab_keywords)
		if(line.find(str) != string::npos) 
			return str;
	return "";
};

string is_section_keywords(string line) {
	for(auto str: section_keywords)
		if(line.find(str) != string::npos)
			return str;
	return "";
}

string line_split_tab(string line, string word) {
	string out;
	const vector<string> units = {"nanoseconds","microseconds",  "MB/sec", "KB/sec", "pages"};
	if(line.find(word) != string::npos) {
		int idx = line.find(word) + word.size();
		out = line.substr(0, idx) + ',';
		string rest = line.substr(idx, line.size()-idx);
	        while(rest.size() > 0 && rest[0] == ' ')
			rest.erase(0,1);
		out += rest;
	} else {
		return line;
	}
	for (auto unit: units)
		if(out.find(unit) != string::npos)
			out.replace(out.find(unit)-1, unit.size()+1, ',' + unit);

	return out;
}

string line_replace_tab(string line) {
	auto ret = line.find(" ");
	while((ret = line.find(" ")) != string::npos) {
		if(line.find("  ") != string::npos)
			line.replace(ret, 2, " ");
		else
			line.replace(ret, 1, ",");
	}
	while((ret = line.find("\t")) != string::npos) {
		if(line.find("\t\t") != string::npos)
			line.replace(ret, 2, "\t");
		else
			line.replace(ret, 1, ",");
	}
	return line;
}

int main(int argc, char **argv) {
	if (argc != 2) {
		cerr << "Usage: " << argv[0] << " <lmbench out file>" << endl;
		return -1;
	}

	ifstream input_file (argv[1]);
	if(!input_file) {
		cerr << argv[1] << " can't be opened!!!" << endl;
		return -1;
	}
	string output(argv[1]);
	output.replace(output.find(".txt"), 4, ".csv");
	ofstream output_file (output);

	string line;
	string err_str;
	while (getline(input_file, line)) {
		if(!line.empty() && line[0] == '"')
			line.erase(0);
		if(is_section_keywords(line) != "")
			output_file << line << endl;
		else if ((err_str = is_tab_keywords(line)) != "")
			output_file << line_split_tab(line, err_str) << endl;
		else if (line.empty())
			continue;
		else
			output_file << line_replace_tab(line) << endl;
	}

	input_file.close();
	output_file.close();

	return 0;
}
