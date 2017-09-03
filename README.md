# URL's de la API

## Articulos:

### mostrar todos los articulos  
**/articles** 
HTTParty.get("#{base_uri}/articles", headers: {'Content-Type' => 'application/json',"Authorization" => "Token token=\"#{token_user}\""})

### guardar articulos
**/articles**
HTTParty.post("#{base_uri}/articles", body: { campos a guardar }.to_json, headers: {"Authorization" => "Token token=\"#{token_user}\"", 'Content-Type' => 'application/json' })

### show articulo
**/articles/:id**
HTTParty.get("#{base_uri}/articles/:id}", headers: {"Authorization" => "Token token=\"#{token_user}\""})

### editar articulo
**/article/:id**
HTTParty.patch("#{base_uri}/articles/:id}", body: { campos a guardar }.to_json, headers: {"Authorization" => "Token token=\"#{token_user}\"", 'Content-Type' => 'application/json' })

### eliminar articulo
**/article/:id**
HTTParty.delete("#{base_uri}/articles/:id}", headers: {"Authorization" => "Token token=\"#{token_user}\""})

### caculo total de articulos
**/total_articles/:id_article**
HTTParty.get("#{base_uri}/total_articles/:id_article", headers: {"Authorization" => "Token token=\"#{token_user}\""})

-------------------------------------------------------------------------------------------------------------------------

## Movimientos:

### mostrar todos los movimientos
**/movements**
HTTParty.get("#{base_uri}/movements", headers: {'Content-Type' => 'application/json',"Authorization" => "Token token=\"#{token_user}\""})

### guardar movimientos
**/movements**
HTTParty.post("#{base_uri}/movements", body: { campos a guadar }.to_json, headers: {"Authorization" => "Token token=\"#{token_user}\"", 'Content-Type' => 'application/json' })

### show movimiento
**/movements/:id**
HTTParty.get("#{base_uri}/movements/:id}", headers: {"Authorization" => "Token token=\"#{token_user}\""})

### editar movimiento
**/movements/:id**
HTTParty.patch("#{base_uri}/movements/#{params[:id]}", body: { campos a guardar }.to_json, headers: {"Authorization" => "Token token=\"#{token_user}\"", 'Content-Type' => 'application/json' })

### eliminar movimiento
**/movements/:id**
HTTParty.delete("#{base_uri}/movements/:id}", headers: {"Authorization" => "Token token=\"#{token_user}\""})