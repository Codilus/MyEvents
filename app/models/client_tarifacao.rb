class ClientTarifacao
  URL = "http://gestortarifacao.azurewebsites.net/api/tarifacao/addTarifacao"

  def self.addTarifacao(tarifacao)
    response = HTTP.post(URL, :json => tarifacao)
    if response.status.to_s == "200 OK" && response.body.to_s == "true"
      return true
    end

    false
  rescue
    false
  end


end
