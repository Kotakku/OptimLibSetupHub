#include <iostream>
#include <string>
#include <filesystem>
#include <casadi/casadi.hpp>

int main()
{
    using namespace std;
    using namespace casadi;

    double inf = 1e20;
    double T = 10.0;
    int N = 2;

    MX x1 = MX::sym("x1");
    MX x2 = MX::sym("x2");
    MX x = vertcat(x1, x2);
    MX u = MX::sym("u");

    MX xdot = vertcat(x2, u);

    MX L = pow(x1, 2) + pow(x2, 2);

    Function F("F", {x, u}, {x + xdot, L});

    vector<MX> w, g;
    vector<double> lbw, ubw, lbg, ubg;
    vector<DM> w0;
    MX J = 0;

    vector<MX> Xs(N + 1), Us(N);

    for (int k = 0; k < N; ++k) {
        Xs[k] = MX::sym("X_" + to_string(k), 2);
        Us[k] = MX::sym("U_" + to_string(k));
    }
    Xs[N] = MX::sym("X_" + to_string(N), 2);

    for (int k = 0; k < N; ++k) {
        w.push_back(Xs[k]);
        {
            lbw.push_back(-inf);
            lbw.push_back(-inf);
            ubw.push_back(inf);
            ubw.push_back(inf);
            w0.push_back(0);
            w0.push_back(0);
        }

        w.push_back(Us[k]);
        lbw.push_back(-inf);
        ubw.push_back(inf);
        w0.push_back(0);

        // Calculate next state and objective contribution at this stage
        vector<MX> res = F(vector<MX>{Xs[k], Us[k]});
        MX xplus = res[0];
        MX l = res[1];
        J += l;

        // Add equality constraints for state evolution
        // Xs[k + 1] = MX::sym("X_" + to_string(k + 1), 2);
        g.push_back((xplus - Xs[k + 1]));
        lbg.push_back(0);
        lbg.push_back(0);
        ubg.push_back(0);
        ubg.push_back(0);

        // Add custom constraint
        g.push_back(0.1 * Xs[k](1) - 0.05 * Us[k]);
        lbg.push_back(-0.5 * k - 0.1);
        ubg.push_back(2);
    }

    // Final constraints and objectives
    // g.push_back(0.1 * Xs[N](1));
    // lbg.push_back(0.1);
    // ubg.push_back(2);

    J += mtimes(Xs[N].T(), Xs[N]);
    
    // Add final state to NLP variables
    w.push_back(Xs[N]);
    lbw.push_back(-inf);
    lbw.push_back(-inf);
    ubw.push_back(inf);
    ubw.push_back(inf);
    w0.push_back(0);
    w0.push_back(1);

    // Create an NLP solver
    MXDict prob = {{"x", vertcat(w)}, {"f", J}, {"g", vertcat(g)}};
    
    std::cout << MX(vertcat(w)) << std::endl;
    std::cout << w << std::endl;
    std::cout << vertcat(g) << std::endl;
    std::cout << J << std::endl;
    printf("tp1\n");
    std::cout << "\n" << prob << std::endl;

    Dict config;
    config["qpsol"] = "hpipm";

    // DM test_x(2,1), test_u(1,1);
    // for(size_t i = 0; i < 10; i++)
    // {
    //     test_u = 1;
    //     std::vector<DM> ret = F(vector<DM>{test_x, test_u});
    //     test_x = ret[0];
    //     std::cout << test_x << std::endl;
    // }

    // return;

    // MX testJ = pow(mtimes(Xs[0].T(), Xs[0])-Us[0], 2);


    printf("tp2\n");
    // MXDict test_prob = {{"x", vertcat(Xs[0], Us[0])}, {"f", testJ}};
    Function solver = nlpsol("solver", "ipopt", prob);

    printf("tp3\n");
    MXDict arg = MXDict{{"x0", vertcat(w0)}};
    auto sol = solver(arg);

    printf("tpe\n");

    return 0;
}