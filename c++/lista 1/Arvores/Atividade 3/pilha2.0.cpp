#include <iostream>
#include <stack>

using namespace std;


int main() {
    stack <string> letras;


    cout << "Pre ordem" << endl;
    letras.push("b");
    cout << letras.top();
    letras.pop();

    letras.push("d");
    letras.push("a");
    cout << letras.top();
    letras.pop();
    cout << letras.top();
    letras.pop();


    letras.push("f");
    letras.push("c");
    cout << letras.top();
    letras.pop();
    cout << letras.top() << endl;
    letras.pop();

    cout << "In-Ordem" << endl;

    letras.push("a");
    cout << letras.top();
    letras.pop();

    letras.push("d");
    letras.push("b");
    cout << letras.top();
    letras.pop();
    cout << letras.top();
    letras.pop();

    letras.push("c");
    cout << letras.top();
    letras.pop();
    letras.push("f");
    cout << letras.top() << endl;
    letras.pop();


    cout << "Pos-ordem" << endl;

    letras.push("a");
    cout << letras.top();
    letras.pop();

    letras.push("b");
    letras.push("d");
    cout << letras.top();
    letras.pop();
    cout << letras.top();

    letras.push("f");
    letras.push("c");
    cout << letras.top();
    letras.pop();
    cout << letras.top();




    





    




    return 0;
}