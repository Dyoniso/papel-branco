# Papel Branco
Um protótipo de Blog simples onde os artigos são escritos por inteligência artificial.

![280048356-037d877a-c9f6-4d01-be0f-735f3b9ca750](https://github.com/Dyoniso/papel-branco/assets/57969605/3e609eed-db7a-43d5-bb98-f6d1ec7547c7)
![280064331-0fa037ec-45b7-49f8-bfea-f44345322a41](https://github.com/Dyoniso/papel-branco/assets/57969605/67c6b884-ae63-4ba9-9123-70202358d29d)

## Como isso é Possível?
Com a ajuda da API do ChatGPT, temos a capacidade de criar prompts sobre praticamente qualquer tópico. Com isso em mente, podemos solicitar que ele crie diversos artigos abordando diferentes temas e palavras-chave.

Uma vez que tenhamos esses artigos gerados, podemos armazená-los em um banco de dados, facilitando o planejamento de layouts e a renderização em todo o nosso site. É uma maneira eficaz de enriquecer o conteúdo e proporcionar uma experiência mais rica para nossos visitantes.

## Qual as Tecnologias e Frameworks utilizados?
1. Para o Back-End - Node.js.
2. Para o Front-End - Pug.js/Jade Como Framework de Renderização.
3. Para o Banco de Dados - Postgres.
4. Para a busca de imagem - Bing Image Api.
5. Para a geração de artigos - Open AI API.

## Como posso baixar e instalar?
É bem simples, primeiro clone este repositório.
```
git clone https://github.com/Dyoniso/papel-branco
```

Após clonar, entre no diretório e instale todos os módulos contidos no ```package.json```.
```
npm install .
```

Crie um arquivo ```.env ``` para a configuração do projeto. Siga o Modelo:
```
#HTTP_SERVER
SERVER_PORT=4001 # Porta padrão do Servidor.
SERVER_HOST=127.0.0.1 # Host padrão do Servidor.
SITE_URL=https://papelbranco.com.br # Domínio ou Url do Site.

#IA CONFIG
ENABLE_SYNC=true # Habilitar sicronização de artigos quando iniciar o Servidor.
ENABLE_SAVE_FILES=false # Salvar arquivos obtidos pelo Bing no servidor. Caso negativo é utilizado a url de origem do arquivo.

#DATABASE
# Credenciais para a conexão do Postgres
DB_USER=#DB_USER#
DB_PASSWORD=#DB_PASS#
DB_HOST=#DB_HOST#
DB_PORT=5432
DB_DATABASE=Overnews

#API
PRICIPAL_THEME='' # Tema principal que a IA usará como guia. Exemplo: Caso o tema seja Programação, a IA escreverá artigos relacionados ao mesmo.
QTD_ARTICLES=10 # Quantidade de artigos por sicronização.
QTD_KEYWORDS=5 # Quantidade de palavras chaves por artigos.

#OPENAPI
OPENAI_API_KEY=#OPEN_API_KEY# # Chave API Open AI

#BING IMAGE API
BING_SUBSCRIPTION_KEY=#BING_IMAGE_API_KEY# # Chave API Bing Search Image

#CRON
CRON_SYNC_AI = 0 # Cronômetro de sicronização padrão. Default: Toda meia noite. Suportado 0 à 24 horas 
```

## Restaurar Banco de Dados Postgresql

1. No Banco Crie um novo Database com o Nome: ```Overnews```
2. No Banco instale a extensão: ```fuzzystrmatch```
   ```CREATE EXTENSION fuzzystrmatch```
3. Entre na pasta: ```/api/database/backup``` e restaure o Database utilizando o arquivo ```11-02-2023.sql```
   Caso nessesário, utilize o comando. ```pg_restore -d Overnews 11-02-2023.sql```


## Finalização
Quase, lá!
Inicie o servidor Node com o comando ```node app.js```, e verifique nos logs se a conexão do banco, open-api, bing-image-api foi bem sucedida.

![280071974-90575cc7-ea56-40a9-af7d-f21361662c27](https://github.com/Dyoniso/papel-branco/assets/57969605/59a7a165-4ecc-4a1e-9121-3bb2caa4152b)
Sem mais, aproveite o projeto!

# Lista de Atualização:

## Todo List 09/02/2023

1. OK Simplificação dos Jobs, nesta nova atualização, terá um job por dia onde o mesmo irá iniciar a sicronização de artigos
2. OK Configuração de Artigos: Agora terá apenas uma configuração onde definirá o numero maximo de artigos
3. OK As categorias por agora será um wordlist de palavras aleatórias, para evitar que artigos sejam genericos e sem graça.
4. OK Limitador de carga para evitar o erro 429
5. OK Criar uma opção onde as imagens não sejam amazenadas no servidor

## Todo List 10/02/2023

1. OK Criar uma opção onde as imagens não sejam amazenadas no servidor
2. OK Otimizar imagens na página home
3. OK Otimizar sistema de busca de imagens. As imagens do artigos tem quer mais acertivos
4. OK Mudar sistema de KeyWords, Deixar as palavras chaves mais acertivas para as imagens

## Todo List 14/02/2023

1. OK Otimizar Layout da aplicação.
2. OK Criar logo para a aplicação.
3. OK Otimizar tema da aplicação.
4. OK Desenvolver um layout único para celular.
   
<p align="center"> <img style="width:50px" src="https://github.com/Dyoniso/papel-branco/assets/57969605/d457dd73-906c-4370-94e5-143225adafb9" /> </p>
