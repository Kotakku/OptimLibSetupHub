#include <chrono>
#include <iomanip>
#include <iostream>
#include <vector>

#include <crocoddyl/core/actions/lqr.hpp>
#include <crocoddyl/core/optctrl/shooting.hpp>
#include <crocoddyl/core/solvers/ddp.hpp>

int main()
{
    srand((unsigned int) time(0));

    // モデル
    std::cout << "model difinition" << std::endl;
    const boost::shared_ptr<crocoddyl::ActionModelAbstract>& model = \
        boost::make_shared<crocoddyl::ActionModelLQR>(4, 2, false);

    // 最適化問題
    std::cout << "problem difinition" << std::endl;
    std::size_t T = 20;
    Eigen::VectorXd x0 = model->get_state()->rand();
    x0[1] = 0;
    std::cout << x0 << std::endl;
    std::vector models(T,model);
    auto problem = boost::make_shared<crocoddyl::ShootingProblem>(x0, models, model);
    auto solver = boost::make_shared<crocoddyl::SolverDDP>(problem);

    // 初期値
    std::cout << "initial state difinition" << std::endl;
    const boost::shared_ptr<crocoddyl::StateAbstract>& state = model->get_state();
    std::vector<Eigen::VectorXd> xs;
    std::vector<Eigen::VectorXd> us;
    xs.push_back(x0);
    for (std::size_t i = 0; i < T; ++i) {
        const boost::shared_ptr<crocoddyl::ActionModelAbstract>& model =
            problem->get_runningModels()[i];
        xs.push_back(state->rand());
        us.push_back(Eigen::VectorXd::Random(model->get_nu()));
    }

    // 最適化計算
    std::cout << "solve" << std::endl;
    // bool is_valid = solver->solve();
    bool is_valid = solver->solve(xs, us);

    if(is_valid)
    {
        std::cout << "Success" << std::endl;

        // 最適化した経路を取得
        std::vector<Eigen::VectorXd> result_u = solver->get_us();
        std::vector<Eigen::VectorXd> result_x = solver->get_xs();

        std::cout << "last state" << std::endl;
        std::cout << result_x.back() << std::endl;
    }
    else
    {
        std::cout << "Fail" << std::endl;
    }
    
    return 0;
}
