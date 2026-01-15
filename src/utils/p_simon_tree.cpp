#include <iostream>
#include <string>
#include <string_view>

#include "data/SimonTree.h"
// #include "data/PSimonTree.h"

using namespace SimonTree;

// ------------------
// A simple test driver for PSimonTree.cpp
// ------------------
int main() {
    string w;
    cout << "Enter the word: ";
    cin >> w;

    while(w.size() >= 1) {
        int n = w.size();

        w = w + "$";
        vector<int> X = computeX(w);

        auto root = make_shared<Node>(-1, n + 1, 0);
        shared_ptr<Node> p = root;

        for (int i = n; i >= 1; --i) {
            auto a = findNode(i, X, p);
            tie(root, p) = splitNode(i, root, a);
        }

        fixTree(root, n);

        cout << "\n Constructed Simon-Tree for " << w << ":\n\n";
        printTree(root, w);

        w.pop_back();
        w.pop_back();
    } 

    return 0;
}