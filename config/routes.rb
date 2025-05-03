Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  post("/insert_director", { :controller => "directors", :action => "create" })
  get("/delete_director/:an_id", { :controller => "directors", :action => "destroy" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post("/update_director/:an_id", { :controller => "directors", :action => "update" })


  get("/movies", { :controller => "movies", :action => "index" })
  post("/insert_movie", { :controller => "movies", :action => "create" })
  post("/update_movie/:an_id", { :controller => "movies", :action => "update" })

  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  get("/delete_movie/:an_id", { :controller => "movies", :action => "destroy" })

  
  get("/actors", { :controller => "actors", :action => "index" })
  post("/create_actor", { :controller => "actors", :action => "create" })
  post("/update_actor/:an_id", { :controller => "actors", :action => "update" })
  get("/delete_actor/:an_id", { :controller => "actors", :action => "destroy" })


  get("/actors/:path_id", { :controller => "actors", :action => "show" })
end
