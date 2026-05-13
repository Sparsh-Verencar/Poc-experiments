#include<iostream>
#include<set>
#include<string>
#include<vector>
#include<sstream>
using namespace std;

class Grammar {
private:
    vector<string> productions;
    set<char> nonTerminals;
    set<char> first[100];
    set<char> follow[100];
    char startSymbol;

public:
    Grammar() : startSymbol('\0') {}
    void inputGrammar() {
        cout << "Enter grammar (one production per line, format: A->B|C|a)" << endl;
        cout << "Enter 'END' to finish:" << endl;
        
        string line;
        while(cin >> line && line != "END") {
            if(line.find("->") != string::npos) {
                productions.push_back(line);
                nonTerminals.insert(line[0]);
                if(startSymbol == '\0') startSymbol = line[0];
            }
        }
    }
    void computeFirst() {
        bool changed = true;
        for(string prod : productions) {
            string rhs = prod.substr(prod.find("->") + 2);
            
            for(int i = 0; i < rhs.length(); i++) {
                if(rhs[i] == '|') continue;
                
                if(!isNonTerminal(rhs[i])) {
                    first[prod[0]].insert(rhs[i]);
                    i = rhs.find('|', i);
                    if(i == string::npos) break;
                }
            }
        }
        while(changed) {
            changed = false;
            for(string prod : productions) {
                char lhs = prod[0];
                string rhs = prod.substr(prod.find("->") + 2);
                vector<string> alternatives;
                stringstream ss(rhs);
                string alt;
                while(getline(ss, alt, '|')) {
                    alternatives.push_back(alt);
                }
                for(string alt : alternatives) {
                    if(alt.empty()) continue;
                    for(int i = 0; i < alt.length(); i++) {
                        char c = alt[i];
                        if(c == '#') {
                            if(first[lhs].insert('#').second) changed = true;
                            break;
                        }
                        if(isNonTerminal(c)) {
                            int oldSize = first[lhs].size();
                            for(char ch : first[c]) {
                                if(ch != '#') first[lhs].insert(ch);
                            }
                            if(first[lhs].size() > oldSize) changed = true;
                            
                            if(first[c].count('#') == 0) break;
                        } else {
                            if(first[lhs].insert(c).second) changed = true;
                            break;
                        }
                    }
                }
            }
        }
    }
    void computeFollow() {
        follow[startSymbol].insert('$');
        bool changed = true;
        while(changed) {
            changed = false;
            for(string prod : productions) {
                char lhs = prod[0];
                string rhs = prod.substr(prod.find("->") + 2);
                vector<string> alternatives;
                stringstream ss(rhs);
                string alt;
                while(getline(ss, alt, '|')) {
                    alternatives.push_back(alt);
                }
                for(string alt : alternatives) {
                    for(int j = 0; j < alt.length(); j++) {
                        char c = alt[j];
                        if(isNonTerminal(c)) {
                            int oldSize = follow[c].size();
                            for(int k = j + 1; k < alt.length(); k++) {
                                char next = alt[k];
                                if(isNonTerminal(next)) {
                                    for(char ch : first[next]) {
                                        if(ch != '#') follow[c].insert(ch);
                                    }
                                    if(first[next].count('#') == 0) break;
                                } else {
                                    follow[c].insert(next);
                                    break;
                                }
                            }
                            if(j == alt.length() - 1) {
                                for(char ch : follow[lhs]) {
                                    follow[c].insert(ch);
                                }
                            }
                            if(follow[c].size() > oldSize) changed = true;
                        }
                    }
                }
            }
        }
    }
    void display() {
        cout << "\n========== FIRST SETS ==========" << endl;
        for(char nt : nonTerminals) {
            cout << "FIRST(" << nt << ") = { ";
            for(char c : first[nt]) {
                cout << c << " ";
            }
            cout << "}" << endl;
        }
        cout << "\n========== FOLLOW SETS ==========" << endl;
        for(char nt : nonTerminals) {
            cout << "FOLLOW(" << nt << ") = { ";
            for(char c : follow[nt]) {
                cout << c << " ";
            }
            cout << "}" << endl;
        }
    }
private:
    bool isNonTerminal(char c) {
        return nonTerminals.count(c) > 0;
    }
};
int main() {
    Grammar g;
    g.inputGrammar();
    g.computeFirst();
    g.computeFollow();
    g.display();
    return 0;
}