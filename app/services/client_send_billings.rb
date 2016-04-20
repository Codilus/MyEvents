class ClientSendBillings
  MODULE_ID = "7630315"

  def send_billings
    sync_user = 0
    @users = User.all


    @users.each do |user|
      next if user.current_usage.process_since_sync == 0

      if send_billing(user)
        sync_user += 1
        user.current_usage.mark_sync!
      end
    end

    sync_user
  end

  private

  def send_billing(user)
    tarifacao = {
      "Data": Time.now.to_s,
      "Item": "Requisições realizadas",
      "Quantidade": user.current_usage.process_since_sync.to_s,
      "UsuarioId": user.id.to_s,
      "ModuloId": MODULE_ID
    }

    ClientTarifacao.addTarifacao(tarifacao)
  end
end
