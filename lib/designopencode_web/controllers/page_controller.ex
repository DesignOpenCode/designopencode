defmodule DesignopencodeWeb.PageController do
  use DesignopencodeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
