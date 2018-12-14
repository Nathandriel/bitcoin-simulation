defmodule Dos42Web.SimulationController do
    use Dos42Web, :controller
  
    def index(conn, %{"num_nodes" => num_nodes, "num_transactions" => num_transactions}) do
      
      manager_pid = Process.whereis(Manager)
      
      if (manager_pid !== nil) do
        GenServer.cast(Bitcoin.Manager, :reset)
        Process.unregister(Manager)
        Process.exit(manager_pid, :kill)
        Bitcoin.Manager.start_link({[], []})
      else
        Bitcoin.Manager.start_link({[], []})
      end

      Bitcoin.Manager.simulate(num_nodes, num_transactions)


      IO.inspect "Simulation done"
      :timer.sleep(5000)

      {nonces, blockchain} = GenServer.call(Manager, :get_state)

      render(conn, "show.html", blockchain: blockchain)
      conn

    end
  end
  