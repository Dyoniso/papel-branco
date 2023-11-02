# Papel Branco
Um protótipo de Blog simples onde os artigos são escritos por inteligência artificial.

![image](https://github.com/Dyoniso/GPT-Overnews/assets/57969605/037d877a-c9f6-4d01-be0f-735f3b9ca750)
![image](https://github.com/Dyoniso/GPT-Overnews/assets/57969605/0fa037ec-45b7-49f8-bfea-f44345322a41)

## Como isso é Possível?
Uma vez que tenhamos esses artigos gerados, podemos armazená-los em um banco de dados, facilitando o planejamento de layouts e a renderização em todo o nosso site. É uma maneira eficaz de enriquecer o conteúdo e proporcionar uma experiência mais rica para nossos visitantes.

## Qual as tecnologias e frameworks utilizados?
1. Back-End - Node.js
2. Front - Pug.js Como framework de Renderização.
3. Banco de Dados - Postgres.
4. Bing Image Api - Api de busca de imagem do Bing.
5. GPT API - Api para geração dos artigos.

## Como posso baixar e instalar?
É bem simples, primeiro clone este repositório.
```
git clone https://github.com/Dyoniso/papel-branco
```

Após clonar, entre na pasta do repositório e instale os módulos do Node
```
npm install .
```

Crie um arquivo de configuração ```.env ``` com as seguintes variáveis:
```
#HTTP_SERVER
SERVER_PORT=4001 # Porta padrão do Servidor
SERVER_HOST=127.0.0.1 # Host Padrão do Servidor
SITE_URL=https://papelbranco.com.br # Dóminio ou Url do site

#IA CONFIG
ENABLE_SYNC=true # Habilitar sicronização de artigos quando iniciar o servidor
ENABLE_SAVE_FILES=false # Salvar arquivos obtidos pelo Bing no servidor. Caso negativo é utilizado a url de origem do arquivo

#DATABASE
# Credenciais de acesso ao banco Postgresql
DB_USER=#DB_USER#
DB_PASSWORD=#DB_PASS#
DB_HOST=#DB_HOST#
DB_PORT=5432
DB_DATABASE=Overnews

#API
PRICIPAL_THEME='' # Tema principal que a IA usará como guia. Exemplo: Caso o tema seja Programação, a IA escreverá artigos relacionados ao mesmo.
QTD_ARTICLES=10 # Quantidade de artigos por sicronização
QTD_KEYWORDS=5 # Quantidade de palavras chaves por artigos

#OPENAPI
OPENAI_API_KEY=#OPEN_API_KEY# # Chave API Open AI

#BING IMAGE API
BING_SUBSCRIPTION_KEY=#BING_IMAGE_API_KEY# # Chave API Bing Search Image

#CRON
CRON_SYNC_AI = 0 # Cronometró de sicronização padrão. Default: Toda meia noite. Suportado 0 à 24 horas 
```

## Restaurar Banco de Dados Postgresql

1. No Banco de Dados Crie um Banco com o Nome: ```Overnews```
2. Neste repositório entre na pasta: ```/api/database/backup```
3. Antes de restaurar o banco, instale a extensão: ```fuzzystrmatch```
   No Banco de Dados. ```CREATE EXTENSION fuzzystrmatch```
4. Restaure o arquivo de banco de daods ```11-02-2023.sql```
   Utilize o comando. ```pg_restore -d Overnews 11-02-2023.sql```

## Finalização
No Repositório, inicie o servidor Node: ```node app.js```, e aproveite o projeto!

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
