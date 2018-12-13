defmodule Dos42Web.SimulationController do
    use Dos42Web, :controller
  
    def index(conn, %{"num_nodes" => num_nodes, "num_transactions" => num_transactions}) do
      
      manager_pid = Process.whereis(Bitcoin.Manager)
      
      if (manager_pid !== nil) do
        GenServer.cast(Bitcoin.Manager, :reset)
        Process.unregister(Bitcoin.Manager)
        Process.exit(manager_pid, :kill)
        Bitcoin.Manager.init(:start)
      else
        Bitcoin.Manager.init(:start)
      end

      Bitcoin.Manager.simulate(num_nodes, num_transactions)

      conn

    end
  end
  