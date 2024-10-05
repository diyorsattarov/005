import os

# Define the new structure
structure = {
    's': {  # src directory
        'd.cpp': '''
#include "m.h"

void p() {
    std::cout << "W t D S" << std::endl;
}

int main(int argc, char *argv[]) {
    p();
    m m(argv[1], argv[2]);
    std::ofstream f("o.txt");
    m.p(f);
    std::ofstream g("o_f.txt");
    m.f(g);
    g.close();
}
''',
        'f': {  # food directory
            'f.cpp': '''
#include "f.h"

f::f(std::string n, t e, double c) : n(n), e(e), c(c) {}

s::s(std::string n, double c) : f(n, t(0), c) {}

a::a(std::string n, double c) : f(n, t(1), c) {}

m::m(std::string n, double c) : f(n, t(2), c) {}

v::v(std::string n, double c) : f(n, t(3), c) {}

r::r(std::string n, double c) : f(n, t(4), c) {}

std::ostream &operator << (std::ostream &o, const f &f) {
    o << std::endl;
    o << "N: " << f.g() << std::endl;
    o << "T: " << f.t() << std::endl;
    o << "P:" << f.c() << std::endl;
    return o;
}
''',
            'f.h': '''
#ifndef F_H
#define F_H

#include <algorithm>
#include <iostream>
#include <string>
#include <sstream>
#include <fstream>
#include <vector>
#include <stack>
#include <queue>

class f {
    public:
        enum t{s,a,m,v,r};

        f(std::string n, t e, double c);

        t t() const { return e; }

        std::string g() const { return n; }

        double c() const { return c; }

        friend std::ostream &operator << (std::ostream &o, const f &f);

    private:
        std::string n;
        t e;
        double c;
};

class s : public f {
    public:
        s();
        s(std::string n, double c);
        ~s();
};

class a : public f {
    public:
        a();
        a(std::string n, double c);
        ~a();
};

class m : public f {
    public: 
        m();
        m(std::string n, double c);
        ~m();
};

class v : public f {
    public:
        v();
        v(std::string n, double c);
        ~v();
};

class r : public f {
    public:
        r();
        r(std::string n, double c);
        ~r();
};

#endif
'''
        },
        'm': {  # manager directory
            'm.cpp': '''
#include "m.h"
m::m(std::string f1, std::string f2) {
    c(f1);
    o(f2);
}

void m::c(std::string f) {
    s.s(f);
}

void m::o(std::string f) {
    d.l(f);
}

void m::p(std::ofstream &f) {
    s.p(f);
    d.p(f);
}

void m::f(std::ofstream &f) {
    f *t;
    while(d.g() > 0) {
        if(!d.c()->i()) {
            while(d.c()->g() > 0) {
                if((t = s.g(f::t(d.c()->n())))) {
                    d.c()->a(t);
                } else {
                    while((t = d.c()->p())) {
                        m::_t.push(f::t(t->t()));
                        s.a(t);
                    }
                    while(d.c()->g() > 0) {
                        m::_t.push(f::t(d.c()->n()));
                        d.c()->a(nullptr);
                    }
                }
            }
            while(m::_t.size() > 0) {
                d.c()->r(f::t(m::_t.front()));
                m::_t.pop();
            }
            d.c();
        } else if(d.c()->i()) {
            while(d.c()->g() > 0) {
                if((t = s.g(f::t(d.c()->n())))) {
                    d.c()->a(t);
                } else {
                    m::_t.push(f::t(d.c()->n()));
                    d.c()->a(nullptr);
                }
            }
            while(m::_t.size() > 0) {
                d.c()->r(f::t(m::_t.front()));
                m::_t.pop();
            }
            d.c();
        }
    }
    p(f);
}
''',
            'm.h': '''
#ifndef M_H
#define M_H
#include "../s/s.h"
#include "../o/o.h"
class m {
    private:
        s s;
        o d;
        std::queue <f::t> _t;
    public:
        m(std::string, std::string);

        void c(std::string);

        void o(std::string f); 

        void f(std::ofstream&);

        void p(std::ofstream&);
};
#endif
'''
        },
        'o': {  # order directory
            'o.cpp': '''
#include "o.h"

f* o::p() {
    f* t;
    if(f.size() > 0) {
        t = f.front();
        f.pop();
    }
    else {
        t = nullptr;
    }
    return t;
}

void o::a(f *f) {
    if(f == nullptr) {
        r.pop();
    }
    else {
        this->f.push(f);
        r.pop();
    }
}

void o::r(f::t f) {
    r.push(f::t(f));
}


void o::p(std::ofstream &f) {
    std::queue<f::t> t = r;
    std::queue<f*> _t = this->f;
    double l = 0;
    if(!c) {
            f << n << std::endl << "R: ";
            while(t.size() > 0) {
                switch(f::t(t.front())) {
                    case 0:
                    f << "S ";
                    break;
                    case 1:
                    f << "A ";
                    break;
                    case 2:
                    f << "M ";
                    break;
                    case 3:
                    f << "V ";
                    break;
                    case 4:
                    f << "R ";
                    break;
                }
                t.pop();
            }
            f << std::endl << "-" << std::endl;
    }
    else {
        if(a) {
            if(t.size() > 0) {
                f << n << " (P)" << std::endl << "I: " << std::endl; 
                    while(_t.size() > 0) {
                        f << _t.front()->g() << " " << _t.front()->c() << std::endl;
                        l += _t.front()->c();
                        _t.pop();
                    }

                f <<  "U R: ";
                    while(t.size() > 0) {
                        switch(f::t(t.front())) {
                            case 0:
                            f << "S ";
                            break;
                            case 1:
                            f << "A ";
                            break;
                            case 2:
                            f << "M ";
                            break;
                            case 3:
                            f << "V ";
                            break;
                            case 4:
                            f << "R ";
                            break;
                        }
                        t.pop();
                    }
                f << std::endl << "***T: " << l << std::endl << "-" << std::endl;
            }
            else {
                f << n << std::endl << "I: " << std::endl;
                while(_t.size() > 0) {
                    f << _t.front()->g() << " " << _t.front()->c() << std::endl;
                    l += _t.front()->c();
                    _t.pop();
                }
                f << "***T: " << l << std::endl << "-" << std::endl;
            }
        }
        else {
            f << n << " - U t c o" << std::endl << "U R: ";
            while(t.size() > 0) {
                switch(f::t(t.front())) {
                    case 0:
                    f << "S ";
                    break;
                    case 1:
                    f << "A ";
                    break;
                    case 2:
                    f << "M ";
                    break;
                    case 3:
                    f << "V ";
                    break;
                    case 4:
                    f << "R ";
                    break;
                }
                t.pop();
            }
            f << std::endl << "-" << std::endl;
        }       
    }
}
''',
            'o.h': '''
#ifndef O_H
#define O_H
#include "../f/f.h"

class o {
    private:
        std::string n;
        std::queue<f::t> r;
        bool a = false;
        bool c = false;
        std::queue<f*> f;

    public:
        bool i() { return a; }
        
        f::t &n() { return r.front(); }

        void s(std::string n) { this->n = n; }

        void s(bool b) { a = b; }

        void s() { c = true; }

        
        void r(f::t);
        void a(f*);
        f* p();

        void p(std::ofstream &f);

        unsigned int g() { return r.size(); }

};
#endif
''',
            'o.cpp': '''
#include "o.h"

void o::l(std::string f) {
    std::fstream f;
    std::string s, n, t, e;

    f.open(f);

    while(std::getline(f, s)) {
        o *o = new o();
        /* parse the string */
        std::stringstream ss(s);
        ss >> n;
            while(n.at(n.size()-1) != '\"') {
                ss >> e;
                n += " " + e;
            }
        n.erase(std::remove(n.begin(),n.end(),'\"'),n.end());
        o->s(n);

        ss >> e;
        if(e == "yes") {
            o->s(true);
        }

        while(ss >> e) {
            if(e == "sweet") {
                o->r(f::t(0));
            }
            else if(e == "starch") {
                o->r(f::t(1));
            }
            else if(e == "meat") {
                o->r(f::t(2));
            }
            else if(e == "vegetable") {
                o->r(f::t(3));
            }
            else if(e == "fruit") {
                o->r(f::t(4));
            }
        }
        a(o);
    }
    f.close();
}

void o::a(o *o) {
    if(u.size() == 0) {
        u.push(o);
        c = u.front();
    }
    else {
        u.push(o);
    }
}

void o::c() {
    if(u.size() > 0) {
        o::c()->s();
        m.push(o::c());
        u.pop();
        c = u.front();
    }
    else {
        c = nullptr;
    }
}

void o::p(std::ofstream &f) {
    std::queue<o*> t = u;
    std::queue<o*> _t = m;
    f << "- O -" << std::endl;
    while(t.size() > 0) {
        t.front()->p(f);
        t.pop();
    }
    while(_t.size() > 0) {
        _t.front()->p(f);
        _t.pop();
    }
}
''',
            'o.h': '''
#ifndef O_H
#define O_H
#include "o.h"

class o {
    private:
        std::queue<o*> u;
        std::queue<o*> m;
        o* c;
    public:

        void a(o*);

        void c();

        o* c() { return c; }

        void l(std::string f);

        void p(std::ofstream &);

        int g() { return u.size(); }
};
#endif
'''
        },
        's': {  # store directory
            's.cpp': '''
#include "s.h"

f* s::g(f::t(f)) {
    if(b.at(f::t(f)).size() > 0) {
        f *t = b.at(f::t(f)).top();
        b.at(f::t(f)).pop();
        return t;
    }
    else {
        return nullptr;
    }
}

void s::s(std::string f) {
    std::fstream f;
    std::string s, n, t, e;
    double c;

    /* parse the text file */
    f.open(f);
        while(std::getline(f, s)) {
            /* parse the string */
            std::stringstream ss(s);
            ss >> n;
                while(n.at(n.size()-1) != '\"') {
                    ss >> e;
                    n += " " + e;
                }
            ss >> t >> c;
            n.erase(std::remove(n.begin(),n.end(),'\"'),n.end());
            /* create new food object */
            if(t == "sweet") {
                s *o = new s(n, c);
                s::a(o);
            }
            else if(t == "starch") {
                a *o = new a(n, c);
                s::a(o);
            }
            else if(t == "meat") {
                m *o = new m(n, c);
                s::a(o);
            }
            else if(t == "vegetable") {
                v *o = new v(n, c);
                s::a(o);
            }
            else {
                r *o = new r(n, c);
                s::a(o);
            }
        }
    f.close();
}

void s::p(std::ofstream &f) {
    std::stack <f *> t;
    f << "- S -" << std::endl;
        for(unsigned int i = 0; i < 5; i++) {

# ... (previous code remains unchanged)

        's': {  # store directory
            's.cpp': '''
#include "s.h"

f* s::g(f::t(f)) {
    if(b.at(f::t(f)).size() > 0) {
        f *t = b.at(f::t(f)).top();
        b.at(f::t(f)).pop();
        return t;
    }
    else {
        return nullptr;
    }
}

void s::s(std::string f) {
    std::fstream f;
    std::string s, n, t, e;
    double c;

    /* parse the text file */
    f.open(f);
        while(std::getline(f, s)) {
            /* parse the string */
            std::stringstream ss(s);
            ss >> n;
                while(n.at(n.size()-1) != '\"') {
                    ss >> e;
                    n += " " + e;
                }
            ss >> t >> c;
            n.erase(std::remove(n.begin(),n.end(),'\"'),n.end());
            /* create new food object */
            if(t == "sweet") {
                s *o = new s(n, c);
                s::a(o);
            }
            else if(t == "starch") {
                a *o = new a(n, c);
                s::a(o);
            }
            else if(t == "meat") {
                m *o = new m(n, c);
                s::a(o);
            }
            else if(t == "vegetable") {
                v *o = new v(n, c);
                s::a(o);
            }
            else {
                r *o = new r(n, c);
                s::a(o);
            }
        }
    f.close();
}

void s::p(std::ofstream &f) {
    std::stack <f *> t;
    f << "- S -" << std::endl;
    for(unsigned int i = 0; i < 5; i++) {
        switch(i) {
            case 0:
            f << "S: ";
            break;
            case 1:
            f << "A: ";
            break;
            case 2:
            f << "M: ";
            break;
            case 3:
            f << "V: ";
            break;
            case 4:
            f << "R: ";
            break;
        }

        t = b.at(i);
        f << t.size() << " ";
        while(t.size() > 0) {
            if(t.size() > 1) {
                f << t.top()->g() << ", ";
            }
            else {
                f << t.top()->g();
            }
            t.pop();
        }
        f << std::endl;
    }
}
''',
            's.h': '''
#ifndef S_H
#define S_H
#include "../f/f.h"

class s {
    private:
        std::stack <f*> s, a, m, v, r;
        std::vector < std::stack <f*> > b {s, a, m, v, r};
        
    public:
        void a(f *f) { b.at(f->t()).push(f); }

        f* g(f::t);

        void s(std::string f);

        void p(std::ofstream &f);
};
#endif
'''
        }
    }
}

# Function to create directories and files
def create_structure(base_path, structure):
    for item, content in structure.items():
        path = os.path.join(base_path, item)
        if isinstance(content, dict):
            os.makedirs(path, exist_ok=True)
            create_structure(path, content)
        else:
            with open(path, 'w') as file:
                file.write(content)

# Create CMakeLists.txt
cmake_content = '''
cmake_minimum_required(VERSION 3.10)
project(refactored_project)

set(CMAKE_CXX_STANDARD 14)

include_directories(s/f s/m s/o s/s)

add_executable(refactored_project
    s/d.cpp
    s/f/f.cpp
    s/m/m.cpp
    s/o/o.cpp
    s/o/o.cpp
    s/s/s.cpp
)
'''

# Create the project structure
base_path = 'refactored_project'
os.makedirs(base_path, exist_ok=True)
create_structure(base_path, structure)

# Create CMakeLists.txt in the base directory
with open(os.path.join(base_path, 'CMakeLists.txt'), 'w') as cmake_file:
    cmake_file.write(cmake_content)

print("Project structure and files have been created successfully.")
