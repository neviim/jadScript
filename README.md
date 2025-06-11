# gptdev

Este repositório possui um exemplo simples de script para enviar mensagens para um canal do Discord pela linha de comando.

## Como usar

1. Copie o arquivo `.env.example` para `.env` e preencha `DISCORD_TOKEN` e `DISCORD_CHANNEL_ID` com os valores corretos do seu bot e do canal/grupo no Discord.
   ```bash
   cp .env.example .env
   # edite o arquivo .env e preencha suas credenciais
   ```
2. Envie uma mensagem executando o script:
   ```bash
   ./send_discord_message.sh "Sua mensagem aqui"
   ```
   O script utiliza `curl` e `jq` para realizar a chamada à API do Discord.

Certifique-se de que o token configurado tem permissões de envio de mensagens no canal desejado.
